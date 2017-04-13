# Hair Salon App  
This is an application using Ruby, Sinatra, and PostgreSQL.  
The aim of the project was to demonstrate CRUD functionality  
while utilizing a one to many database relationship.

In order to set up a database for this project, run the following commands in PSQL:
```
CREATE DATABASE hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```

Afterwards simply run the app.rb file in terminal and go to   
your local host port in order to view this project first-hand!
