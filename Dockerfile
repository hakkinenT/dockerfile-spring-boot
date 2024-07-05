FROM alpine:3.19.0

RUN apk add --no-cache openjdk21 && apk add --no-cache maven

ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk
ENV MAVEN_HOME=/usr/share/java/maven-3
ENV PATH="$JAVA_HOME/bin:$MAVEN_HOME/bin:${PATH}"

RUN mkdir app && mkdir app/src
COPY src /app/src
COPY pom.xml /app

WORKDIR /app
RUN mvn clean install

WORKDIR /app/target

EXPOSE 8080

CMD ["java", "-jar", "docker-maven-image-0.0.1-SNAPSHOT.jar"]