#https://hub.docker.com/r/nimmis/java-centos
FROM nimmis/java-centos:openjdk-8-jdk

# Refer to Maven build -> finalName
ARG JAR_FILE=target/com.spring-boot.demo-0.0.1-SNAPSHOT.jar

# cd /opt/app
WORKDIR /opt/app

# cp target/spring-boot-web.jar /opt/app/app.jar ,Renamed it to app.jar
COPY ${JAR_FILE} app.jar

# java -jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","app.jar"]