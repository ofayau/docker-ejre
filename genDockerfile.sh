#!/bin/sh

# Version
ejdk_zip=ejdk-8u51-linux-i586.tar.gz
ejdk=ejdk1.8.0_51

# Generate docker files
for profile in compact1 compact2 compact3 jre; do
	echo "Generate Dockerfile for $profile"
	sed -e "s/%JRE%/$ejdk/g" -e "s/%PROFILE%/$profile/g" Dockerfile.tpl > Dockerfile.$profile
done

