FROM maven as build
WORKDIR /app
COPY . .
RUN mvn clean install
CMD ["java", "-jar", "app.jar"]
