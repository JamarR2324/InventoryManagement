
-- View: Available Stock Report

CREATE OR REPLACE VIEW StockReport AS
SELECT 
    p.Name AS Product,
    s.Name AS Supplier,
    p.Quantity,
    p.Price
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID;
