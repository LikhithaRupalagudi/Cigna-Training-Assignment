------------------------------------------------------------------------------- ------------Online Store Inventory------------------------------------------------------------------------------------------------

CREATE database Online_Store_Inventory;

CREATE TABLE Products (
Product_Id NUMBER PRIMARY KEY,
Product_Name VARCHAR(20) NOT NULL,
Categories VARCHAR(20) NOT NULL,
Prices NUMBER CHECK(Prices > 0),
Product_stock NUMBER DEFAULT 0
);
 
CREATE TABLE Customers(
Customer_Id NUMBER PRIMARY KEY,
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
Email VARCHAR(10) UNIQUE,
Phn_no VARCHAR(15)
);

CREATE TABLE Orders(
Order_Id NUMBER PRIMARY KEY,
Customer_Id NUMBER NOT NULL,
Order_Date DATE DEFAULT SYSDATE,
Total_Amount NUMBER CHECK(Total_Amount > 0),
CONSTRAINT fk_Customer FOREIGN KEY(Customer_Id) REFERENCES Customers(Customer_Id)
);

CREATE TABLE OrderDetails(
OrderDetails_Id NUMBER PRIMARY KEY,
Order_Id NUMBER NOT NULL,
Product_Id NUMBER NOT NULL,
Quantity NUMBER CHECK (Quantity > 0),
CONSTRAINT fk_Order FOREIGN KEY(Order_Id) REFERENCES Orders(Order_Id),
CONSTRAINT fk_Product FOREIGN KEY(Product_Id) REFERENCES Products(Product_Id)
);


-- Inserting Values Into Products TABLE
INSERT INTO Products VALUES (101, 'Laptop', 'Electronics', 55000, 25);
INSERT INTO Products VALUES (102, 'Headphones', 'Accessories', 2500, 50);
INSERT INTO Products VALUES (102, 'Headphones', 'Accessories', 3500, 40);
INSERT INTO Products VALUES (102, 'Earphones', 'Accessories', 2000, 30);

-- Inserting Values Into Customers TABLE
INSERT INTO Customers VALUES (201, 'John', 'Doe', 'johndoe26@gmail.com', '9876543120');
INSERT INTO Customers VALUES (202, 'David', 'Brown', 'davidbrown8@example.com', '9123456780');
INSERT INTO Customers VALUES (203, 'Rahul', 'doe', 'rahul8@example.com', '9198756780');

-- Inserting Values Into Orders TABLE
INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount) VALUES (301, 201, SYSDATE, 0);
INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount) VALUES (302, 202, SYSDATE, 0);
INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount) VALUES (303, 204, SYSDATE, 0);

-- Inserting Values Into OrderDetails TABLE
INSERT INTO OrderDetails VALUES (401, 301, 101, 1);
INSERT INTO OrderDetails VALUES (402, 302, 102, 2);
INSERT INTO OrderDetails VALUES (403, 303, 103, 3);

--QUERY 1: Retrieve products with low stock (eg: less than 20 units)
SELECT *
FROM Products
WHERE Stock_Quantity < 20;
