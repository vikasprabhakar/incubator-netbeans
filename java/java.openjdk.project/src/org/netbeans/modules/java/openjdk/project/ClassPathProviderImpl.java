/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.netbeans.modules.java.openjdk.project;

import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarOutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;

import org.netbeans.api.java.classpath.ClassPath;
import org.netbeans.api.java.classpath.GlobalPathRegistry;
import org.netbeans.api.project.libraries.Library;
import org.netbeans.api.project.libraries.LibraryManager;
import org.netbeans.modules.java.openjdk.project.JDKProject.Root;
import org.netbeans.modules.java.openjdk.project.JDKProject.RootKind;
import org.netbeans.modules.parsing.spi.indexing.PathRecognizerRegistration;
import org.netbeans.spi.java.classpath.ClassPathImplementation;
import org.netbeans.spi.java.classpath.ClassPathProvider;
import org.netbeans.spi.java.classpath.FilteringPathResourceImplementation;
import org.netbeans.spi.java.classpath.PathResourceImplementation;
import org.netbeans.spi.java.classpath.support.ClassPathSupport;
import org.netbeans.spi.project.support.ant.PropertyEvaluator;
import org.openide.filesystems.FileObject;
import org.openide.filesystems.FileUtil;
import org.openide.modules.InstalledFileLocator;
import org.openide.modules.Places;
import org.openide.util.Exceptions;

/**
 *
 * @author lahvac
 */
public class ClassPathProviderImpl implements ClassPathProvider {

    private static final Logger LOG = Logger.getLogger(ClassPathProviderImpl.class.getName());
    private static final String[] JDK_CLASSPATH = new String[] {
        "${outputRoot}/jaxp/dist/lib/classes.jar",
        "${outputRoot}/corba/dist/lib/classes.jar",
    };
    
    private final ClassPath bootCP;
    private final ClassPath compileCP;
    private final ClassPath moduleCompileCP;
    private final ClassPath sourceCP;
    private final ClassPath testsCompileCP;
    private final ClassPath testsRegCP;

    public ClassPathProviderImpl(JDKProject project) {
        bootCP = ClassPath.EMPTY;
        
        File fakeJdk = InstalledFileLocator.getDefault().locate("modules/ext/fakeJdkClasses.zip", "org.netbeans.modules.java.openjdk.project", false);
        URL fakeJdkURL = null;
        if (fakeJdk != null) {
            fakeJdkURL = FileUtil.urlForArchiveOrDir(fakeJdk);
        }

        if (project.currentModule != null) {
            List<URL> compileElements = new ArrayList<>();
            Collection<String> dependencies = project.moduleRepository.allDependencies(project.currentModule);

            for (String dep : dependencies) {
                FileObject depFO = project.moduleRepository.findModuleRoot(dep);

                if (depFO == null)
                    continue; //!!!

                try {
                    compileElements.add(projectDir2FakeTarget(depFO));
                } catch (MalformedURLException ex) {
                    Exceptions.printStackTrace(ex);
                }
            }

            if (fakeJdkURL != null) {
                compileElements.add(fakeJdkURL);
            }

            compileCP = ClassPathSupport.createClassPath(compileElements.toArray(new URL[0]));
            List<FileObject> mp = new ArrayList<>();
            File fakeMPJars = Places.getCacheSubdirectory("org-netbeans-modules-jdk-project-JDKProject-module-path");
            for (ModuleDescription mod : project.moduleRepository.modules) {
                if (dependencies.contains(mod.name))
                    continue;
                File fakeJar = new File(fakeMPJars, mod.name + ".jar");
                if (!fakeJar.exists()) {
                    try (JarOutputStream jos = new JarOutputStream(new FileOutputStream(fakeJar))) {
                        jos.putNextEntry(new JarEntry("empty"));
                    } catch (IOException ex) {
                        Exceptions.printStackTrace(ex);
                        continue;
                    }
                }
                mp.add(FileUtil.getArchiveRoot(FileUtil.toFileObject(fakeJar)));
            }
            moduleCompileCP = ClassPathSupport.createProxyClassPath(compileCP, ClassPathSupport.createClassPath(mp.toArray(new FileObject[0])));
        } else {
            List<PathResourceImplementation> compileElements = new ArrayList<>();

            for (String cp : JDK_CLASSPATH) {
                compileElements.add(new JarBaseResourceImpl(cp, project.evaluator()));
            }
            
            compileCP = ClassPathSupport.createClassPath(compileElements);
            moduleCompileCP = ClassPath.EMPTY;
        }

        
        List<PathResourceImplementation> sourceRoots = new ArrayList<>();
        List<PathResourceImplementation> testsRegRoots = new ArrayList<>();
        
        for (Root root : project.getRoots()) {
            if (root.kind == RootKind.MAIN_SOURCES) {
                sourceRoots.add(new PathResourceImpl(root));
            } else if (root.kind == RootKind.TEST_SOURCES) {
                testsRegRoots.add(new PathResourceImpl(root));
            }
        }
        
        sourceCP = ClassPathSupport.createClassPath(sourceRoots);
        List<URL> testCompileRoots = new ArrayList<>();
        if (project.currentModule != null) {
            for (ModuleDescription mod : project.moduleRepository.modules) {
                FileObject depFO = project.moduleRepository.findModuleRoot(mod.name);

                if (depFO == null)
                    continue; //!!!

                try {
                    testCompileRoots.add(projectDir2FakeTarget(depFO));
                } catch (MalformedURLException ex) {
                    Exceptions.printStackTrace(ex);
                }
            }
        } else {
            try {
                testCompileRoots.add(project.getFakeOutput().toURL());
            } catch (MalformedURLException ex) {
                LOG.log(Level.FINE, null, ex);
            }
        }
        for (String libraryName : TEST_LIBRARIES) {
            Library library = LibraryManager.getDefault().getLibrary(libraryName);
            if (library != null) {
                testCompileRoots.addAll(library.getContent("classpath"));
            }
        }
        if (fakeJdkURL != null) {
            testCompileRoots.add(fakeJdkURL);
        }
        testsCompileCP = ClassPathSupport.createClassPath(testCompileRoots.toArray(new URL[0]));
        testsRegCP = ClassPathSupport.createClassPath(testsRegRoots);
    }

    private static final String[] TEST_LIBRARIES = new String[] {"testng", "junit_4"};

    private static URL projectDir2FakeTarget(FileObject projectDir) throws MalformedURLException {
        return FileUtil.getArchiveRoot(projectDir.toURI().resolve("fake-target.jar").toURL());
    }

    /**
     * Copied from JavaClassPathConstants, to avoid depending on a new version of it.
     */
    private static final String MODULE_COMPILE_PATH = "modules/compile";
    private static final String MODULE_CLASS_PATH = "modules/classpath";

    @Override
    public ClassPath findClassPath(FileObject file, String type) {
        if (sourceCP.findOwnerRoot(file) != null) {
            if (ClassPath.BOOT.equals(type)) {
                return bootCP;
            } else if (ClassPath.COMPILE.equals(type)) {
                return compileCP;
            } else if (ClassPath.SOURCE.equals(type)) {
                return sourceCP;
            } else if (MODULE_COMPILE_PATH.equals(type)) {
                return moduleCompileCP;
            }
        } else {
            if (file.isFolder()) return null;

            if (ClassPath.BOOT.equals(type)) {
                return ClassPath.EMPTY;
            } else if (ClassPath.COMPILE.equals(type) ||
                       MODULE_COMPILE_PATH.equals(type) ||
                       MODULE_CLASS_PATH.equals(type)) {
                return testsCompileCP;
            }

        }
        
        return null;
    }

    public ClassPath getSourceCP() {
        return sourceCP;
    }

    private static final boolean REGISTER_TESTS_AS_JAVA = Boolean.getBoolean("jdk.project.ClassPathProviderImpl");
    private static final String TEST_SOURCE = "jdk-project-test-source";

    public void registerClassPaths() {
        GlobalPathRegistry.getDefault().register(ClassPath.BOOT, new ClassPath[] {bootCP});
        GlobalPathRegistry.getDefault().register(ClassPath.COMPILE, new ClassPath[] {compileCP});
        GlobalPathRegistry.getDefault().register(ClassPath.SOURCE, new ClassPath[] {sourceCP});
        if (REGISTER_TESTS_AS_JAVA)
            GlobalPathRegistry.getDefault().register(ClassPath.SOURCE, new ClassPath[] {testsRegCP});
        GlobalPathRegistry.getDefault().register(TEST_SOURCE, new ClassPath[] {testsRegCP});
    }
    
    public void unregisterClassPaths() {
        GlobalPathRegistry.getDefault().unregister(ClassPath.BOOT, new ClassPath[] {bootCP});
        GlobalPathRegistry.getDefault().unregister(ClassPath.COMPILE, new ClassPath[] {compileCP});
        GlobalPathRegistry.getDefault().unregister(ClassPath.SOURCE, new ClassPath[] {sourceCP});
        if (REGISTER_TESTS_AS_JAVA)
            GlobalPathRegistry.getDefault().unregister(ClassPath.SOURCE, new ClassPath[] {testsRegCP});
        GlobalPathRegistry.getDefault().unregister(TEST_SOURCE, new ClassPath[] {testsRegCP});
    }

    @PathRecognizerRegistration(sourcePathIds=TEST_SOURCE)
    private static final class PathResourceImpl implements FilteringPathResourceImplementation, ChangeListener {

        private final Root root;
        private final PropertyChangeSupport pcs = new PropertyChangeSupport(this);

        public PathResourceImpl(Root root) {
            this.root = root;
            this.root.addChangeListener(this);
        }

        @Override
        public boolean includes(URL rootURL, String resource) {
            return root.excludes == null || !root.excludes.matcher(resource).matches();
        }

        @Override
        public URL[] getRoots() {
            return new URL[] { root.getLocation() };
        }

        @Override
        public ClassPathImplementation getContent() {
            return null;
        }

        @Override
        public void addPropertyChangeListener(PropertyChangeListener listener) {
            pcs.addPropertyChangeListener(listener);
        }

        @Override
        public void removePropertyChangeListener(PropertyChangeListener listener) {
            pcs.removePropertyChangeListener(listener);
        }

        @Override
        public void stateChanged(ChangeEvent e) {
            pcs.firePropertyChange(PROP_ROOTS, null, null);
        }

    }

    private static final class JarBaseResourceImpl implements PathResourceImplementation, PropertyChangeListener {

        private final PropertyChangeSupport pcs = new PropertyChangeSupport(this);
        private final String jar;
        private final PropertyEvaluator evaluator;
        private URL location;

        public JarBaseResourceImpl(String jar, PropertyEvaluator evaluator) {
            this.jar = jar;
            this.evaluator = evaluator;
        }

        @Override
        public synchronized URL[] getRoots() {
            if (location == null) {
                location = FileUtil.urlForArchiveOrDir(new File(evaluator.evaluate(jar)));
            }
            return new URL[] { location };
        }

        @Override
        public ClassPathImplementation getContent() {
            return null;
        }

        @Override
        public void addPropertyChangeListener(PropertyChangeListener listener) {
            pcs.addPropertyChangeListener(listener);
        }

        @Override
        public void removePropertyChangeListener(PropertyChangeListener listener) {
            pcs.removePropertyChangeListener(listener);
        }

        @Override
        public void propertyChange(PropertyChangeEvent evt) {
            synchronized (this) {
                location = null;
            }
            pcs.firePropertyChange(PROP_ROOTS, null, null);
        }

    }

}
