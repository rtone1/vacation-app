psql

CREATE DATABASE vacation_vacation;
\c vacation_vacation;

CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(255));

CREATE TABLE locations (id SERIAL PRIMARY KEY, name VARCHAR(255));

CREATE TABLE visits (id SERIAL PRIMARY KEY, miles_traveled INTEGER, user_id INTEGER REFERENCES users(id), location_id INTEGER REFERENCES locations(id));
