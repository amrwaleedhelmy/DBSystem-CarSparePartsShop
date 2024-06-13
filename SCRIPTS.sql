-- Create tables
use pro;
CREATE TABLE Customers (
Customer_Code INT PRIMARY KEY,
Customer_Name VARCHAR(255)
);

CREATE TABLE Items (
Item_ID INT PRIMARY KEY,
Item_Description VARCHAR(255),
Price DECIMAL(10,2)
);

CREATE TABLE Orders (
Order_ID INT PRIMARY KEY,
Date DATE,
Time TIME,
Customer_Code INT,
FOREIGN KEY (Customer_Code) REFERENCES Customers(Customer_Code)
);

CREATE TABLE Order_Details (
Order_ID INT,
Item_ID INT,
Quantity INT,
PRIMARY KEY (Order_ID, Item_ID),
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
FOREIGN KEY (Item_ID) REFERENCES Items(Item_ID)
);

-- Insert data into tables
INSERT INTO Customers (Customer_Code, Customer_Name)
VALUES
(20090281,'Ali Ahmed'),
(20090286, 'Omr Hamed'),
(20070333, 'Heba Hasan');

INSERT INTO Items (Item_ID, Item_Description, Price)
VALUES
(2315-0060, 'Handle', 2),
(1103-1, '20 in. Tyre', 3),
(1102-1, '24 in. Tyre', 4),
(1101-1, '26 in. Tyre', 5),
(1100-1, '28 in. Tyre', 3),
(6661-1041, 'Screw Driver', 1),
(3999-1050, 'Spanner', 1);

INSERT INTO Orders (Order_ID, Date, Time, Customer_Code)
VALUES
(110, '2023-03-01', '12:33:00', 20090281),
(111, '2023-03-10', '13:30:00', 20090286),
(112, '2023-03-13', '10:15:00', 20090281),
(113, '2023-03-01', '10:00:00', 20070333),
(114, '2023-03-02', '09:45:00', 20090286),
(115, '2023-03-03', '08:40:00', 20090281),
(116, '2023-03-04', '07:30:00', 20090286);

INSERT INTO Order_Details (Order_ID, Item_ID, Quantity)
VALUES
(110, 2315-0060, 2),
(110, 1103-1, 5),
(111, 1102-1, 5),
(111, 1101-1, 10),
(112, 1103-1, 5),
(112, 1101-1, 10),
(113, 1101-1, 50),
(114, 1103-1, 25),
(115, 1103-1, 25),
(116, 1100-1, 4),
(116, 1103-1, 5),
(116, 6661-1041, 5),
(116, 3999-1050, 50);

-- Trigger that inserts the date and time every time an order is inserted
CREATE TRIGGER add_timestamp 
BEFORE INSERT ON Orders 
FOR EACH ROW 
SET NEW.Date = CURDATE(), NEW.Time = CURTIME();

-- Total price for every order
use pro;
CREATE VIEW TotalPrice AS
SELECT Order_ID, SUM(Quantity * Price) AS Total_Price
FROM Orders 
JOIN Order_Details ON Orders.Order_ID = Order_Details.Order_ID 
JOIN Items ON Order_Details.Item_ID = Items.Item_ID 
GROUP BY Order_ID;

-- Total number of orders for every customer
use pro;
CREATE VIEW NumOrders AS
SELECT Customer_Code, COUNT(DISTINCT Order_ID) AS Num_Orders
FROM Orders 
GROUP BY Customer_Code;
