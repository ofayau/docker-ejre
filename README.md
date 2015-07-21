# docker-ejre

This project create docker images for `Oracle Java SE Embedded 8u51`.

There is an image for each "compact profile" (see [JEP 161](http://openjdk.java.net/jeps/161) ) : `compact1`, `compact2`, `compact3` and `jre` (=full SE)

These jre *are very small* because they're made for embedded system.

## Supported tags and respective `Dockerfile` links

There are a tagged image for each "compact profile" :

-	[`8-jre`, `latest` (*ejre/Dockerfile*)](https://github.com/ofayau/docker-ejre/blob/master/ejdk/linux_i586/jre/Dockerfile)
-	[`8-compact3` (*ejre/Dockerfile*)](https://github.com/ofayau/docker-ejre/blob/master/ejdk/linux_i586/compact3/Dockerfile)
-	[`8-compact2` (*ejre/Dockerfile*)](https://github.com/ofayau/docker-ejre/blob/master/ejdk/linux_i586/compact2/Dockerfile)
-	[`8-compact1` (*ejre/Dockerfile*)](https://github.com/ofayau/docker-ejre/blob/master/ejdk/linux_i586/compact1/Dockerfile)

## Details

### What are these?

All image are based on Busybox with 32 bits (and 64 bits) libs (see project [docker-busybox-lib32](https://github.com/ofayau/docker-busybox-lib32) ).

You can still navigate inside container or develop some shell scripting.

The overhead on top of a jre is around 8 MB.

### Size matters

The biggest advantage of these image are their size : only 40 MB for a "compact" edition and 80 MB for a full SE jre.

It's 6 or 12 times smaller than the official java image (headfull and based on a full Debian) !

Here is a list of some java image.

```shell
REPOSITORY                  TAG          IMAGE ID        CREATED         VIRTUAL SIZE
ofayau/j2me                 latest       f56c31b1cc20    26 hours ago    21.73 MB
ofayau/ejre                 8-compact1   824a6f1a0ade    4 minutes ago   39.31 MB
ofayau/ejre                 8-compact2   9da39771057a    4 minutes ago   44.85 MB
ofayau/ejre                 8-compact3   a9fbe6b90034    4 minutes ago   48.79 MB
ofayau/ejre                 8-jre        d5ed29a4bf44    4 minutes ago   80.66 MB
ofayau/openjdk              8-compact1   f258bd30ec46    5 days ago      47.08 MB
ofayau/openjdk              8-compact2   dc125eeac09b    5 days ago      59.82 MB
ofayau/openjdk              8-compact3   b10fc16f53ea    5 days ago      66.38 MB
ofayau/openjdk              8-jre        fded935a77ed    5 days ago      115.1 MB
frolvlad/alpine-oraclejdk8  latest       8e87306ea37d    7 weeks ago     170.4 MB
jeanblanchard/busybox-java  8            f9b532dbdd9f    3 months ago    162 MB
java                        8-jre        b0f21df5333b    5 months ago    478.7 MB
```

### Drawback

- truncated jre : "compact profiles" doesn't contain every java package. Only `8-jre` is considered as full SE (but still headless).

- 32 bits only : you can't run 64 bits code.

- JRE, not JDK : hence there is no compiler (`javac`) included, only runtime executor (`java`). You have to compile somewhere else (i.e. a standard jdk 8).


## License

- *Busybox* : see [license information](http://www.busybox.net/license.html).

- *Debian libc-i386* : see [licence](http://ftp-master.metadata.debian.org/changelogs//main/g/glibc/glibc_2.19-18_copyright) of [debian package](https://packages.debian.org/jessie/libc6-i386).

- *Oracle and Java* : see [OTN licence](http://www.oracle.com/technetwork/licenses/standard-license-152015.html).

Oracle and Java are registered trademarks of Oracle and/or its affiliates.

The Java softwares (jdk or jre) belong to Oracle and this redistribution is not for commercial use.

The ejdk directory is the unzipped version of `ejdk-8u51-linux-i586.tar.gz` available (with login) on [Oracle](http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html)


## Installation & Usage

Download or update tagged images : 
```shell
docker pull ofayau/ejre:8-compact1
docker pull ofayau/ejre:8-compact2
docker pull ofayau/ejre:8-compact3
docker pull ofayau/ejre:8-jre
docker pull ofayau/ejre:latest
```

Showing java version of every image :
```shell
# docker run --rm -it ofayau/ejre:8-compact1 java -version
java version "1.8.0_51"
Java(TM) SE Embedded Runtime Environment (build 1.8.0_51-b07, profile compact1, headless)
Java HotSpot(TM) Embedded Server VM (build 25.51-b07, mixed mode)

# docker run --rm -it ofayau/ejre:8-compact2 java -version
java version "1.8.0_51"
Java(TM) SE Embedded Runtime Environment (build 1.8.0_51-b07, profile compact2, headless)
Java HotSpot(TM) Embedded Server VM (build 25.51-b07, mixed mode)

# docker run --rm -it ofayau/ejre:8-compact3 java -version
java version "1.8.0_51"
Java(TM) SE Embedded Runtime Environment (build 1.8.0_51-b07, profile compact3, headless)
Java HotSpot(TM) Embedded Server VM (build 25.51-b07, mixed mode)

# docker run --rm -it ofayau/ejre:8-jre java -version
java version "1.8.0_51"
Java(TM) SE Embedded Runtime Environment (build 1.8.0_51-b07, headless)
Java HotSpot(TM) Embedded Server VM (build 25.51-b07, mixed mode)
```

Simple runs 
```shell
# Run a fat jar from current dir
docker run --rm -v "$PWD":/tmp/myapp -w /tmp/myapp ofayau/ejre java -jar myFatJar.jar
```

Compile a class for compact1
```shell
# Compile with jdk 8 (outside container)
javac -profile compact1 HelloWorld.java
# Run a "HelloWorld" class from current dir
docker run --rm -v "$PWD":/tmp/myapp -w /tmp/myapp ofayau/ejre java HelloWorld.class
```

