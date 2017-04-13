# _hair-salon_

##### This application is designed to show a one-to-many relationship between stylists (one) and clients (many) using PSQL.

## Technologies Used

Application: Ruby, Sinatra, psql<br>
Testing: Rspec, Capybara<br>
Database: Postgres

Installation
------------

```
$ git clone https://github.com/JulieChristine/hair-salon.git
```

Install required gems:
```
$ bundle install
```

Create databases:

1. Type psql on your terminal to connect to the server:

```
psql.
```

2. Create databases and the following tables:

```
CREATE DATABASE hair-salon;
  CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
  CREATE TABLE clients (id serial PRIMARY KEY, name_client varchar);
```

3. To run the spec create the following database:

```
CREATE DATABASE hair-salon_test WITH TEMPLATE hair-salon;
```

Start the webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in browser.
