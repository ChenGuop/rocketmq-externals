#FROM java:8
FROM openjdk:8-jre
#FROM openjdk:8-jre-alpine
MAINTAINER ChenGuop
VOLUME /tmp
ADD rocketmq-console-ng-*.jar rocketmq-console-ng.jar
RUN sh -c 'touch /rocketmq-console-ng.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /rocketmq-console-ng.jar" ]
