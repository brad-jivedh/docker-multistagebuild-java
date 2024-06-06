FROM maven as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM opejdk 
WORKDIR /app1
COPY --from=build /app/target/*.jar ./*.jar
CMD ["java" , "-jar" , "*.jar"]
