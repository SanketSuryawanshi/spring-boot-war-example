FROM openjdk:17
WORKDIR /app
COPY target/*.war /app/my-application.war
CMD ["java","-jar","/app/my-application.war"]
EXPOSE 8080
