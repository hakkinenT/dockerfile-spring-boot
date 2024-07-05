FROM alpine:3.19.0 AS build

RUN apk add --no-cache maven
ENV MAVEN_HOME=/usr/share/java/maven-3
ENV PATH="$MAVEN_HOME/bin:${PATH}"

RUN mkdir app && mkdir app/src
COPY src /app/src
COPY pom.xml /app

WORKDIR /app
RUN mvn clean install

FROM alpine:3.19.0

RUN apk add --no-cache openjdk21

ENV JAVA_HOME=/usr/lib/jvm/java-21-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

RUN mkdir app

COPY --from=build /app/target/docker-maven-image-0.0.1-SNAPSHOT.jar /app/app.jar

WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]