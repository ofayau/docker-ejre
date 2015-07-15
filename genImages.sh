#!/bin/sh

# Version
ejdk_zip=ejdk-8u51-linux-i586.tar.gz
ejdk=ejdk1.8.0_51

# unzip ejdk downloaded from Oracle.com
# Official depo (need login) : http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html
#echo "Unzip $ejdk_zip to $ejdk"
#gunzip -c $ejdk_zip | tar -x

# Generate & build docker image
for profile in compact1 compact2 compact3 jre; do
	echo "Generate docker image for $profile"
	docker build -t "ejre:8-$profile" -f Dockerfile.$profile .
done

# Clean unzip jdk
#rm -rf $ejdk

echo "All image were builded OK"

