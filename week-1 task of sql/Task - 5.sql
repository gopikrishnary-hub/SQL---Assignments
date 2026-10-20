create database StoreDB
use StoreDB
create table Products(Product_ID int primary key,Product_Name varchar(50) not null,Category varchar(30),Price decimal(10,2),Stock_Quantity int);
insert into products(Product_ID ,Product_Name,Category,Price,Stock_Quantity) values(1,'qqq','soap',2000,50),(2,'www','rice',500,5),(3,'eee','sacks',2000,200),(4,'rrr','dal',3000,20),(5,'ttt','detergent',900,9),(6,'yyy','flour',800,5);
select * from products where Price >1000;
update products set Stock_Quantity = 50 , price = 5000 where Product_ID = 1;
delete from products where Product_ID  = 6;
alter table products add Supplier_Name varchar(30);
select * from products where Stock_Quantity <10;
alter table products drop column Supplier_Name;
select *from products;


