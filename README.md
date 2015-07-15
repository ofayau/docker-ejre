# docker-ejre

* This project create docker images for Oracle Java SE Embedded 8u51.

* All image are based on Busybox with 32 bits (and 64 bits) libs (see docker-busybox-lib32).

* ejdk is the unzip version of ejdk-8u51-linux-i586.tar.gz available (with login) on [Oracle | http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html]

* Create a docker image for each profile (see Compact Profiles [JEP 161 | http://openjdk.java.net/jeps/161 ]) :
- ofayau/ejre:8-compact1
- ofayau/ejre:8-compact2
- ofayau/ejre:8-compact3
- ofayau/ejre:8-jre

* About size

```shell
REPOSITORY                   TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ofayau/ejre                  8-compact1          824a6f1a0ade        4 minutes ago       39.31 MB
ofayau/ejre                  8-compact3          a9fbe6b90034        4 minutes ago       48.79 MB
ofayau/openjdk-compact       8-compact1          ca87cefd33e5        27 hours ago        47.08 MB
ofayau/openjdk-compact       jre                 d57e311758e2        29 hours ago        66.38 MB
ofayau/j2me                  latest              f56c31b1cc20        26 hours ago        21.73 MB
```

