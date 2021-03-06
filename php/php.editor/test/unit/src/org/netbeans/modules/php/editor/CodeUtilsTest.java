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
package org.netbeans.modules.php.editor;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.netbeans.junit.NbTestCase;

public class CodeUtilsTest extends NbTestCase {

    public CodeUtilsTest(String name) {
        super(name);
    }

    public void testCommonNamespacePrefix() {
        assertEquals("\\A\\B\\", CodeUtils.getCommonNamespacePrefix("A\\B\\C\\fc", "A\\B\\fb"));
        assertEquals("\\A\\B\\", CodeUtils.getCommonNamespacePrefix("A\\B\\C\\fc", "\\A\\B\\fb"));
        assertEquals("\\A\\", CodeUtils.getCommonNamespacePrefix("A\\B\\fce", "A\\Bfce"));
        assertEquals("\\A\\", CodeUtils.getCommonNamespacePrefix("A\\B", "A\\fa"));
        assertEquals("\\A\\", CodeUtils.getCommonNamespacePrefix("A\\B", "A\\"));
        assertEquals("\\A\\", CodeUtils.getCommonNamespacePrefix("A\\B", "\\A\\"));
        assertEquals(null, CodeUtils.getCommonNamespacePrefix("\\A\\", "\\B\\"));
        assertEquals(null, CodeUtils.getCommonNamespacePrefix("A\\", "A"));
        assertEquals(null, CodeUtils.getCommonNamespacePrefix("A\\B", "AB\\fb"));
        assertEquals(null, CodeUtils.getCommonNamespacePrefix("A\\B", "AB\\"));
        assertEquals(null, CodeUtils.getCommonNamespacePrefix("cat", "car"));
        assertEquals(null, CodeUtils.getCommonNamespacePrefix("cat", "dog"));
        assertEquals(null, CodeUtils.getCommonNamespacePrefix("", "dog"));
    }

    public void testFullyQualifyNamespace() {
        assertEquals("\\A\\MyCls", CodeUtils.fullyQualifyNamespace("\\A\\MyCls"));
        assertEquals("\\A\\MyCls", CodeUtils.fullyQualifyNamespace("A\\MyCls"));
        assertEquals("", CodeUtils.fullyQualifyNamespace(""));
    }

    public void testCommonNamespacePrefixes0() {
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(Collections.emptyList());
        assertEquals(0, prefixes.size());
    }

    public void testCommonNamespacePrefixes1() {
        List<String> strings = Arrays.asList(
                "A\\B\\C\\fc",
                "A\\B\\fb",
                "A\\fa",
                "X\\fx");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(1, prefixes.size());
        assertEquals("\\A\\", prefixes.get(0));
    }

    public void testCommonNamespacePrefixes2() {
        List<String> strings = Arrays.asList(
                "A\\B\\C\\fc",
                "A\\B\\fb",
                "X\\fx");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(1, prefixes.size());
        assertEquals("\\A\\B\\", prefixes.get(0));
    }

    public void testCommonNamespacePrefixes3() {
        List<String> strings = Arrays.asList(
                "\\A\\B\\C\\fc",
                "A\\B\\fb",
                "X\\Y\\fy",
                "X\\fx");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(2, prefixes.size());
        assertEquals("\\A\\B\\", prefixes.get(0));
        assertEquals("\\X\\", prefixes.get(1));
    }

    public void testCommonNamespacePrefixes4() {
        List<String> strings = Arrays.asList(
                "A\\B\\C\\D\\fa",
                "A\\B\\C\\D\\fd",
                "A\\B\\C\\D\\fdd",
                "A\\B\\C\\fc",
                "\\A\\B\\C\\fc2",
                "A\\B\\fb",
                "A\\B\\fb1",
                "B\\fb1",
                "XY\\fxy",
                "X\\Y\\fy1",
                "X\\Y\\fy",
                "X\\fx",
                "Y\\fy");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(2, prefixes.size());
        assertEquals("\\A\\B\\", prefixes.get(0));
        assertEquals("\\X\\", prefixes.get(1));
    }

    public void testCommonNamespacePrefixes5() {
        List<String> strings = Arrays.asList(
                "MyClass",
                "A\\MyClass");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(0, prefixes.size());
    }

    public void testCommonNamespacePrefixes6() {
        List<String> strings = Arrays.asList(
                "MyClass",
                "A\\MyClass",
                "A\\MyOtherClass");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(1, prefixes.size());
        assertEquals("\\A\\", prefixes.get(0));
    }

    public void testCommonNamespacePrefixes7() {
        List<String> strings = Arrays.asList(
                "MyClass",
                "A\\MyClass",
                "B\\MyClass",
                "C\\MyClass");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(0, prefixes.size());
    }

    public void testCommonNamespacePrefixes8() {
        List<String> strings = Arrays.asList(
                "\\MyClass",
                "\\A\\MyClass",
                "\\A\\MyOtherClass");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(1, prefixes.size());
        assertEquals("\\A\\", prefixes.get(0));
    }

    public void testCommonNamespacePrefixes9() {
        List<String> strings = Arrays.asList(
                "\\MyClass",
                "\\A\\MyClass",
                "\\B\\MyClass",
                "\\C\\MyClass");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(0, prefixes.size());
    }

    public void testCommonNamespacePrefixes10() {
        List<String> strings = Arrays.asList(
                "A\\B\\C\\fc",
                "\\A\\B\\fb",
                "A\\fa",
                "X\\fx");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(1, prefixes.size());
        assertEquals("\\A\\", prefixes.get(0));
    }

    public void testCommonNamespacePrefixes11() {
        List<String> strings = Arrays.asList(
                "\\MyClass",
                "\\A\\MyClass",
                "B\\MyClass",
                "\\C\\MyClass");
        List<String> prefixes = CodeUtils.getCommonNamespacePrefixes(strings);
        assertEquals(0, prefixes.size());
    }

}
