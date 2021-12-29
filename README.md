# SBHibernateShoppingCart

Create a Shopping Cart Web Application with Spring Boot, Hibernate
Code Soure: [url](https://o7planning.org/10683/create-a-shopping-cart-web-application-with-spring-boot-hibernate)

## How to run?

UserInfo
|User|Password|
|-----|-------|
|employee1|123|
|manager1|123|

### Prepare Database
In this project is MySQL version `5.1`
import SQL
```
mysql -u <user> -p <password> <DBName>  < mydatabase.sql
```
Remember add database user and password 
if database IP is not localhost also need change
In `src/main/resources/application.properties`
### Maven Wrapper
Go to root folder and type:
```
chmod +x mvnw
./mvnw spring-boot:run
```
#### Executable Jar
build Jar file 
```
./mvnw clean package
```
Then run the JAR file:
```
java -jar target/SbHibernateShoppingCart-0.0.1-SNAPSHOT.jar
```
### Maven
Open a terminal and run the following commands to ensure that you have valid versions of Java and Maven installed:
```
$ java -version
openjdk version "1.8.0_312"
OpenJDK Runtime Environment (build 1.8.0_312-8u312-b07-0ubuntu1~20.04-b07)
OpenJDK 64-Bit Server VM (build 25.312-b07, mixed mode)
```
```
$ mvn -v 
mvn -v
Apache Maven 3.6.3
Maven home: /usr/share/maven
Java version: 1.8.0_312, vendor: Private Build, runtime: /usr/lib/jvm/java-8-openjdk-amd64/jre
Default locale: en, platform encoding: UTF-8
OS name: "linux", version: "5.11.0-1022-azure", arch: "amd64", family: "unix"
```
#### Using Executable Jar
create an executable jar run:
```
$ mvn clean package
```
To run application, java -jar:
```
$ java -jar target/SbHibernateShoppingCart-0.0.1-SNAPSHOT.jar
```
Exit application, press Ctrl+C
# Dockerfile
Run java using Docker:
```
$ mvn clean package
$ docker build -t shopping-cart:1.0 .
```
Run docker container:
```
$ docker run -p 8080:8080 \
       -d --restart always \
       --name shopping-cart \
       shopping-cart:1.0
```
