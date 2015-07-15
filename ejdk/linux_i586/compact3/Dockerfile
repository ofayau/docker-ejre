FROM ofayau/busybox-jvm

MAINTAINER Olivier Fayau

# Unzip Oracle Java SE Embedded Version ejdk1.8.0_51 compact3
# About Compact Profiles (JEP 161) : http://openjdk.java.net/jeps/161
# Official depo (need login) : http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html

#ADD ejdk1.8.0_51/linux_i586/compact3/ /usr/lib/jvm/ejdk1.8.0_51-compact3/
ADD . /usr/lib/jvm/ejdk1.8.0_51-compact3/
RUN ln -s /usr/lib/jvm/ejdk1.8.0_51-compact3 /usr/lib/jvm/jre

