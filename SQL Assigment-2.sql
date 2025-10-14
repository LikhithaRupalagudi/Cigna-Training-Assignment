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
