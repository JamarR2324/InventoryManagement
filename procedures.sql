
-- Stored Procedure: Place an Order

CREATE OR REPLACE FUNCTION PlaceOrder(cust_id INT, prod_id INT, qty INT)
RETURNS VOID AS $$
DECLARE
    stock INT;
BEGIN
    SELECT Quantity INTO stock FROM Products WHERE ProductID = prod_id;

    IF stock < qty THEN
        RAISE EXCEPTION 'Not enough stock available.';
    END IF;

    INSERT INTO Orders(CustomerID) VALUES (cust_id);
    INSERT INTO OrderItems(OrderID, ProductID, Quantity)
    VALUES (currval('Orders_OrderID_seq'), prod_id, qty);

    UPDATE Products SET Quantity = Quantity - qty WHERE ProductID = prod_id;
END;
$$ LANGUAGE plpgsql;
