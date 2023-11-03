# Basic Phase 1: Database Schema

In this phase, you will practice designing a database schema in a database
schema visualizer of your choice.

## Instructions

Design a database schema in a database schema visualizer of your choice for
the following scenario:

You are a coffee shop owner that wants to create a customer loyalty program.
For each coffee that a customer purchases, they get 1 point. When a customer
first joins the program, they automatically get loaded with 5 points. They can
use 10 points to redeem a free coffee. You want to record the name of the
customer and an optional two forms of contact with the customer. You also want
to keep track of when each coffee was purchased or redeemed.

customers
customer_id, integer, primary key, autoincrement
name, varchar(100)
contact_method_1, varchar(100)
contact_method_2, varchar(100)
loyalty_points, integer, default value = 5

coffee purchases
coffee_id, integer, primary key, autoincrement
customer_id, integer, foreign key
purchase_date, varchar(50) -> date type possible, need to do more research on this