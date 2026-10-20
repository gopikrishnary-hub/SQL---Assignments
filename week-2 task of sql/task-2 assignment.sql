create database StoreDB
use StoreDB
create table Sales_Details(Sale_ID int primary key,Product_Name varchar(50),Category varchar(50),Price decimal(10,2) check(Price>0),Quantity int check(Quantity>0),Sale_Date date);
insert into Sales_Details(Sale_ID,Product_Name,Category,Price,Quantity,Sale_Date) values(1, 'Wireless Mouse', 'Electronics', 25.99, 2, '2026-10-01'),
(2, 'Running Shoes', 'Apparel', 89.50, 1, '2026-10-02'),
(3, 'Coffee Maker', 'Home Appliances', 49.99, 1, '2026-10-03'),
(4, 'Bluetooth Speaker', 'Electronics', 59.99, 3, '2026-10-04'),
(5, 'Leather Wallet', 'Accessories', 34.00, 2, '2026-10-05'),
(6, 'Yoga Mat', 'Fitness', 19.95, 5, '2026-10-06'),
(7, 'Desk Lamp', 'Home Decor', 29.99, 1, '2026-10-07'),
(8, 'Gaming Keyboard', 'Electronics', 79.99, 1, '2026-10-08'),
(9, 'Water Bottle', 'Fitness', 15.00, 4, '2026-10-09'),
(10, 'Ceramic Mug', 'Kitchenware', 12.50, 10, '2026-10-10');
select sum(Price*Quantity) as total_revenue from Sales_Details;
select Product_Name,sum(Price*Quantity) as total_revenue from Sales_Details group by Product_Name;
select Product_Name,sum(Price*Quantity) as total_revenue from Sales_Details group by Product_Name having total_revenue>100;
select *from Sales_Details;
select *from Sales_Details where Product_Name  like "%speaker%";
select count(Category) from Sales_Details;
SELECT EXTRACT(MONTH FROM '2026-10-07')
select * from Sales_Details where Sale_Date = 2023;