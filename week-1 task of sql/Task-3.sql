create database online_shopping;
use online_shopping
create table customers(Customer_ID int primary key,Customer_Name varchar(30) not null,email varchar(30) unique,phone int,city varchar(20));
select *from customers;
insert into customers(Customer_ID,Customer_Name,email,phone,city) values(1,'aaa','aaa@gmail.com','9990090909','chennai'),(2,'bbb','bbb@gmail.com','9995090909','delhi'),(3,'ccc','ccc@gmail.com','9990090900','vishak'),(4,'ddd','ddd@gmail.com','9997090909','hyderabad'),(5,'eee','eee@gmail.com','9990090009','bangalore');
drop table customers;
create table customers(Customer_ID int primary key,Customer_Name varchar(30) not null,email varchar(30) unique,phone varchar(15),city varchar(20));
insert into  customers(Customer_ID,Customer_Name) values(1,'fff'),(2,'ggg');
update customers set email = 'bbb@gmail.com' where Customer_ID = 1;
insert into customers(Customer_ID,email) values(6,'fff@gmail.com');
select *from customers;
