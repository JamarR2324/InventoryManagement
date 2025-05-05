
-- Schema for Inventory Management

CREATE TABLE Suppliers (
    SupplierID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    ContactEmail VARCHAR(100)
);

CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Quantity INT DEFAULT 0,
    Price DECIMAL(10,2),
    SupplierID INT REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE OrderItems (
    OrderItemID SERIAL PRIMARY KEY,
    OrderID INT REFERENCES Orders(OrderID),
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT
);
