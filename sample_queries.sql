
-- Insert sample data and test functionality

INSERT INTO Suppliers(Name, ContactEmail) VALUES ('Acme Inc.', 'acme@example.com');
INSERT INTO Products(Name, Quantity, Price, SupplierID) VALUES ('Gadget', 50, 19.99, 1);
INSERT INTO Customers(Name, Email) VALUES ('Jamar', 'jamar@example.com');

-- Place a valid order
SELECT PlaceOrder(1, 1, 5);

-- View stock report
SELECT * FROM StockReport;

-- Try to place an order that exceeds stock
-- SELECT PlaceOrder(1, 1, 100); -- Should raise an exception
