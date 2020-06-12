FROM centos
EXPOSE 8080:8080

RUN set -x \
  && yum  update -y && yum install -y \
    make \
    wget \
    python3 \
    curl \
    jq \
    maven \
    python3-pip \
    python3-setuptools\
    java-11
STOPSIGNAL SIGUSR1

COPY spring-boot-web-0.0.1-SNAPSHOT.jar /


ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.7.10-1.el8_1.x86_64/
ENV PATH $JAVA_HOME/bin:$PATH
#RUN set -x \
  #  && java -jar spring-boot-web-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar", "spring-boot-web-0.0.1-SNAPSHOT.jar"]
#COPY test.sh /
#ENTRYPOINT ["/test.sh"]
