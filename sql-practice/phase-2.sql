-- Drop tables with existing names

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS coffee_purchases;


-- Create tables

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    phone INTEGER(10) UNIQUE,
    email VARCHAR(255) UNIQUE,
    points INTEGER NOT NULL DEFAULT 5,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE coffee_purchases (
    id INTEGER [pk],
    is_redeemed BOOLEAN DEFAULT FALSE,
    ordered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

