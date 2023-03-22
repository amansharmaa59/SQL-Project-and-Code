CREATE TABLE swiggy (
  user_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL
);
INSERT INTO swiggy (user_id, name, email, password) VALUES (1, 'Nitish', 'nitish@gmail.com', 'p252h');
INSERT INTO swiggy (user_id, name, email, password) VALUES (2, 'Khushboo', 'khushboo@gmail.com', 'hxn9b');
INSERT INTO swiggy (user_id, name, email, password) VALUES (3, 'Vartika', 'vartika@gmail.com', '9hu7j');
INSERT INTO swiggy (user_id, name, email, password) VALUES (4, 'Ankit', 'ankit@gmail.com', 'lkko3');
INSERT INTO swiggy (user_id, name, email, password) VALUES (5, 'Neha', 'neha@gmail.com', '3i7qm');
INSERT INTO swiggy (user_id, name, email, password) VALUES (6, 'Anupama', 'anupama@gmail.com', '46rdw2');
INSERT INTO swiggy (user_id, name, email, password) VALUES (7, 'Rishabh', 'rishabh@gmail.com', '4sw123');

select * from swiggy

CREATE TABLE restaurants (
  r_id INT PRIMARY KEY,
  r_name VARCHAR(50) NOT NULL,
  cuisine VARCHAR(50) NOT NULL
);
INSERT INTO restaurants (r_id, r_name, cuisine) VALUES (1, 'dominos', 'Italian');
INSERT INTO restaurants (r_id, r_name, cuisine) VALUES (2, 'kfc', 'American');
INSERT INTO restaurants (r_id, r_name, cuisine) VALUES (3, 'box8', 'North Indian');
INSERT INTO restaurants (r_id, r_name, cuisine) VALUES (4, 'Dosa Plaza', 'South Indian');
INSERT INTO restaurants (r_id, r_name, cuisine) VALUES (5, 'China Town', 'Chinese');
select * from restaurants

CREATE TABLE food (
  f_id INT PRIMARY KEY,
  f_name VARCHAR(50) NOT NULL,
  type VARCHAR(50) NOT NULL
);
INSERT INTO food (f_id, f_name, type) VALUES (1, 'Non-veg Pizza', 'Non-veg');
INSERT INTO food (f_id, f_name, type) VALUES (2, 'Veg Pizza', 'Veg');
INSERT INTO food (f_id, f_name, type) VALUES (3, 'Choco Lava cake', 'Veg');
INSERT INTO food (f_id, f_name, type) VALUES (4, 'Chicken Wings', 'Non-veg');
INSERT INTO food (f_id, f_name, type) VALUES (5, 'Chicken Popcorn', 'Non-veg');
INSERT INTO food (f_id, f_name, type) VALUES (6, 'Rice Meal', 'Veg');
INSERT INTO food (f_id, f_name, type) VALUES (7, 'Roti meal', 'Veg');
INSERT INTO food (f_id, f_name, type) VALUES (8, 'Masala Dosa', 'Veg');
INSERT INTO food (f_id, f_name, type) VALUES (9, 'Rava Idli', 'Veg');
INSERT INTO food (f_id, f_name, type) VALUES (10, 'Schezwan Noodles', 'Veg');
INSERT INTO food (f_id, f_name, type) VALUES (11, 'Veg Manchurian', 'Veg');
select * from food
select * from swiggy
CREATE TABLE menu_items (
  menu_id INT PRIMARY KEY,
  r_id INT NOT NULL,
  f_id INT NOT NULL,
  price INT NOT NULL,
  FOREIGN KEY (r_id) REFERENCES restaurants(r_id),
  FOREIGN KEY (f_id) REFERENCES food(f_id)
);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (1, 1, 1, 450);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (2, 1, 2, 400);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (3, 1, 3, 100);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (4, 2, 3, 115);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (5, 2, 4, 230);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (6, 2, 5, 300);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (7, 3, 3, 80);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (8, 3, 6, 160);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (9, 3, 7, 140);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (10, 4, 6, 230);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (11, 4, 8, 180);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (12, 4, 9, 120);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (13, 5, 6, 250);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (14, 5, 10, 220);
INSERT INTO menu_items (menu_id, r_id, f_id, price) VALUES (15,5,11,180);

select * from menu_items
select * from food
select * from swiggy
CREATE TABLE orders (
  order_id INT NOT NULL,
  user_id INT NOT NULL,
  r_id INT NOT NULL,
  amount INT NOT NULL,
  date DATE NOT NULL,
  partner_id INT NOT NULL,
  delivery_time INT,
  delivery_rating INT,
  restaurant_rating INT,
  PRIMARY KEY (order_id)
);

INSERT INTO orders (order_id, user_id, r_id, amount, date, partner_id, delivery_time, delivery_rating, restaurant_rating)
VALUES 
  (1001, 1, 1, 550, '2022-05-10', 1, 25, 5, 3),
  (1002, 1, 2, 415, '2022-05-26', 1, 19, 5, 2),
  (1003, 1, 3, 240, '2022-06-15', 5, 29, 4, NULL),
  (1004, 1, 3, 240, '2022-06-29', 4, 42, 3, 5),
  (1005, 1, 3, 220, '2022-07-10', 1, 58, 1, 4),
  (1006, 2, 1, 950, '2022-06-10', 2, 16, 5, NULL),
  (1007, 2, 2, 530, '2022-06-23', 3, 60, 1, 5),
  (1008, 2, 3, 240, '2022-07-07', 5, 33, 4, 5),
  (1009, 2, 4, 300, '2022-07-17', 4, 41, 1, NULL),
  (1010, 2, 5, 650, '2022-07-31', 1, 67, 1, 4),
  (1011, 3, 1, 450, '2022-05-10', 2, 25, 3, 1),
  (1012, 3, 4, 180, '2022-05-20', 5, 33, 4, 1),
  (1013, 3, 2, 230, '2022-05-30', 4, 45, 3, NULL),
  (1014, 3, 2, 230, '2022-06-11', 2, 55, 1, 2),
  (1015, 3, 2, 230, '2022-06-22', 3, 21, 5, NULL),
  (1016, 4, 4, 300, '2022-05-15', 3, 31, 5, 5),
  (1017, 4, 4, 300, '2022-05-30', 1, 50, 1, NULL),
  (1018, 4, 4, 400, '2022-06-15', 2, 40, 3, 5),
(1019, 4, 5, 400, '2022-06-30', 1, 70, 2, 4),
(1020, 4, 5, 400, '2022-07-15', 3, 26, 5, 3),
(1021, 5, 1, 550, '2022-07-01', 5, 22, 2, NULL),
(1022, 5, 1, 550, '2022-07-08', 1, 34, 5, 1),
(1023, 5, 2, 645, '2022-07-15', 4, 38, 5, 1),
(1024, 5, 2, 645, '2022-07-21', 2, 58, 2, 1),
(1025, 5, 2, 645, '2022-07-28', 2, 44, 4, NULL);
select * from orders
select * from menu_items
select * from food
select * from swiggy

CREATE TABLE partners (
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(50)
);

INSERT INTO partners VALUES
(1, 'Suresh'),
(2, 'Amit'),
(3, 'Lokesh'),
(4, 'Kartik'),
(5, 'Gyandeep');
select * from partners
select * from orders
select * from menu_items
select * from food
select * from swiggy
CREATE TABLE order_food (
    id INT PRIMARY KEY,
    order_id INT,
    f_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (f_id) REFERENCES food(f_id)
);

INSERT INTO order_food VALUES
(1, 1001, 1),
(2, 1001, 3),
(3, 1002, 4),
(4, 1002, 3),
(5, 1003, 6),
(6, 1003, 3),
(7, 1004, 6),
(8, 1004, 3),
(9, 1005, 7),
(10, 1005, 3),
(11, 1006, 1),
(12, 1006, 2),
(13, 1006, 3),
(14, 1007, 4),
(15, 1007, 3),
(16, 1008, 6),
(17, 1008, 3),
(18, 1009, 8),
(19, 1009, 9),
(20, 1010, 10),
(21, 1010, 11),
(22, 1010, 6),
(23, 1011, 1),
(24, 1012, 8),
(25, 1013, 4),
(26, 1014, 4),
(27, 1015, 4),
(28, 1016, 8),
(29, 1016, 9),
(30, 1017, 8),
(31, 1017, 9),
(32, 1018, 10),
(33, 1018, 11),
(34, 1019, 10),
(35, 1019, 11),
(36, 1020, 10),
(37, 1020, 11),
(38, 1021, 1),
(39, 1021, 3),
(40, 1022, 1),
(41, 1022, 3),
(42, 1023, 3),
(43, 1023, 4),
(44, 1023, 5),
(45, 1024, 3),
(46, 1024, 4),
(47, 1024, 5),
(48, 1025, 3),
(49, 1025, 4),
(50, 1025, 5);



 1. Find customers who have never ordered
 2. Average Price/dish
 3. Find the top restaurant in terms of the number of orders for a given month
 4. restaurants with monthly sales greater than x for 
 5. Show all orders with order details for a particular customer in a particular date range
 6. Find restaurants with max repeated customers 
 7. Month over month revenue growth of swiggy
 8. Customer - favorite food
 9. Find the most loyal customers for all restaurant
 10.Month over month revenue growth of a restaurant
 11. Most Paired Products


 select * from order_food   --order_details
select * from partners    --delivery partners
select * from orders      --orders
select * from menu_items  --menu
select * from food       --food
select * from swiggy     --users
select * from restaurants --restaurents

 -- Find customers who have never ordered
select s.user_id,s.name from swiggy s
left join orders o
on s.user_id = o.user_id
where o.delivery_time is null

-- Average Price/dish
 select f_name,avg(price) avg_price from food f
 inner join menu_items m
 on f.f_id = m.f_id 
 group by f_name

 -- Find the top restaurant in terms of the number of orders for a given month
 select r.r_id,r.r_name,count(delivery_time) from restaurants r
 join orders o
 on r.r_id = o.r_id
 group by r.r_id,r.r_name

