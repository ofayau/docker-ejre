FROM ofayau/busybox-jvm

MAINTAINER Olivier Fayau

# Unzip Oracle Java SE Embedded Version %JRE% %PROFILE%
# About Compact Profiles (JEP 161) : http://openjdk.java.net/jeps/161
# Official depo (need login) : http://www.oracle.com/technetwork/java/embedded/embedded-se/downloads/index.html

#ADD %JRE%/linux_i586/%PROFILE%/ /usr/lib/jvm/%JRE%-%PROFILE%/
ADD . /usr/lib/jvm/%JRE%-%PROFILE%/

# symlink for $JAVA_HOME (/usr/lib/jvm/jre) 
RUN ln -s /usr/lib/jvm/%JRE%-%PROFILE% /usr/lib/jvm/jre
# symlink for linkage
RUN mkdir -p /usr/java && ln -s /usr/lib/jvm/jre /usr/java/packages

CMD ["java", "-version"]

