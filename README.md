# docker-ejre

This project create docker images for Oracle Java SE Embedded 8u51.

There is an image for each "compact profile" (see [JEP 161](http://openjdk.java.net/jeps/161) ) : `compact1`, `compact2`, `compact3` and `jre` (=full headless)

These images are `jre` not `jdk` : hence there is no compiler (`javac`), only runtime executor (`java`).

### Supported tags and respective `Dockerfile` links

There are a tagged image for each "compact profile" :

-	[`8-jre`, `latest` (*ejre/Dockerfile*)](https://github.com/ofayau/docker-ejre/blob/master/ejdk/linux_i586/jre/Dockerfile)
-	[`8-compact3` (*ejre/Dockerfile*)](https://github.com/ofayau/docker-ejre/blob/master/ejdk/linux_i586/compact3/Dockerfile)
-	[`8-compact2` (*ejre/Dockerfile*)](https://github.com/ofayau/docker-ejre/blob/master/ejdk/linux_i586/compact2/Dockerfile)
-	[`8-compact1` (*ejre/Dockerfile*)](https://github.com/ofayau/docker-ejre/blob/master/ejdk/linux_i586/compact1/Dockerfile)

### Embedded

These jre are very small because they're made for embedded system.
The drawbacks are they're 32 bits only and some doesn't contain every java package (=subset of full jre).

All image are based on Busybox with 32 bits (and 64 bits) libs (see project [docker-busybox-lib32](https://github.com/ofayau/docker-busybox-lib32) ).
The overhead on top of jre is around 8 MB.

### About size

```shell
REPOSITORY           TAG          IMAGE ID        CREATED         VIRTUAL SIZE
ofayau/j2me          latest       f56c31b1cc20    26 hours ago    21.73 MB
ofayau/ejre          8-compact1   824a6f1a0ade    4 minutes ago   39.31 MB
ofayau/ejre          8-compact2   9da39771057a    4 minutes ago   44.85 MB
ofayau/ejre          8-compact3   a9fbe6b90034    4 minutes ago   48.79 MB
ofayau/ejre          8-jre        d5ed29a4bf44    4 minutes ago   80.66 MB
ofayau/openjdk       8-compact1   f258bd30ec46    5 days ago      47.08 MB
ofayau/openjdk       8-compact2   dc125eeac09b    5 days ago      59.82 MB
ofayau/openjdk       8-compact3   b10fc16f53ea    5 days ago      66.38 MB
ofayau/openjdk       8-jre        fded935a77ed    5 days ago      115.1 MB
java                 8-jre        b0f21df5333b    5 months ago    478.7 MB
```

# License

- Busybox : see [license information](http://www.busybox.net/license.html).
- Debian libc-i386 : see [debian glibc](https://packages.debian.org/jessie/libc6-i386)
- Oracle and Java : see [OTN licence](http://www.oracle.com/technetwork/licenses/standard-license-152015.html).
Oracle and Java are registered trademarks of Oracle and/or its affiliates.
The Java softwares (jdk or jre) belong to Oracle and this redistribution is not for commercial use.
The ejdk directory is the unzipped version of `ejdk-8u51-linux-i586.tar.gz` available (with login) on [Oracle](http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html)

### Installation & Usage

Download/update `compact3` : 
```shell
docker pull ofayau/ejre:8-compact3
```

Run :
```shell
docker run ofayau/ejre:8-compact2 java -version
```

Samples by showing version
```shell
$ docker run --rm -it ofayau/ejre:8-compact1 java -version
java version "1.8.0_51"
Java(TM) SE Embedded Runtime Environment (build 1.8.0_51-b07, profile compact1, headless)
Java HotSpot(TM) Embedded Server VM (build 25.51-b07, mixed mode)
$ docker run --rm -it ofayau/ejre:8-compact2 java -version
java version "1.8.0_51"
Java(TM) SE Embedded Runtime Environment (build 1.8.0_51-b07, profile compact2, headless)
Java HotSpot(TM) Embedded Server VM (build 25.51-b07, mixed mode)
$ docker run --rm -it ofayau/ejre:8-compact3 java -version
java version "1.8.0_51"
Java(TM) SE Embedded Runtime Environment (build 1.8.0_51-b07, profile compact3, headless)
Java HotSpot(TM) Embedded Server VM (build 25.51-b07, mixed mode)
$ docker run --rm -it ofayau/ejre:8-jre java -version
java version "1.8.0_51"
Java(TM) SE Embedded Runtime Environment (build 1.8.0_51-b07, headless)
Java HotSpot(TM) Embedded Server VM (build 25.51-b07, mixed mode)
```

