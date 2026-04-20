-- Creating the University_Buses database and use it
create database University_Buses;
show databases;
use University_Buses;
-- Table: Area
CREATE TABLE Area (
    Area_ID INT PRIMARY KEY,
    Area_Code VARCHAR(10) NOT NULL UNIQUE,
    Area_Name VARCHAR(100) not null
);
describe Area;

--  Table: Supervisor
CREATE TABLE Supervisor (
    Supervisor_ID INT PRIMARY KEY,
    F_SupName VARCHAR(50) not null,
    L_SupName VARCHAR(50) not null,
    Phone VARCHAR(20) UNIQUE
);

describe Supervisor;

--  Table: Driver
CREATE TABLE Driver (
    Driver_ID INT PRIMARY KEY,
    License_Num VARCHAR(30) UNIQUE NOT NULL,
    F_DName VARCHAR(50) not null,
    L_DName VARCHAR(50) not null,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Phone VARCHAR(20) UNIQUE
);
describe Driver;

--  Table: Bus
CREATE TABLE Bus (
    Bus_ID INT PRIMARY KEY,
    Plate_Num VARCHAR(20) UNIQUE,
    Capacity INT,
    Status VARCHAR(50),
    Model_Year INT,
    Driver_ID INT,
    Supervisor_ID INT,
    FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID) ON UPDATE CASCADE,
    FOREIGN KEY (Supervisor_ID) REFERENCES Supervisor(Supervisor_ID) ON UPDATE CASCADE
);

describe Bus;

--  Table: Student
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    F_SName VARCHAR(50) not null,
    L_SName VARCHAR(50) not null,
    Phone VARCHAR(20) UNIQUE,
    Department VARCHAR(50),
    Reg_Date DATE,
    Bus_ID INT,
    FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID) ON UPDATE CASCADE
);

describe Student;

--  Table:  Bus_Area
CREATE TABLE Bus_Area (
    Bus_ID INT,
    Area_ID INT,
    PRIMARY KEY (Bus_ID, Area_ID),
    FOREIGN KEY (Bus_ID) REFERENCES Bus(Bus_ID)  ON UPDATE CASCADE,
    FOREIGN KEY (Area_ID) REFERENCES Area(Area_ID)  ON UPDATE CASCADE
);

describe Bus_Area;

--  Table: Driver_Shift_Type
CREATE TABLE Driver_Shift_Type (
    Shift_Type VARCHAR(30),
    Driver_ID INT,
    PRIMARY KEY (Shift_Type, Driver_ID),
    FOREIGN KEY (Driver_ID) REFERENCES Driver(Driver_ID)  ON UPDATE CASCADE
);

describe Driver_Shift_Type;

-- Insert sample data

-- Drivers
INSERT INTO Driver (Driver_ID, License_Num, F_DName, L_DName, Salary, Phone) VALUES 
(1,'1023456789','Ahmed','Salem',4500,'055100001'),
(2,'1022233344','Mazen','Ali',4200,'055100002'),
(3,'1033344455','Fahad','Khaled',5000,'055100003'),
(4,'1044455566','Saad','Hussein',3900,'055100004'),
(5,'1055566677','Khaled','Majed',4700,'055100005'),
(6,'1066677788','Amer','Omar',4100,'055100006'),
(7,'1077788899','Sultan','Rashid',5500,'055100007'),
(8,'1088899911','Adeab','Faisal',4300,'055100008'),
(9,'1076584936','Talal','Amin',4600,'055100009'),
(10,'109864556','Salem','Saad',4400,'055100010');
 select * from driver;
 
-- Driver shift types
INSERT INTO Driver_Shift_Type (Shift_Type, Driver_ID) VALUES
('Morning',1),
('Evening',1),
('Morning',2 ),
('Evening',3),
('Morning',4),
('Morning',5),
('Evening',6),
('Morning',7),
('Morning',8),
('Evening',9);
 select * from driver_shift_type;
 
-- Supervisors
INSERT INTO Supervisor (Supervisor_ID, F_SupName, L_SupName, Phone)  VALUES
(1,'Lujain','Hassan','055200001'),
(2,'Reham','Yousef','055200002'),
(3,'Reema','Ali','055200003'),
(4,'Afrah','Fahad','055200004'),
(5,'Fatimah','Saleh','055200005'),
(6,'Maha','Sami','055200006'),
(7,'Nawal','Qasim','055200007'),
(8,'Areej','Mahmoud','055200008'),
(9,'Laila','Hadi','055200009'),
(10,'Rania','Imad','055200010');
 select * from supervisor;

-- Areas
INSERT INTO Area (Area_ID, Area_Code, Area_Name) VALUES
(1,'SHJ','Al Hajj Street'),
(2, 'RSH', 'Al Rashidiya'),
(3, 'HSY', 'Al Husayniya'),
(4, 'KHD', 'Al Khalidiyah'),
(5, 'SHR', 'Al Sharaie'),
(6, 'HMR', 'Al Hamra'),
(7, 'SHQ', 'Al Shawqiya'),
(8, 'BQR', 'Batha Quraysh'),
(9,'WJG','Wadi Jaleel'),
(10,'AUL','Al Auali');
 select * from area;

-- Buses
INSERT INTO Bus (Bus_ID, Plate_Num, Capacity, Status, Model_Year, Driver_ID, Supervisor_ID) VALUES
(1, 'SAU100', 45, 'Active', 2018, 1, 1),
(2, 'MAD101', 50, 'Active', 2019, 2, 2),
(3, 'MNH102', 40, 'Inactive', 2017, 3, 3),
(4, 'RER103', 48, 'Active', 2020, 4, 4),
(5, 'FOF104', 55, 'Active', 2021, 5, 5),
(6, 'LOL105', 42, 'Inactive', 2016, 6, 6),
(7, 'SAR106', 47, 'Active', 2022, 7,7),
(8, 'ILK107', 50, 'Active', 2020, 8,8),
(9, 'ZDT108', 44, 'Inactive', 2015, 9,9),
(10, 'AFA109', 60, 'Active', 2023, 10,10);
 select * from bus;

-- Bus_Area relations
INSERT INTO Bus_Area (Bus_ID, Area_ID)  VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,1),
(4,6),
(5,7),
(6,8),
(7,9),
(8,10),
(9,3),
(10,2),
(10,1),
(7,4);
 select * from bus_area;
 
-- Students
INSERT INTO Student(Student_ID, F_SName, L_SName, Phone, Department, Reg_Date, Bus_ID) VALUES
(1001,'Areej','Ahmad','056300001','IT','2024-09-01',1),
(1002,'Maha','Omar','056300002','CS','2024-09-01',1),
(1003,'Rama','Saeed','056300003','AI','2024-09-02',2),
(1004,'Aya','Saleh','056300004','IT','2024-09-01',3),
(1005,'Nour','Fahad','056300005','AI','2024-09-04',3),
(1006,'Ruba','Majed','056300006','CS','2024-09-01',4),
(1007,'Kholod','Nasser','056300007','IT','2024-09-01',5),
(1008,'Sama','Ali','056300008','AI','2024-09-05',6),
(1009,'Lujain','Yousef','056300009','AI','2024-09-01',7),
(1010,'Lama','Hasan','056300010','CS','2024-09-01',10);
 select * from student;

-- ================
--       Maha 
-- ================

--  Basic SELECT :

-- Retrieve first name, last name, and phone of students in the AI department
SELECT F_SName, L_SName, Phone 
FROM Student 
WHERE Department = 'AI';

-- Select all active buses with their ID, plate number, and status
SELECT Bus_ID, Plate_Num, Status 
FROM Bus 
WHERE Status = 'Active';

-- Aggregate Functions: 

-- Count how many students are assigned to each bus
SELECT Bus_ID, COUNT(*) AS NumberOfStudents
FROM Student
GROUP BY Bus_ID;

-- Calculate the average salary of all drivers
SELECT AVG(Salary) AS AvgSalary
FROM Driver;

-- Joins :

-- Show all drivers and the buses they are assigned to (NULL if none)
SELECT d.F_DName, d.L_DName, b.Bus_ID
FROM Driver d
LEFT JOIN Bus b ON d.Driver_ID = b.Driver_ID;

-- Show students with their bus plate number and status
SELECT s.F_SName, s.L_SName, b.Plate_Num, b.Status
FROM Student s
INNER JOIN Bus b ON s.Bus_ID = b.Bus_ID;

-- Subqueries : 

-- Retrieve all students assigned to buses whose capacity is above the average bus capacity
SELECT *
FROM Student
WHERE Bus_ID IN (
    SELECT Bus_ID 
    FROM Bus
    WHERE Capacity > (SELECT AVG(Capacity) FROM Bus)
);

-- Retrieve supervisors who oversee more than one bus
SELECT Supervisor_ID, F_SupName, L_SupName
FROM Supervisor
WHERE Supervisor_ID IN (
    SELECT Supervisor_ID
    FROM Bus
    GROUP BY Supervisor_ID
    HAVING COUNT(*) > 1
);

-- Create VIEW:

-- Create a view showing each student with their bus and supervisor names
CREATE OR REPLACE VIEW Student_Bus_Supervisor_Student1 AS
SELECT 
    s.Student_ID,
    s.F_SName,
    s.L_SName,
    b.Plate_Num,
    b.Status,
    sp.F_SupName AS Supervisor_FirstName,
    sp.L_SupName AS Supervisor_LastName
FROM Student s
INNER JOIN Bus b ON s.Bus_ID = b.Bus_ID
INNER JOIN Supervisor sp ON b.Supervisor_ID = sp.Supervisor_ID;

SELECT * FROM Student_Bus_Supervisor_Student1;

-- ================
--       Afrah 
-- ================

--  Basic SELECT :

-- Retrieve first name, last name, and department of students in the IT department
SELECT F_SName, L_SName, Department 
FROM Student 
WHERE Department = 'IT';

-- Select all buses with status 'Inactive' and capacity greater than 45
SELECT Bus_ID, Plate_Num, Capacity 
FROM Bus 
WHERE Status = 'active' AND Capacity > 45;

-- Aggregate Functions: 

-- Find the minimum salary among all drivers
SELECT MIN(Salary) AS MinDriverSalary
FROM Driver;

-- Find the maximum bus capacity
SELECT MAX(Capacity) AS MaxBusCapacity
FROM Bus;

-- Joins :

-- Show all buses with the supervisor's first name and phone (RIGHT JOIN)
SELECT b.Bus_ID, b.Plate_Num, sp.F_SupName, sp.Phone
FROM Supervisor sp
RIGHT JOIN Bus b ON sp.Supervisor_ID = b.Supervisor_ID;

-- Show students with the driver's first name and last name (LEFT JOIN)
SELECT s.F_SName, s.L_SName, d.F_DName, d.L_DName
FROM Student s
LEFT JOIN Bus b ON s.Bus_ID = b.Bus_ID
LEFT JOIN Driver d ON b.Driver_ID = d.Driver_ID;

-- Subqueries : 

-- Retrieve all students assigned to buses whose capacity equals the maximum bus capacity
SELECT *
FROM Student
WHERE Bus_ID IN (
    SELECT Bus_ID 
    FROM Bus
    WHERE Capacity = (SELECT MAX(Capacity) FROM Bus)
);

-- Retrieve supervisors who manage the bus with minimum capacity
SELECT Supervisor_ID, F_SupName, L_SupName
FROM Supervisor
WHERE Supervisor_ID IN (
    SELECT Supervisor_ID
    FROM Bus
    WHERE Capacity = (SELECT MIN(Capacity) FROM Bus)
);

-- Create VIEW:

-- Create a view showing each bus with its plate, status, supervisor name, and driver name
CREATE OR REPLACE VIEW Bus_Student4_View AS
SELECT 
    b.Bus_ID,
    b.Plate_Num,
    b.Status,
    sp.F_SupName AS Supervisor_FirstName,
    sp.L_SupName AS Supervisor_LastName,
    d.F_DName AS Driver_FirstName,
    d.L_DName AS Driver_LastName
FROM Bus b
LEFT JOIN Supervisor sp ON b.Supervisor_ID = sp.Supervisor_ID
LEFT JOIN Driver d ON b.Driver_ID = d.Driver_ID;

SELECT * FROM Bus_Student4_View;

-- ================
--       Reham 
-- ================

--  Basic SELECT :

-- Retrieve first name, last name, and registration date of students in the CS department
SELECT F_SName, L_SName, Reg_Date 
FROM Student 
WHERE Department = 'CS';

-- Select all inactive buses with their ID, plate number, and capacity
SELECT Bus_ID, Plate_Num, Capacity 
FROM Bus 
WHERE Status = 'Inactive';

-- Aggregate Functions: 

-- Count how many drivers are assigned to buses
SELECT Driver_ID, COUNT(Bus_ID) AS AssignedBuses
FROM Bus
GROUP BY Driver_ID;

-- Calculate the total salary of all drivers
SELECT SUM(Salary) AS TotalDriverSalary
FROM Driver;

-- Joins :

-- Show all buses and the driver assigned to each bus (NULL if none)
SELECT b.Bus_ID, b.Plate_Num, d.F_DName, d.L_DName
FROM Bus b
LEFT JOIN Driver d ON b.Driver_ID = d.Driver_ID;

-- Show students with their bus plate number and supervisor last name
SELECT s.F_SName, s.L_SName, b.Plate_Num, sp.L_SupName
FROM Student s
INNER JOIN Bus b ON s.Bus_ID = b.Bus_ID
INNER JOIN Supervisor sp ON b.Supervisor_ID = sp.Supervisor_ID;

-- Subqueries : 

-- Retrieve all students assigned to buses whose capacity is less than 50
SELECT *
FROM Student
WHERE Bus_ID IN (
    SELECT Bus_ID 
    FROM Bus
    WHERE Capacity < 50
);

-- Retrieve supervisors who oversee exactly 1 bus
SELECT Supervisor_ID, F_SupName, L_SupName
FROM Supervisor
WHERE Supervisor_ID IN (
    SELECT Supervisor_ID
    FROM Bus
    GROUP BY Supervisor_ID
    HAVING COUNT(*) = 1
);

-- Create VIEW:

-- Create a view showing each bus with its driver and supervisor names
CREATE OR REPLACE VIEW Bus_Driver_Supervisor_Student2 AS
SELECT 
    b.Bus_ID,
    b.Plate_Num,
    b.Capacity,
    d.F_DName AS Driver_FirstName,
    d.L_DName AS Driver_LastName,
    sp.F_SupName AS Supervisor_FirstName,
    sp.L_SupName AS Supervisor_LastName
FROM Bus b
LEFT JOIN Driver d ON b.Driver_ID = d.Driver_ID
INNER JOIN Supervisor sp ON b.Supervisor_ID = sp.Supervisor_ID;

SELECT * FROM Bus_Driver_Supervisor_Student2;

-- ================
--       Lujain 
-- ================

--  Basic SELECT :

-- Retrieve all shift types for driver with Driver_ID = 1
SELECT Shift_Type, Driver_ID
FROM Driver_Shift_Type
WHERE Driver_ID = 1;

-- Retrieve all areas with code starting with 'SH'
SELECT Area_ID, Area_Code, Area_Name
FROM Area
WHERE Area_Code LIKE 'SH%';

-- Aggregate Functions: 

-- Count how many buses cover each area
SELECT Area_ID, COUNT(Bus_ID) AS NumberOfBuses
FROM Bus_Area
GROUP BY Area_ID;

-- Find the maximum number of shifts any driver has
SELECT MAX(NumShifts) AS MaxShifts
FROM (
    SELECT Driver_ID, COUNT(Shift_Type) AS NumShifts
    FROM Driver_Shift_Type
    GROUP BY Driver_ID
) AS DriverShifts;

-- Joins :

-- Show all buses and their areas (INNER JOIN)
SELECT b.Bus_ID, b.Plate_Num, a.Area_Name
FROM Bus b
INNER JOIN Bus_Area ba ON b.Bus_ID = ba.Bus_ID
INNER JOIN Area a ON ba.Area_ID = a.Area_ID;

-- Show all drivers with their shift types (LEFT JOIN)
SELECT d.F_DName, d.L_DName, dst.Shift_Type
FROM Driver d
LEFT JOIN Driver_Shift_Type dst ON d.Driver_ID = dst.Driver_ID;

-- Subqueries : 

-- Find all areas that are assigned to more than 1 bus
SELECT *
FROM Area
WHERE Area_ID IN (
    SELECT Area_ID
    FROM Bus_Area
    GROUP BY Area_ID
    HAVING COUNT(Bus_ID) > 1
);

-- Find all drivers who have more than 1 shift
SELECT *
FROM Driver
WHERE Driver_ID IN (
    SELECT Driver_ID
    FROM Driver_Shift_Type
    GROUP BY Driver_ID
    HAVING COUNT(Shift_Type) > 1
);

-- Create VIEW:

-- Create a view showing each bus with its areas
CREATE OR REPLACE VIEW Bus_Area_View AS
SELECT 
    b.Bus_ID,
    b.Plate_Num,
    a.Area_Name
FROM Bus b
INNER JOIN Bus_Area ba ON b.Bus_ID = ba.Bus_ID
INNER JOIN Area a ON ba.Area_ID = a.Area_ID;

SELECT * FROM Bus_Area_View;
