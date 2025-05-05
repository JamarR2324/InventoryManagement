
-- Trigger: Prevent Negative Stock

CREATE OR REPLACE FUNCTION check_stock()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Quantity < 0 THEN
        RAISE EXCEPTION 'Stock cannot go negative!';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_stock
BEFORE UPDATE ON Products
FOR EACH ROW
EXECUTE FUNCTION check_stock();
