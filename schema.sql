CREATE TABLE Customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(20) UNIQUE,
    city VARCHAR(100)
);

CREATE TABLE MedicineCategory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Medicine (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT,
    manufacturer VARCHAR(255),
    unit_price DECIMAL(10,2),
    prescription_required BOOLEAN,
    reorder_level INT,
    FOREIGN KEY (category_id) REFERENCES MedicineCategory(id)
);

CREATE TABLE StockBatch (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT,
    batch_number VARCHAR(100),
    expiry_date DATE,
    quantity INT,
    status ENUM('Available', 'Expired', 'Out of Stock'),
    FOREIGN KEY (medicine_id) REFERENCES Medicine(id)
);

CREATE TABLE Sale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    sale_date DATETIME,
    payment_mode VARCHAR(50),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE SaleItem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    batch_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (sale_id) REFERENCES Sale(id),
    FOREIGN KEY (batch_id) REFERENCES StockBatch(id)
);
