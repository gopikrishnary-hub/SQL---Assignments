create database  HospitalDB;
use HospitalDB
create table Appointments(Appointment_ID int primary key,Patient_Name varchar(50) not null,Department varchar(50),Age int check(Age>0),Appointment_Date date,Appointment_Status varchar(50),Consultation_Fee decimal(10,2) check(Consultation_Fee >=0));
insert into Appointments (Appointment_ID, Patient_Name, Department, Age, Appointment_Date, Appointment_Status, Consultation_Fee) VALUES
(1, 'John Doe', 'Cardiology', 45, '2026-10-15', 'Completed', 150.00),
(2, 'Jane Smith', 'Pediatrics', 8, '2026-10-16', 'Completed', 100.00),
(3, 'Robert Johnson', 'Orthopedics', 62, '2026-10-18', 'No Show', 120.00),
(4, 'Emily Davis', 'Dermatology', 29, '2026-10-20', 'Scheduled', 90.00),
(5, 'Michael Brown', 'Neurology', 53, '2026-10-21', 'Scheduled', 200.00),
(6, 'Sarah Wilson', 'General Medicine', 35, '2026-10-22', 'Scheduled', 75.00),
(7, 'David Jones', 'Cardiology', 71, '2026-10-22', 'Cancelled', 150.00),
(8, 'Lisa Miller', 'Pediatrics', 3, '2026-10-23', 'Scheduled', 100.00),
(9, 'James Taylor', 'Orthopedics', 41, '2026-10-24', 'Scheduled', 120.00),
(10, 'Amanda Thomas', 'Dermatology', 26, '2026-10-25', 'Scheduled', 90.00);
select *from  Appointments
select upper(Patient_Name),left(Patient_Name,1) as firstname,concat(Patient_Name,'-',Department) from Appointments;
select *from Appointments where month(Appointment_Date) = month(curdate()) and year(Appointment_Date) = year(curdate());
select * from appointments where datediff('2025-01-01','2026-11-01');
select Department,count(Appointment_ID) as result from appointments group by Department;
select Department,count(*) as result from appointments group by Department having count(*)>2;
select sum(Consultation_Fee) as total_fee from appointments;
select datediff(Appointment_Date,current_date) as result from appointments;
