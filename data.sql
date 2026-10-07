-- ============================================================
-- PHARMANAGE - COMPREHENSIVE TEST DATA (50+ entries per table)
-- Run AFTER schema.sql and advanced.sql
-- ============================================================

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE SaleItem;
TRUNCATE TABLE Sale;
TRUNCATE TABLE StockBatch;
TRUNCATE TABLE Medicine;
TRUNCATE TABLE MedicineCategory;
TRUNCATE TABLE Customer;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- 1. CUSTOMERS (50 records)
-- ============================================================
INSERT INTO Customer (name, phone, city) VALUES
('Aarav Sharma',      '9876543201', 'Indore'),
('Priya Patel',       '9876543202', 'Bhopal'),
('Rohit Verma',       '9876543203', 'Jaipur'),
('Sneha Iyer',        '9876543204', 'Mumbai'),
('Karan Mehta',       '9876543205', 'Delhi'),
('Anjali Singh',      '9876543206', 'Pune'),
('Vikram Nair',       '9876543207', 'Ahmedabad'),
('Pooja Gupta',       '9876543208', 'Lucknow'),
('Manish Yadav',      '9876543209', 'Hyderabad'),
('Divya Joshi',       '9876543210', 'Chennai'),
('Suresh Kumar',      '9876543211', 'Kolkata'),
('Nita Desai',        '9876543212', 'Surat'),
('Ramesh Tiwari',     '9876543213', 'Nagpur'),
('Kavya Reddy',       '9876543214', 'Bangalore'),
('Ajay Malhotra',     '9876543215', 'Chandigarh'),
('Deepa Menon',       '9876543216', 'Kochi'),
('Sanjay Mishra',     '9876543217', 'Varanasi'),
('Meera Pillai',      '9876543218', 'Thiruvananthapuram'),
('Rahul Saxena',      '9876543219', 'Agra'),
('Sunita Chauhan',    '9876543220', 'Meerut'),
('Alok Pandey',       '9876543221', 'Patna'),
('Rekha Srivastava',  '9876543222', 'Allahabad'),
('Nitin Kulkarni',    '9876543223', 'Nashik'),
('Smita Deshmukh',    '9876543224', 'Aurangabad'),
('Vijay Pawar',       '9876543225', 'Kolhapur'),
('Geeta Bhatt',       '9876543226', 'Vadodara'),
('Harsh Thakkar',     '9876543227', 'Rajkot'),
('Usha Rathore',      '9876543228', 'Udaipur'),
('Bhavesh Shah',      '9876543229', 'Surat'),
('Archana Kapoor',    '9876543230', 'Faridabad'),
('Dinesh Rawat',      '9876543231', 'Dehradun'),
('Lalita Bajpai',     '9876543232', 'Kanpur'),
('Mukesh Agarwal',    '9876543233', 'Mathura'),
('Swati Jain',        '9876543234', 'Jodhpur'),
('Tarun Bansal',      '9876543235', 'Ludhiana'),
('Manju Khanna',      '9876543236', 'Amritsar'),
('Pawan Taneja',      '9876543237', 'Shimla'),
('Ritu Arora',        '9876543238', 'Jalandhar'),
('Gaurav Sethi',      '9876543239', 'Gurgaon'),
('Anita Bose',        '9876543240', 'Howrah'),
('Subhash Roy',       '9876543241', 'Durgapur'),
('Pallavi Ghosh',     '9876543242', 'Siliguri'),
('Arun Tripathi',     '9876543243', 'Ranchi'),
('Nidhi Sinha',       '9876543244', 'Patna'),
('Pramod Chandra',    '9876543245', 'Bhubaneswar'),
('Lata Nayak',        '9876543246', 'Cuttack'),
('Kishor Rao',        '9876543247', 'Vizag'),
('Shobha Krishnan',   '9876543248', 'Coimbatore'),
('Aditya Venkat',     '9876543249', 'Madurai'),
('Farida Shaikh',     '9876543250', 'Nagpur');

-- ============================================================
-- 2. MEDICINE CATEGORIES (6 records)
-- ============================================================
INSERT INTO MedicineCategory (name) VALUES
('Tablets'),
('Syrups'),
('Injections'),
('Ointments'),
('Drops'),
('Others');

-- ============================================================
-- 3. MEDICINES (50 records)
-- ============================================================
INSERT INTO Medicine (name, category_id, manufacturer, unit_price, prescription_required, reorder_level) VALUES
-- Tablets (cat 1)
('Paracetamol 500mg',        1, 'GSK',            2.50,  0, 100),
('Azithromycin 500mg',       1, 'Pfizer',         28.00, 1,  20),
('Cetirizine 10mg',          1, 'Cipla',           3.00, 0,  50),
('Pantoprazole 40mg',        1, 'Sun Pharma',      9.00, 1,  40),
('Metformin 500mg',          1, 'Torrent',        12.00, 1,  30),
('Amlodipine 5mg',           1, 'Lupin',          15.00, 1,  25),
('Atorvastatin 10mg',        1, 'Cipla',          18.00, 1,  20),
('Amoxicillin 500mg',        1, 'Abbott',         22.00, 1,  30),
('Doxycycline 100mg',        1, 'Pfizer',         20.00, 1,  25),
('Ibuprofen 400mg',          1, 'Mankind',         6.00, 0,  60),
('Aspirin 75mg',             1, 'Bayer',           4.00, 0,  80),
('Domperidone 10mg',         1, 'Sun Pharma',      5.00, 0,  50),
('Metronidazole 400mg',      1, 'Cipla',           8.00, 1,  40),
('Levocetirizine 5mg',       1, 'Ranbaxy',         4.50, 0,  50),
('Ranitidine 150mg',         1, 'GSK',             5.50, 0,  40),
-- Syrups (cat 2)
('Amoxicillin Syrup 60ml',   2, 'Abbott',         85.00, 1,  15),
('Cough Syrup 100ml',        2, 'Dabur',          65.00, 0,  20),
('ORS Sachet',               2, 'Electral',       10.00, 0, 200),
('Benadryl 100ml',           2, 'Pfizer',         95.00, 0,  15),
('Liv 52 Syrup 200ml',       2, 'Himalaya',      120.00, 0,  10),
('Lactulose Syrup 100ml',    2, 'Abbott',         80.00, 1,  10),
('Zincovit Syrup 200ml',     2, 'Apex',           90.00, 0,  12),
-- Injections (cat 3)
('Insulin Injection',        3, 'Novo Nordisk',  180.00, 1,  10),
('Vitamin B12 Injection',    3, 'Mankind',        95.00, 1,  10),
('Dexamethasone Injection',  3, 'GSK',           130.00, 1,   8),
('Ondansetron Injection',    3, 'Sun Pharma',    110.00, 1,   8),
('Tramadol Injection',       3, 'Cipla',         160.00, 1,   5),
-- Ointments (cat 4)
('Betadine Ointment 15g',    4, 'Win-Medicare',   55.00, 0,  25),
('Volini Gel 30g',           4, 'Ranbaxy',        90.00, 0,  15),
('Soframycin Cream 25g',     4, 'Sanofi',         75.00, 0,  20),
('Candid Cream 20g',         4, 'Glenmark',       85.00, 1,  15),
('Burnol Cream 20g',         4, 'Boots',          60.00, 0,  20),
-- Drops (cat 5)
('Otrivin Nasal Drops',      5, 'Novartis',       70.00, 0,  20),
('Cineraria Eye Drops',      5, 'Bakson',         60.00, 0,  15),
('Visine Eye Drops',         5, 'Johnson',        75.00, 0,  15),
('Waxsol Ear Drops',         5, 'Nycomed',        80.00, 0,  10),
('Rhinolast Nasal Drops',    5, 'Meda',           95.00, 1,  10),
-- Others (cat 6)
('Vitamin C 500mg',          6, 'Himalaya',        8.00, 0, 150),
('Vitamin D3 Sachet',        6, 'Sun Pharma',     22.00, 0,  50),
('Fish Oil Capsule',         6, 'Himalaya',       15.00, 0,  60),
('Biotin 10000mcg',          6, 'HealthKart',     25.00, 0,  40),
('Zinc Sulphate 50mg',       6, 'Cipla',          10.00, 0,  80),
('Calcium + Vit D3',         6, 'Abbott',         18.00, 0,  70),
('Iron + Folic Acid',        6, 'Sun Pharma',     12.00, 0,  60),
('Multivitamin Tablet',      6, 'Pfizer',         20.00, 0,  50),
('Probiotic Capsule',        6, 'Mankind',        35.00, 0,  30),
('Omega 3 Capsule',          6, 'Himalaya',       28.00, 0,  40),
('Glucosamine 500mg',        6, 'Cipla',          40.00, 0,  25),
('Melatonin 5mg',            6, 'Sun Pharma',     30.00, 0,  20),
('Activated Charcoal',       6, 'GSK',            15.00, 0,  30);

-- ============================================================
-- 4. STOCK BATCHES (50 records)
-- Covers: Available, Expired, Out of Stock, Near-Expiry, Low Stock
-- ============================================================
INSERT INTO StockBatch (medicine_id, batch_number, expiry_date, quantity, status) VALUES
-- Good available stock
(1,  'B1001', '2027-06-30', 200, 'Available'),
(2,  'B1002', '2026-12-31',  25, 'Available'),
(3,  'B1003', '2027-03-15', 120, 'Available'),
(4,  'B1004', '2026-11-30',  60, 'Available'),
(5,  'B1005', '2027-01-20',  45, 'Available'),
(6,  'B1006', '2027-05-10',  35, 'Available'),
(7,  'B1007', '2027-02-28',  50, 'Available'),
(8,  'B1008', '2028-01-01', 500, 'Available'),
(9,  'B1009', '2026-12-15',  15, 'Available'),
(10, 'B1010', '2027-04-20',  20, 'Available'),
(11, 'B1011', '2027-08-31',  40, 'Available'),
(12, 'B1012', '2027-06-15',  22, 'Available'),
(13, 'B1013', '2027-07-19',  30, 'Available'),
(14, 'B1014', '2027-09-30',  18, 'Available'),
(15, 'B1015', '2027-12-31', 300, 'Available'),
(16, 'B1016', '2026-11-20',  12, 'Available'),
(17, 'B1017', '2027-03-10',  25, 'Available'),
(18, 'B1018', '2028-06-30', 400, 'Available'),
(19, 'B1019', '2027-01-15',  10, 'Available'),
(20, 'B1020', '2027-05-31',   8, 'Available'),
(21, 'B1021', '2027-02-14',  14, 'Available'),
(22, 'B1022', '2027-08-20',  20, 'Available'),
(23, 'B1023', '2026-12-31',  10, 'Available'),
(24, 'B1024', '2027-11-30',  12, 'Available'),
(25, 'B1025', '2027-04-15',   6, 'Available'),
(26, 'B1026', '2027-06-30',   8, 'Available'),
(27, 'B1027', '2027-09-20',   5, 'Available'),
(28, 'B1028', '2027-07-31',  35, 'Available'),
(29, 'B1029', '2027-10-15',  20, 'Available'),
(30, 'B1030', '2027-05-20',  18, 'Available'),
(31, 'B1031', '2027-08-10',  22, 'Available'),
(32, 'B1032', '2027-03-25',  16, 'Available'),
(33, 'B1033', '2027-11-20',  25, 'Available'),
(34, 'B1034', '2027-12-15',  20, 'Available'),
(35, 'B1035', '2027-06-20',  18, 'Available'),
(36, 'B1036', '2027-09-10',  14, 'Available'),
(37, 'B1037', '2027-04-28',  12, 'Available'),
(38, 'B1038', '2027-12-31', 250, 'Available'),
(39, 'B1039', '2027-10-20',  60, 'Available'),
(40, 'B1040', '2027-08-31',  55, 'Available'),
(41, 'B1041', '2027-07-15',  40, 'Available'),
(42, 'B1042', '2027-06-10',  75, 'Available'),
(43, 'B1043', '2027-11-30',  90, 'Available'),
-- EXPIRED batches (test trigger)
(1,  'B2001', '2024-01-01',  50, 'Expired'),
(2,  'B2002', '2023-12-31',  30, 'Expired'),
(7,  'B2003', '2024-06-30',  20, 'Expired'),
-- OUT OF STOCK (test trigger)
(9,  'B3001', '2027-03-31',   0, 'Out of Stock'),
(23, 'B3002', '2027-06-30',   0, 'Out of Stock'),
-- NEAR EXPIRY + LOW STOCK (tests low_stock_view and near-expiry report)
(3,  'B4001', '2026-10-31',   8, 'Available'),
(17, 'B4002', '2026-10-30',   5, 'Available');

-- ============================================================
-- 5. SALES (50 records)
-- ============================================================
INSERT INTO Sale (customer_id, sale_date, payment_mode, total_amount) VALUES
(1,  '2026-09-01 09:00:00', 'Cash',    50.00),
(2,  '2026-09-01 10:30:00', 'UPI',    196.00),
(3,  '2026-09-02 11:00:00', 'Card',   540.00),
(4,  '2026-09-02 12:00:00', 'Cash',    30.00),
(5,  '2026-09-03 09:30:00', 'UPI',    170.00),
(6,  '2026-09-03 14:00:00', 'Card',   280.00),
(7,  '2026-09-04 10:00:00', 'Cash',    24.00),
(8,  '2026-09-04 15:00:00', 'UPI',    360.00),
(9,  '2026-09-05 11:00:00', 'Card',    80.00),
(10, '2026-09-05 16:00:00', 'Cash',   110.00),
(11, '2026-09-06 09:00:00', 'UPI',    200.00),
(12, '2026-09-06 11:30:00', 'Cash',    90.00),
(13, '2026-09-07 10:00:00', 'Card',   450.00),
(14, '2026-09-07 14:30:00', 'UPI',     60.00),
(15, '2026-09-08 09:00:00', 'Cash',   130.00),
(16, '2026-09-08 12:00:00', 'Card',   275.00),
(17, '2026-09-09 10:30:00', 'UPI',     85.00),
(18, '2026-09-09 15:30:00', 'Cash',    40.00),
(19, '2026-09-10 09:00:00', 'Card',   180.00),
(20, '2026-09-10 11:00:00', 'UPI',     55.00),
(21, '2026-09-11 10:00:00', 'Cash',   240.00),
(22, '2026-09-11 14:00:00', 'Card',   320.00),
(23, '2026-09-12 09:30:00', 'UPI',     96.00),
(24, '2026-09-12 13:00:00', 'Cash',   150.00),
(25, '2026-09-13 10:00:00', 'Card',   190.00),
(26, '2026-09-13 15:00:00', 'UPI',     70.00),
(27, '2026-09-14 09:00:00', 'Cash',   260.00),
(28, '2026-09-14 12:30:00', 'Card',   420.00),
(29, '2026-09-15 10:00:00', 'UPI',    100.00),
(30, '2026-09-15 14:00:00', 'Cash',    80.00),
(31, '2026-09-16 09:30:00', 'Card',   200.00),
(32, '2026-09-16 13:30:00', 'UPI',    140.00),
(33, '2026-09-17 10:00:00', 'Cash',    56.00),
(34, '2026-09-17 15:00:00', 'Card',   300.00),
(35, '2026-09-18 09:00:00', 'UPI',    160.00),
(36, '2026-09-18 12:00:00', 'Cash',    90.00),
(37, '2026-09-19 10:30:00', 'Card',   350.00),
(38, '2026-09-19 14:30:00', 'UPI',    220.00),
(39, '2026-09-20 09:00:00', 'Cash',    48.00),
(40, '2026-09-20 11:30:00', 'Card',   130.00),
(41, '2026-09-21 10:00:00', 'UPI',    270.00),
(42, '2026-09-21 14:00:00', 'Cash',    60.00),
(43, '2026-09-22 09:30:00', 'Card',   390.00),
(44, '2026-09-22 13:00:00', 'UPI',    175.00),
(45, '2026-09-23 10:00:00', 'Cash',    95.00),
(46, '2026-09-23 15:00:00', 'Card',   240.00),
(47, '2026-09-24 09:00:00', 'UPI',    310.00),
(48, '2026-09-24 12:30:00', 'Cash',    70.00),
(49, '2026-09-25 10:00:00', 'Card',   185.00),
(50, '2026-09-25 14:00:00', 'UPI',    120.00);

-- ============================================================
-- 6. SALE ITEMS via stored procedure (auto reduces stock)
-- ============================================================
CALL create_sale_item(1,  1,  20);
CALL create_sale_item(2,  2,   7);
CALL create_sale_item(3,  9,   3);
CALL create_sale_item(4,  3,  10);
CALL create_sale_item(5,  6,   2);
CALL create_sale_item(6,  12,  2);
CALL create_sale_item(6,  8,  10);
CALL create_sale_item(7,  7,   1);
CALL create_sale_item(7,  15,  4);
CALL create_sale_item(8,  10,  2);
CALL create_sale_item(8,  11,  2);
CALL create_sale_item(9,  4,   2);
CALL create_sale_item(9,  13,  1);
CALL create_sale_item(10, 14,  1);
CALL create_sale_item(10, 5,   3);
CALL create_sale_item(11, 38,  5);
CALL create_sale_item(12, 28,  1);
CALL create_sale_item(13, 9,   2);
CALL create_sale_item(14, 39,  3);
CALL create_sale_item(15, 17,  2);
CALL create_sale_item(16, 29,  2);
CALL create_sale_item(16, 30,  1);
CALL create_sale_item(17, 16,  1);
CALL create_sale_item(18, 18, 10);
CALL create_sale_item(19, 23,  1);
CALL create_sale_item(20, 42,  5);
CALL create_sale_item(21, 24,  2);
CALL create_sale_item(22, 33,  2);
CALL create_sale_item(23, 11,  2);
CALL create_sale_item(24, 22,  2);
CALL create_sale_item(25, 26,  1);
CALL create_sale_item(26, 41, 10);
CALL create_sale_item(27, 20,  1);
CALL create_sale_item(27, 6,   2);
CALL create_sale_item(28, 25,  1);
CALL create_sale_item(28, 27,  1);
CALL create_sale_item(29, 43, 10);
CALL create_sale_item(30, 31,  2);
CALL create_sale_item(31, 21,  2);
CALL create_sale_item(32, 32,  1);
CALL create_sale_item(33, 40, 20);
CALL create_sale_item(34, 34,  1);
CALL create_sale_item(35, 35,  1);
CALL create_sale_item(36, 36,  1);
CALL create_sale_item(37, 37,  1);
CALL create_sale_item(38, 1,   5);
CALL create_sale_item(39, 3,  10);
CALL create_sale_item(40, 7,   2);
CALL create_sale_item(41, 15, 50);
CALL create_sale_item(42, 19,  1);
CALL create_sale_item(43, 24,  2);
CALL create_sale_item(44, 10,  2);
-- Sales 45-50 use only valid available batches (NOT expired/out-of-stock)
CALL create_sale_item(45, 38,  3);
CALL create_sale_item(46, 39,  2);
CALL create_sale_item(47, 40,  1);
CALL create_sale_item(48, 41,  2);
CALL create_sale_item(49, 42,  3);
CALL create_sale_item(50, 43,  2);

SELECT 'Test data loaded successfully! 50 entries across all tables.' AS Status;
