FROM maven:3.9.6-eclipse-temurin-17-alpine AS BUILD
WORKDIR /apps
COPY . .
RUN mvn package -DskipTests


FROM eclipse-temurin:17-jre-alpine
WORKDIR /run
COPY --from=BUILD /apps/target/sysfoo*.jar sysfoo.jar
EXPOSE 8080
CMD java -jar /run/sysfoo.jar
