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

package org.netbeans.modules.ide.ergonomics.fod;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Collection;
import java.util.Collections;
import java.util.concurrent.Callable;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.GroupLayout;
import javax.swing.GroupLayout.Alignment;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JEditorPane;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.LayoutStyle.ComponentPlacement;
import javax.swing.SwingUtilities;
import org.netbeans.api.autoupdate.InstallSupport;
import org.netbeans.api.autoupdate.OperationContainer;
import org.netbeans.api.autoupdate.UpdateElement;
import org.netbeans.api.progress.ProgressHandle;
import org.netbeans.api.progress.ProgressHandleFactory;
import org.netbeans.modules.autoupdate.ui.api.PluginManager;
import org.openide.awt.Mnemonics;
import org.openide.modules.SpecificationVersion;
import org.openide.util.Exceptions;
import org.openide.util.NbBundle;
import org.openide.util.RequestProcessor.Task;
import org.openide.util.TaskListener;

/**
 * Provider for fake web module extenders. Able to download and enable the proper module
 * as well as delegate to the proper configuration panel.
 *
 * @author Tomas Mysik
 * @author Pavel Flaska
 */
public class ConfigurationPanel extends JPanel implements Runnable {
    private static final long serialVersionUID = 27938464212508L;
    
    final DownloadProgressMonitor progressMonitor = new DownloadProgressMonitor();
    private FeatureInfo featureInfo;
    private Callable<JComponent> callable;
    private Collection<UpdateElement> featureInstall;

    public ConfigurationPanel(String displayName, final Callable<JComponent> callable, FeatureInfo info) {
        this(callable);
        setInfo(info, displayName, Collections.<UpdateElement>emptyList());
    }
    
    public ConfigurationPanel(final Callable<JComponent> callable) {
        assert EventQueue.isDispatchThread();
        initComponents();
        this.featureInfo = null;
        this.callable = callable;

        setError(" "); // NOI18N
    }

    public void setInfo(FeatureInfo info, String displayName, Collection<UpdateElement> toInstall) {
        this.featureInfo = info;
        this.featureInstall = toInstall;
        boolean activateNow = toInstall.isEmpty();
        if (activateNow) {
            infoLabel.setVisible(false);
            downloadLabel.setVisible(false);
            activateButton.setVisible(false);
            downloadButton.setVisible(false);
            activateButtonActionPerformed(null);
        } else {
            FeatureManager.logUI("ERGO_QUESTION", featureInfo.clusterName, displayName);
            infoLabel.setVisible(true);
            downloadLabel.setVisible(true);
            activateButton.setVisible(true);
            downloadButton.setVisible(true);
            SpecificationVersion jdk = new SpecificationVersion(System.getProperty("java.specification.version"));
            String lblDownloadMsg;
            if (jdk.compareTo(new SpecificationVersion(info.getExtraModulesRecommendedMinJDK())) < 0) {
                lblDownloadMsg = info.getExtraModulesRequiredText();
                activateButton.setEnabled(false);
            } else {
                lblDownloadMsg = info.getExtraModulesRecommendedText();
                activateButton.setEnabled(true);
            }
            String lblActivateMsg = NbBundle.getMessage(ConfigurationPanel.class, "LBL_EnableInfo", displayName);
            String btnActivateMsg = NbBundle.getMessage(ConfigurationPanel.class, "LBL_Enable");
            String btnDownloadMsg = NbBundle.getMessage(ConfigurationPanel.class, "LBL_Download");
            org.openide.awt.Mnemonics.setLocalizedText(infoLabel, lblActivateMsg);
            org.openide.awt.Mnemonics.setLocalizedText(activateButton, btnActivateMsg);
            org.openide.awt.Mnemonics.setLocalizedText(downloadLabel, lblDownloadMsg);
            org.openide.awt.Mnemonics.setLocalizedText(downloadButton, btnDownloadMsg);
        }
    }
    
    @Override
    public void removeNotify() {
        super.removeNotify();
        FeatureManager.logUI("ERGO_CLOSE");
    }

    void setError(String msg) {
        assert SwingUtilities.isEventDispatchThread ();
        errorLabel.setText(msg);
    }

    /** This method is called from within the constructor to
     * initialize the form.
-     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        errorLabel = BrokenProjectInfo.getErrorPane("dummy");
        infoLabel = new JLabel();
        activateButton = new JButton();
        progressPanel = new JPanel();
        downloadLabel = new JLabel();
        downloadButton = new JButton();

        Mnemonics.setLocalizedText(infoLabel, "dummy"); // NOI18N

        Mnemonics.setLocalizedText(activateButton, "dummy"); // NOI18N
        activateButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                activateButtonActionPerformed(evt);
            }
        });

        progressPanel.setLayout(new BoxLayout(progressPanel, BoxLayout.PAGE_AXIS));

        Mnemonics.setLocalizedText(downloadLabel, NbBundle.getMessage(ConfigurationPanel.class, "ConfigurationPanel.downloadLabel.text")); // NOI18N

        Mnemonics.setLocalizedText(downloadButton, NbBundle.getMessage(ConfigurationPanel.class, "ConfigurationPanel.downloadButton.text")); // NOI18N
        downloadButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                downloadButtonActionPerformed(evt);
            }
        });

        GroupLayout layout = new GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(layout.createParallelGroup(Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(Alignment.LEADING)
                    .addComponent(progressPanel, GroupLayout.DEFAULT_SIZE, 374, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(Alignment.LEADING)
                            .addComponent(errorLabel, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(downloadButton)
                                .addPreferredGap(ComponentPlacement.RELATED)
                                .addComponent(activateButton))
                            .addComponent(downloadLabel)
                            .addComponent(infoLabel))
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(layout.createParallelGroup(Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(errorLabel, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(ComponentPlacement.RELATED)
                .addComponent(infoLabel)
                .addPreferredGap(ComponentPlacement.UNRELATED)
                .addComponent(downloadLabel)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(Alignment.BASELINE)
                    .addComponent(activateButton)
                    .addComponent(downloadButton))
                .addGap(19, 19, 19)
                .addComponent(progressPanel, GroupLayout.DEFAULT_SIZE, 91, Short.MAX_VALUE)
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    public void run() {
        ModulesInstaller.installModules(progressMonitor, featureInfo, featureInstall);
    }

    private void activateButtonActionPerformed(ActionEvent evt) {//GEN-FIRST:event_activateButtonActionPerformed
        FeatureManager.logUI("ERGO_DOWNLOAD");
        activateButton.setEnabled(false);
        downloadButton.setEnabled(false);
        Task task = FeatureManager.getInstance().create(this);
        task.addTaskListener(new TaskListener() {

            public void taskFinished(org.openide.util.Task task) {
                if (!progressMonitor.error) {
                    SwingUtilities.invokeLater(new Runnable() {
                        private String msg;

                        public void run() {
                            ConfigurationPanel.this.removeAll();
                            ConfigurationPanel.this.setLayout(new BorderLayout());
                            try {
                                ConfigurationPanel.this.add(callable.call(), BorderLayout.CENTER);
                            } catch (Exception ex) {
                                // TODO: add warning panel
                                Exceptions.printStackTrace(ex);
                            }
                            ConfigurationPanel.this.invalidate();
                            ConfigurationPanel.this.revalidate();
                            ConfigurationPanel.this.repaint();
                            if (featureInfo != null && featureInfo.isPresent()) {
                                msg = NbBundle.getMessage(ConfigurationPanel.class, "MSG_EnableFailed");
                            } else {
                                msg = NbBundle.getMessage(ConfigurationPanel.class, "MSG_DownloadFailed");
                            }
                            setError(msg);
                            activateButton.setEnabled(true);
                            progressPanel.removeAll();
                            progressPanel.revalidate();
                            progressPanel.repaint();
                        }
                    });
                }
            }
        });
        task.schedule(0);
    }//GEN-LAST:event_activateButtonActionPerformed

    private void downloadButtonActionPerformed(ActionEvent evt) {//GEN-FIRST:event_downloadButtonActionPerformed
        OperationContainer<InstallSupport> op = OperationContainer.createForInstall();
        op.add(featureInstall);
        if (PluginManager.openInstallWizard(op)) {
            activateButtonActionPerformed(null);
        }
    }//GEN-LAST:event_downloadButtonActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private JButton activateButton;
    private JButton downloadButton;
    private JLabel downloadLabel;
    private JEditorPane errorLabel;
    private JLabel infoLabel;
    private JPanel progressPanel;
    // End of variables declaration//GEN-END:variables

    private final class DownloadProgressMonitor implements ProgressMonitor {
        private boolean error = false;

        public void onDownload(ProgressHandle progressHandle) {
            updateProgress(progressHandle);
        }

        public void onValidate(ProgressHandle progressHandle) {
            updateProgress(progressHandle);
        }

        public void onInstall(ProgressHandle progressHandle) {
            updateProgress(progressHandle);
        }

        public void onEnable(ProgressHandle progressHandle) {
            updateProgress(progressHandle);
        }

        private void updateProgress(final ProgressHandle progressHandle) {
            final JLabel tmpMainLabel = ProgressHandleFactory.createMainLabelComponent(progressHandle);
            final JComponent tmpProgressPanel = ProgressHandleFactory.createProgressComponent(progressHandle);
            SwingUtilities.invokeLater(new Runnable() {
                public void run() {
                    progressPanel.removeAll();
                    progressPanel.add(tmpMainLabel);
                    progressPanel.add(Box.createRigidArea(new Dimension(0, 5)));
                    progressPanel.add(tmpProgressPanel);
                    progressPanel.revalidate();
                    progressPanel.repaint();
                }
            });
        }

        public void onError(final String message) {
            error = true;
            SwingUtilities.invokeLater(new Runnable() {

                public void run() {
                    // TODO: mark as html
                    setError("<html>" + message + "</html>"); // NOI18N
                    progressPanel.removeAll();
                    progressPanel.add(errorLabel);
                }
            });
        }
    }
}
