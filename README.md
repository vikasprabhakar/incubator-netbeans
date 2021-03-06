<!--

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

-->

# Apache NetBeans

Apache NetBeans is an open source development environment, tooling platform, and application framework.

### Build status
   * TravisCI:
     * [![Build Status](https://travis-ci.org/apache/incubator-netbeans.svg?branch=master)](https://travis-ci.org/apache/incubator-netbeans)
   * Apache Jenkins: 
     * Linux: [![Build Status](https://builds.apache.org/job/incubator-netbeans-linux/badge/icon)](https://builds.apache.org/job/incubator-netbeans-linux/)
     * Windows: [![Build Status](https://builds.apache.org/job/incubator-netbeans-windows/badge/icon)](https://builds.apache.org/job/incubator-netbeans-windows/)

### Requirements

  * Git
  * Ant 1.9.9 or above
  * Oracle JDK 8 or OpenJDK 8 (to build NetBeans)
  * Oracle JDK 9 or OpenJDK 9 (to run NetBeans)

**Note:** NetBeans also runs with JDK 8, although then it will not include tools for the JDK 9 Shell.

**Note:** NetBeans license violation checks are managed via the [rat-exclusions.txt](https://github.com/apache/incubator-netbeans/blob/master/nbbuild/rat-exclusions.txt) file.

### Building NetBeans

Bulid with the default config (See the [cluster.config](https://github.com/apache/incubator-netbeans/blob/ab66c7fdfdcbf0bde67b96ddb075c83451cdd1a6/nbbuild/cluster.properties#L19) property.)
```
$ ant
```
Build the basic project (mainly, JavaSE features):
```
$ ant -Dcluster.config=basic
```
Build the full project (including Groovy, PHP, JavaEE/JakartaEE, and JavaScript features):
```
$ ant -Dcluster.confg=full
```
Build the NetBeans Platform:
```
$ ant -Dcluster.config=platform
```

**Note:** You can also use `php`, `enterprise`, e.t.c. See the [cluster.properties](https://github.com/apache/incubator-netbeans/blob/master/nbbuild/cluster.properties) file.

### Running NetBeans

Run the build:
```
$ ant tryme
```

**Note:** Look in nbbuild/netbeans for the NetBeans installation created by the build process.

### Get In Touch

[Subscribe](mailto:users-subscribe@netbeans.incubator.apache.org) or [mail](mailto:users@netbeans.incubator.apache.org) the [users@netbeans.incubator.apache.org](mailto:users@netbeans.incubator.apache.org) list - Ask questions, find answers, and also help other users.

[Subscribe](mailto:dev-subscribe@netbeans.incubator.apache.org) or [mail](mailto:dev@netbeans.incubator.apache.org) the [dev@netbeans.incubator.apache.org](mailto:dev@netbeans.incubator.apache.org) list - Join developement discussions, propose new ideas and connect with contributors.

### Download

Developer builds can be downloaded: https://builds.apache.org/job/incubator-netbeans-linux.

Convenience binary of released source artifacts: https://netbeans.apache.org/download/index.html.

### Reporting Bugs

Bugs should be reported to https://issues.apache.org/jira/projects/NETBEANS/issues/

### Full History

The origins of the code in this repository are older than its Apache existence.
As such significant part of the history (before the code was donated to Apache)
is kept in an independent repository. To fully understand the code
you may want to merge the modern and ancient versions together:

```bash
$ git clone https://github.com/apache/incubator-netbeans.git
$ cd incubator-netbeans
$ git log uihandler/arch.xml
```

This gives you just few log entries including the initial checkin and
change of the file headers to Apache. But then the magic comes:

```bash
$ git remote add emilian https://github.com/emilianbold/netbeans-releases.git
$ git fetch emilian # this takes a while, the history is huge!
$ git replace 6daa72c98 32042637 # the 1st donation
$ git replace 6035076ee 32042637 # the 2nd donation
```

When you search the log, or use the blame tool, the full history is available:

```bash
$ git log uihandler/arch.xml
$ git blame uihandler/arch.xml
```

Many thanks to Emilian Bold who converted the ancient history to his
[Git repository](https://github.com/emilianbold/netbeans-releases)
and made the magic possible!
