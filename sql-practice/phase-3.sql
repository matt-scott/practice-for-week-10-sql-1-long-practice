-- Run phase-2 to clear tables and start fresh for phase-3 execution
.read phase-2.sql

-- Make table outputs more readable
.mode columns
.headers on

.print '++++++++++++++++++++++++++ START ++++++++++++++++++++++++++';

-- Events:

-- 1. A new customer joined the loyalty program with the following customer
--    information:

--    | name   | phone        |
--    | ------ | ------------ |
--    | Rachel | 111-111-1111 |
INSERT INTO customers (name, phone)
VALUES ('Rachel',1111111111);


-- 2. Rachel purchases a coffee.
--    (When adding a coffee order, you must first check the current points of the
--    customer, update the customer's points, then add the coffee order.)
UPDATE customers
SET points = points + 1
WHERE name = 'Rachel';

-- INSERT new record into coffee_purchase. ID wiLl auto increment, so NULL iS inserted to create
-- a new record
INSERT INTO coffee_purchases (id, customer_id)
VALUES (NULL, (SELECT id FROM customers WHERE name = 'Rachel'));


-- 3. Two new customers joined the loyalty program with the following customer
--    information:

--    | name   | email               | phone        |
--    | ------ | ------------------- | ------------ |
--    | Monica | monica@friends.show | 222-222-2222 |
--    | Phoebe | phoebe@friends.show | 333-333-3333 |
INSERT INTO customers
    (name, email, phone)
VALUES
    ('Monica', 'monica@friends.show', 2222222222),
    ('Phoebe', 'phoebe@friends.show', 3333333333);


-- 4. Phoebe purchases three coffees.
INSERT INTO coffee_purchases (id, customer_id)
VALUES 
    (NULL, (SELECT id FROM customers WHERE name = 'Phoebe')),
    (NULL, (SELECT id FROM customers WHERE name = 'Phoebe')),
    (NULL, (SELECT id FROM customers WHERE name = 'Phoebe'));

UPDATE customers
SET points = points + 3
WHERE name = 'Phoebe';


-- 5. Rachel and Monica each purchase four coffees.
INSERT INTO coffee_purchases (id, customer_id)
VALUES
    (NULL, (SELECT id FROM customers WHERE name = 'Rachel')),
    (NULL, (SELECT id FROM customers WHERE name = 'Rachel')),
    (NULL, (SELECT id FROM customers WHERE name = 'Rachel')),
    (NULL, (SELECT id FROM customers WHERE name = 'Rachel'));

UPDATE customers
SET points = points + 4
WHERE name = 'Rachel';

INSERT INTO coffee_purchases (id, customer_id)
VALUES
    (NULL, (SELECT id FROM customers WHERE name = 'Monica')),
    (NULL, (SELECT id FROM customers WHERE name = 'Monica')),
    (NULL, (SELECT id FROM customers WHERE name = 'Monica')),
    (NULL, (SELECT id FROM customers WHERE name = 'Monica'));

UPDATE customers
SET points = points + 4
WHERE name = 'Monica';


-- 6. Monica wants to know her new point total.
.print 'MONICA POINT TOTAL'
SELECT points FROM customers WHERE name = 'Monica';


-- 7. Rachel wants to check her total points. Redeem her points for a coffee if she
--    has enough points. If she doesn't, she wants to purchase a coffee.

-- Tell Rachel her point value
.print 'RACHEL POINT TOTAL'
SELECT points FROM customers WHERE name = 'Rachel';

-- insert coffee
INSERT INTO coffee_purchases (id, customer_id)
VALUES (NULL, (SELECT id FROM customers WHERE name = 'Rachel'));

-- update coffee purchase to redeemed if points > 10
UPDATE coffee_purchases
SET is_redeemed =
    (CASE
        WHEN (SELECT points FROM customers WHERE name = 'Rachel' AND points >= 10) THEN 1
        ELSE 0
    END)
WHERE id = (SELECT max(id) FROM coffee_purchases);

-- update cutomer point totals if 10 or over
UPDATE customers
SET points = points - 10
WHERE name = 'Rachel'
AND points >= 10;


-- 8. Three new customers joined the loyalty program with the following customer
--    information:

--    | name     | email                 |
--    | -------- | --------------------- |
--    | Joey     | joey@friends.show     |
--    | Chandler | chandler@friends.show |
--    | Ross     | ross@friends.show     |
INSERT INTO customers
    (name, email)
VALUES
    ('Joey', 'joey@friends.show'),
    ('Chandler', 'chandler@friends.show'),
    ('Ross', 'ross@friends.show');


-- 9. Ross purchases six coffees.
INSERT INTO coffee_purchases (id, customer_id)
VALUES
    (NULL, (SELECT id FROM customers WHERE name = 'Ross')),
    (NULL, (SELECT id FROM customers WHERE name = 'Ross')),
    (NULL, (SELECT id FROM customers WHERE name = 'Ross')),
    (NULL, (SELECT id FROM customers WHERE name = 'Ross')),
    (NULL, (SELECT id FROM customers WHERE name = 'Ross')),
    (NULL, (SELECT id FROM customers WHERE name = 'Ross'));

UPDATE customers
SET points = points + 6
WHERE name = 'Ross';


-- 10. Monica purchases three coffees.
INSERT INTO coffee_purchases (id, customer_id)
VALUES
    (NULL, (SELECT id FROM customers WHERE name = 'Monica')),
    (NULL, (SELECT id FROM customers WHERE name = 'Monica')),
    (NULL, (SELECT id FROM customers WHERE name = 'Monica'));

UPDATE customers
SET points = points + 3
WHERE name = 'Monica';

-- 11. Phoebe wants to check her total points. Redeem her points for a coffee if she
--    has enough points. If she doesn't, she wants to purchase a coffee.
.print 'PHOEBE POINT TOTAL'
SELECT points FROM customers WHERE name = 'Phoebe';

-- insert coffee
INSERT INTO coffee_purchases (id, customer_id)
VALUES (NULL, (SELECT id FROM customers WHERE name = 'Phoebe'));

-- update coffee purchase to redeemed if points >= 10
UPDATE coffee_purchases
SET is_redeemed =
    (CASE
        WHEN (SELECT points FROM customers WHERE name = 'Phoebe' AND points >= 10) THEN 1
        ELSE 0
    END)
WHERE id = (SELECT max(id) FROM coffee_purchases);

-- update cutomer point totals if 10 or over
UPDATE customers
SET points = points - 10
WHERE name = 'Phoebe'
AND points >= 10;





-- 12. Ross demands a refund for the last two coffees that he ordered. (Make sure you
--     delete Ross's coffee orders and not anyone else's. Update his points to reflect the returned purchases.)


-- 13. Joey purchases two coffees.


-- 14. Monica wants to check her total points. Redeem her points for a coffee if she
--    has enough points. If she doesn't, she wants to purchase a coffee.


-- 15. Chandler wants to delete his loyalty program account.


-- 16. Ross wants to check his total points. Redeem his points for a coffee if he
--    has enough points. If he doesn't, he wants to purchase a coffee.


-- 17. Joey wants to check his total points. Redeem his points for a coffee if he
--    has enough points. If he doesn't, he wants to purchase a coffee.


-- 18. Phoebe wants to change her email to `p_as_in_phoebe@friends.show`.