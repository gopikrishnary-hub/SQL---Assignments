CREATE DATABASE AI_Support_DB;
use  AI_Support_DB
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Customer_Type VARCHAR(30) NOT NULL,
    Registration_Date DATE NOT NULL
);
CREATE TABLE Chatbot_Interactions (
    Interaction_ID INT PRIMARY KEY,
    Customer_ID INT,
    Query_Category VARCHAR(50) NOT NULL,
    AI_Response_Status VARCHAR(30) NOT NULL,
    Satisfaction_Score INT NULL CHECK (Satisfaction_Score BETWEEN 1 AND 5 OR Satisfaction_Score IS NULL),
    Interaction_Date DATE NOT NULL,
    Resolution_Time_Minutes DECIMAL(8,2) NOT NULL,
     FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
      
);
select * from  Chatbot_Interactions,Customers;
INSERT INTO Customers (Customer_ID, Customer_Name, Email, Customer_Type, Registration_Date)
VALUES
(1, 'Aravind Swaminathan', 'aravind.s@example.com', 'Enterprise', '2024-03-15'),
(2, 'Priya Venkatesh',     'priya.v@example.com',    'Premium',    '2024-07-22'),
(3, 'Karthik Raja',         'karthik.r@example.com',  'Standard',   '2024-11-05'),
(4, 'Deepa Sundaram',       'deepa.s@example.com',    'Premium',    '2025-02-10'),
(5, 'Manoj Kumar',          'manoj.k@example.com',    'Enterprise', '2024-09-18'),
(6, 'Divya Ramesh',         'divya.r@example.com',    'Standard',   '2025-03-01'),
(7, 'Suresh Balaji',        'suresh.b@example.com',   'Enterprise', '2024-01-12');
INSERT INTO Chatbot_Interactions 
(Interaction_ID, Customer_ID, Query_Category, AI_Response_Status, Satisfaction_Score, Interaction_Date, Resolution_Time_Minutes)
VALUES
(101, 1, 'Billing',       'Resolved',     5,    '2025-01-10', 2.50),
(102, 1, 'Technical',     'Resolved',     4,    '2025-01-15', 8.10),
(103, 2, 'Account',       'Resolved',     3,    '2025-01-18', 4.00),
(104, 2, 'Billing',       'Escalated',    2,    '2025-02-01', 12.30),
(105, 3, 'Technical',     'Resolved',     4,    '2025-02-05', 5.25),
(106, 3, 'Feature Req',   'In-Progress',  NULL, '2025-02-12', 3.75),
(107, 4, 'Billing',       'Resolved',     5,    '2025-02-15', 1.80),
(108, 5, 'Technical',     'Resolved',     1,    '2025-02-20', 15.40),
(109, 1, 'Billing',       'Resolved',     4,    '2025-02-22', 2.10),
(110, 2, 'Account',       'Resolved',     NULL, '2025-03-01', 3.20),
(111, NULL, 'General Info', 'Resolved',   3,    '2025-03-05', 1.50);
select c.Customer_ID,c.Customer_Name,c.Customer_Type,i.Query_Category,i. Satisfaction_Score from Customers c inner join Chatbot_Interactions i on c.Customer_ID = i.Customer_ID;
select c.Customer_ID,c.Customer_Name,c.Customer_Type,i.Query_Category,i. Satisfaction_Score from Customers c inner join Chatbot_Interactions i on c.Customer_ID = i.Customer_ID where i. Satisfaction_Score is not null;
select c.Customer_ID,c.Customer_Name,c.Customer_Type,i.Query_Category,i. Satisfaction_Score from Customers c left join Chatbot_Interactions i on c.Customer_ID = i.Customer_ID;
select c.Customer_ID,c.Customer_Name,c.Customer_Type,i.Query_Category,i. Satisfaction_Score from Customers c right join Chatbot_Interactions i on c.Customer_ID = i.Customer_ID;
select c.Customer_ID,c.Customer_Name,c.Customer_Type,i.Query_Category,i. Satisfaction_Score from Customers c left join Chatbot_Interactions i on c.Customer_ID = i.Customer_ID
union
select c.Customer_ID,c.Customer_Name,c.Customer_Type,i.Query_Category,i. Satisfaction_Score from Customers c right join Chatbot_Interactions i on c.Customer_ID = i.Customer_ID;
select Customer_ID, Query_Category,AI_Response_Status,Satisfaction_Score, 
 case
 when Satisfaction_Score in (4,5) then 'Satisfied'
 when Satisfaction_Score = 3 then 'Neutral'
 when Satisfaction_Score in (1,2) then 'UNSatisfied'
 when Satisfaction_Score is null then 'Not Rated'
 end as rating
 from chatbot_Interactions;
 select upper( Customer_Name),substring_index( Customer_Name,' ',1) as firstname,length( Customer_Name) from Customers;
select  Query_Category,count(*) as interaction_count from Chatbot_Interactions group by Query_Category;
select  Query_Category,count(*) as interaction_count from Chatbot_Interactions group by Query_Category having interaction_count >2;
select Customer_Name,Customer_Type from Customers where Registration_Date > '2025-01-01'and Customer_Type in ('Premium', 'Enterprise');
select avg(Satisfaction_Score) as AVG_Satisfaction_Score,avg(Resolution_Time_Minutes) as AVG_Resolution_Time_Minutes from chatbot_Interactions;
select Satisfaction_Score,
case
when Satisfaction_Score =5 then 'HIGH'
when Satisfaction_Score =4 then 'MEDIUM'
when Satisfaction_Score IN (1,3) then 'LOW'
END as rating
from chatbot_Interactions;
