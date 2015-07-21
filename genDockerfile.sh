#!/bin/sh

# Version
ejdk_zip=ejdk-8u51-linux-i586.tar.gz
ejdk=ejdk1.8.0_51

# Generate docker files
for profile in compact1 compact2 compact3 jre; do
	echo "Generate Dockerfile for $ejdk $profile"
	# Create Dockerfile
	sed -e "s/%JRE%/$ejdk/g" -e "s/%PROFILE%/$profile/g" Dockerfile.tpl > ejdk/linux_i586/$profile/Dockerfile
	# Link current README.md	
	ln -sf ../../../README.md ejdk/linux_i586/$profile/
	# Create .dockerignore to ignore from copying
	#echo "Dockerfile" > ejdk/linux_i586/$profile/.dockerignore
	#echo "README.md" >> ejdk/linux_i586/$profile/.dockerignore
	cat > ejdk/linux_i586/$profile/.dockerignore <<- EOF
		Dockerfile
		README.md
	EOF
done

