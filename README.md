# docker-ejre

### About

This project create docker images for Oracle Java SE Embedded 8u51. 
These jre are very small because they're made for embedded system.
The drawbacks are they're 32 bits only and some doesn't contain every java package (see Compact Profiles [JEP 161](http://openjdk.java.net/jeps/161) ).

All image are based on Busybox with 32 bits (and 64 bits) libs (see project [docker-busybox-lib32](https://github.com/ofayau/docker-busybox-lib32) ).
The overhead on top of jre is around 8 MB.

The ejdk directory is the unzipped version of `ejdk-8u51-linux-i586.tar.gz` available (with login) on [Oracle](http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html)

There are a tagged image for each profile (see Compact Profiles [JEP 161](http://openjdk.java.net/jeps/161) ) :

- ofayau/ejre:8-compact1
- ofayau/ejre:8-compact2
- ofayau/ejre:8-compact3
- ofayau/ejre:8-jre

### About size

```shell
REPOSITORY                   TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ofayau/j2me                  latest              f56c31b1cc20        26 hours ago        21.73 MB
ofayau/ejre                  8-compact1          824a6f1a0ade        4 minutes ago       39.31 MB
ofayau/ejre                  8-compact2          9da39771057a        4 minutes ago       44.85 MB
ofayau/ejre                  8-compact3          a9fbe6b90034        4 minutes ago       48.79 MB
ofayau/ejre                  8-jre               d5ed29a4bf44        4 minutes ago       80.66 MB
ofayau/openjdk               8-compact1          f258bd30ec46        5 days ago          47.08 MB
ofayau/openjdk               8-compact2          dc125eeac09b        5 days ago          59.82 MB
ofayau/openjdk               8-compact3          b10fc16f53ea        5 days ago          66.38 MB
ofayau/openjdk               latest              fded935a77ed        5 days ago          115.1 MB
java                         8-jre               b0f21df5333b        5 months ago        478.7 MB
```

### Installation & Usage 

Download : 
```shell
docker pull ofayau/openjdk:8-compact2
```

Run :
```shell
docker run ofayau/openjdk:8-compact2 java -version
```

