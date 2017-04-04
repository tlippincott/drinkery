CREATE DATABASE drinkery;

\c drinkery

CREATE TABLE users (
    id              SERIAL PRIMARY KEY,
    username        VARCHAR(255),
    password_digest VARCHAR(255));

CREATE TABLE liquors (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(255));


CREATE TABLE mixers (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(255));

CREATE TABLE drinks (
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(255));

CREATE TABLE liquor_ingredients (
    drink_id    INT REFERENCES drinks(id),
    liquor_id   INT REFERENCES liquors(id),
    measure     VARCHAR(255));

CREATE TABLE mixer_ingredient (
    drink_id    INT REFERENCES drinks(id),
    mixer_id    INT REFERENCES mixers(id),
    measure     VARCHAR(255));

CREATE TABLE favorites (
    user_id     INT,
    drink_id    INT);
