CREATE VIEW available_stock_view AS
SELECT * FROM StockBatch WHERE quantity > 0 AND expiry_date > CURDATE() AND status = 'Available';

CREATE VIEW low_stock_view AS
SELECT m.id, m.name, SUM(s.quantity) as total_qty, m.reorder_level 
FROM Medicine m 
LEFT JOIN StockBatch s ON m.id = s.medicine_id 
GROUP BY m.id 
HAVING total_qty <= m.reorder_level;

DELIMITER //

CREATE TRIGGER prevent_expired_sale
BEFORE INSERT ON SaleItem
FOR EACH ROW
BEGIN
    DECLARE exp_date DATE;
    SELECT expiry_date INTO exp_date FROM StockBatch WHERE id = NEW.batch_id;
    IF exp_date < CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot sell expired stock';
    END IF;
END //

CREATE TRIGGER prevent_negative_stock
BEFORE UPDATE ON StockBatch
FOR EACH ROW
BEGIN
    IF NEW.quantity < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock quantity cannot be negative';
    END IF;
END //

CREATE PROCEDURE create_sale_item(IN p_sale_id INT, IN p_batch_id INT, IN p_quantity INT)
BEGIN
    DECLARE v_price DECIMAL(10,2);
    SELECT unit_price INTO v_price FROM Medicine m JOIN StockBatch b ON m.id = b.medicine_id WHERE b.id = p_batch_id;
    
    INSERT INTO SaleItem (sale_id, batch_id, quantity, price) VALUES (p_sale_id, p_batch_id, p_quantity, v_price);
    
    UPDATE StockBatch SET quantity = quantity - p_quantity WHERE id = p_batch_id;
END //

DELIMITER ;

CREATE INDEX idx_customer_phone ON Customer(phone);
CREATE INDEX idx_medicine_name ON Medicine(name);
