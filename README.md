First, extract the project and load the Gradle project in Intellij. 

Second, use the 'database.sql' file and run the sql file in your MySQL shell prompt. (command - source C:/path_to_the_sql_file/database.sql )

Third, download the Postman REST client and import the 'postman_collection.json' file in your rest client.

Database.sql file has the tables and schema. Its populated with dummy data.

After loading DB, build the project. 
gradlew build. 
java -jar build/libs/restaurant-backend-0.1.0.jar