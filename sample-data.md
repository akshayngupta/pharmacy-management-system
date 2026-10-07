# Pharmanage — Sample Test Data Reference

> This file is a readable version of `data.sql`. It documents all 50 entries loaded across each table for testing purposes.

---

## 1. Customers (50 records)

| ID | Name | Phone | City |
|----|------|-------|------|
| 1 | Aarav Sharma | 9876543201 | Indore |
| 2 | Priya Patel | 9876543202 | Bhopal |
| 3 | Rohit Verma | 9876543203 | Jaipur |
| 4 | Sneha Iyer | 9876543204 | Mumbai |
| 5 | Karan Mehta | 9876543205 | Delhi |
| 6 | Anjali Singh | 9876543206 | Pune |
| 7 | Vikram Nair | 9876543207 | Ahmedabad |
| 8 | Pooja Gupta | 9876543208 | Lucknow |
| 9 | Manish Yadav | 9876543209 | Hyderabad |
| 10 | Divya Joshi | 9876543210 | Chennai |
| 11 | Suresh Kumar | 9876543211 | Kolkata |
| 12 | Nita Desai | 9876543212 | Surat |
| 13 | Ramesh Tiwari | 9876543213 | Nagpur |
| 14 | Kavya Reddy | 9876543214 | Bangalore |
| 15 | Ajay Malhotra | 9876543215 | Chandigarh |
| 16 | Deepa Menon | 9876543216 | Kochi |
| 17 | Sanjay Mishra | 9876543217 | Varanasi |
| 18 | Meera Pillai | 9876543218 | Thiruvananthapuram |
| 19 | Rahul Saxena | 9876543219 | Agra |
| 20 | Sunita Chauhan | 9876543220 | Meerut |
| 21 | Alok Pandey | 9876543221 | Patna |
| 22 | Rekha Srivastava | 9876543222 | Allahabad |
| 23 | Nitin Kulkarni | 9876543223 | Nashik |
| 24 | Smita Deshmukh | 9876543224 | Aurangabad |
| 25 | Vijay Pawar | 9876543225 | Kolhapur |
| 26 | Geeta Bhatt | 9876543226 | Vadodara |
| 27 | Harsh Thakkar | 9876543227 | Rajkot |
| 28 | Usha Rathore | 9876543228 | Udaipur |
| 29 | Bhavesh Shah | 9876543229 | Surat |
| 30 | Archana Kapoor | 9876543230 | Faridabad |
| 31 | Dinesh Rawat | 9876543231 | Dehradun |
| 32 | Lalita Bajpai | 9876543232 | Kanpur |
| 33 | Mukesh Agarwal | 9876543233 | Mathura |
| 34 | Swati Jain | 9876543234 | Jodhpur |
| 35 | Tarun Bansal | 9876543235 | Ludhiana |
| 36 | Manju Khanna | 9876543236 | Amritsar |
| 37 | Pawan Taneja | 9876543237 | Shimla |
| 38 | Ritu Arora | 9876543238 | Jalandhar |
| 39 | Gaurav Sethi | 9876543239 | Gurgaon |
| 40 | Anita Bose | 9876543240 | Howrah |
| 41 | Subhash Roy | 9876543241 | Durgapur |
| 42 | Pallavi Ghosh | 9876543242 | Siliguri |
| 43 | Arun Tripathi | 9876543243 | Ranchi |
| 44 | Nidhi Sinha | 9876543244 | Patna |
| 45 | Pramod Chandra | 9876543245 | Bhubaneswar |
| 46 | Lata Nayak | 9876543246 | Cuttack |
| 47 | Kishor Rao | 9876543247 | Vizag |
| 48 | Shobha Krishnan | 9876543248 | Coimbatore |
| 49 | Aditya Venkat | 9876543249 | Madurai |
| 50 | Farida Shaikh | 9876543250 | Nagpur |

---

## 2. Medicine Categories (6 records)

| ID | Name |
|----|------|
| 1 | Tablets |
| 2 | Syrups |
| 3 | Injections |
| 4 | Ointments |
| 5 | Drops |
| 6 | Others |

---

## 3. Medicines (50 records)

| ID | Name | Category | Manufacturer | Price (₹) | Prescription | Reorder Level |
|----|------|----------|--------------|-----------|--------------|---------------|
| 1 | Paracetamol 500mg | Tablets | GSK | 2.50 | No | 100 |
| 2 | Azithromycin 500mg | Tablets | Pfizer | 28.00 | Yes | 20 |
| 3 | Cetirizine 10mg | Tablets | Cipla | 3.00 | No | 50 |
| 4 | Pantoprazole 40mg | Tablets | Sun Pharma | 9.00 | Yes | 40 |
| 5 | Metformin 500mg | Tablets | Torrent | 12.00 | Yes | 30 |
| 6 | Amlodipine 5mg | Tablets | Lupin | 15.00 | Yes | 25 |
| 7 | Atorvastatin 10mg | Tablets | Cipla | 18.00 | Yes | 20 |
| 8 | Amoxicillin 500mg | Tablets | Abbott | 22.00 | Yes | 30 |
| 9 | Doxycycline 100mg | Tablets | Pfizer | 20.00 | Yes | 25 |
| 10 | Ibuprofen 400mg | Tablets | Mankind | 6.00 | No | 60 |
| 11 | Aspirin 75mg | Tablets | Bayer | 4.00 | No | 80 |
| 12 | Domperidone 10mg | Tablets | Sun Pharma | 5.00 | No | 50 |
| 13 | Metronidazole 400mg | Tablets | Cipla | 8.00 | Yes | 40 |
| 14 | Levocetirizine 5mg | Tablets | Ranbaxy | 4.50 | No | 50 |
| 15 | Ranitidine 150mg | Tablets | GSK | 5.50 | No | 40 |
| 16 | Amoxicillin Syrup 60ml | Syrups | Abbott | 85.00 | Yes | 15 |
| 17 | Cough Syrup 100ml | Syrups | Dabur | 65.00 | No | 20 |
| 18 | ORS Sachet | Syrups | Electral | 10.00 | No | 200 |
| 19 | Benadryl 100ml | Syrups | Pfizer | 95.00 | No | 15 |
| 20 | Liv 52 Syrup 200ml | Syrups | Himalaya | 120.00 | No | 10 |
| 21 | Lactulose Syrup 100ml | Syrups | Abbott | 80.00 | Yes | 10 |
| 22 | Zincovit Syrup 200ml | Syrups | Apex | 90.00 | No | 12 |
| 23 | Insulin Injection | Injections | Novo Nordisk | 180.00 | Yes | 10 |
| 24 | Vitamin B12 Injection | Injections | Mankind | 95.00 | Yes | 10 |
| 25 | Dexamethasone Injection | Injections | GSK | 130.00 | Yes | 8 |
| 26 | Ondansetron Injection | Injections | Sun Pharma | 110.00 | Yes | 8 |
| 27 | Tramadol Injection | Injections | Cipla | 160.00 | Yes | 5 |
| 28 | Betadine Ointment 15g | Ointments | Win-Medicare | 55.00 | No | 25 |
| 29 | Volini Gel 30g | Ointments | Ranbaxy | 90.00 | No | 15 |
| 30 | Soframycin Cream 25g | Ointments | Sanofi | 75.00 | No | 20 |
| 31 | Candid Cream 20g | Ointments | Glenmark | 85.00 | Yes | 15 |
| 32 | Burnol Cream 20g | Ointments | Boots | 60.00 | No | 20 |
| 33 | Otrivin Nasal Drops | Drops | Novartis | 70.00 | No | 20 |
| 34 | Cineraria Eye Drops | Drops | Bakson | 60.00 | No | 15 |
| 35 | Visine Eye Drops | Drops | Johnson | 75.00 | No | 15 |
| 36 | Waxsol Ear Drops | Drops | Nycomed | 80.00 | No | 10 |
| 37 | Rhinolast Nasal Drops | Drops | Meda | 95.00 | Yes | 10 |
| 38 | Vitamin C 500mg | Others | Himalaya | 8.00 | No | 150 |
| 39 | Vitamin D3 Sachet | Others | Sun Pharma | 22.00 | No | 50 |
| 40 | Fish Oil Capsule | Others | Himalaya | 15.00 | No | 60 |
| 41 | Biotin 10000mcg | Others | HealthKart | 25.00 | No | 40 |
| 42 | Zinc Sulphate 50mg | Others | Cipla | 10.00 | No | 80 |
| 43 | Calcium + Vit D3 | Others | Abbott | 18.00 | No | 70 |
| 44 | Iron + Folic Acid | Others | Sun Pharma | 12.00 | No | 60 |
| 45 | Multivitamin Tablet | Others | Pfizer | 20.00 | No | 50 |
| 46 | Probiotic Capsule | Others | Mankind | 35.00 | No | 30 |
| 47 | Omega 3 Capsule | Others | Himalaya | 28.00 | No | 40 |
| 48 | Glucosamine 500mg | Others | Cipla | 40.00 | No | 25 |
| 49 | Melatonin 5mg | Others | Sun Pharma | 30.00 | No | 20 |
| 50 | Activated Charcoal | Others | GSK | 15.00 | No | 30 |

---

## 4. Stock Batches (50 records)

> ⚠️ Batches marked **EXPIRED** will trigger the `prevent_expired_batch_sale` trigger if sold.
> ⚠️ Batches marked **OUT OF STOCK** will trigger the `prevent_over_selling` trigger.
> 🟡 Batches marked **NEAR EXPIRY** will appear in the near-expiry report view.

| Batch ID | Medicine | Batch No | Expiry Date | Qty | Status |
|----------|----------|----------|-------------|-----|--------|
| 1 | Paracetamol 500mg | B1001 | 2027-06-30 | 200 | ✅ Available |
| 2 | Azithromycin 500mg | B1002 | 2026-12-31 | 25 | ✅ Available |
| 3 | Cetirizine 10mg | B1003 | 2027-03-15 | 120 | ✅ Available |
| 4 | Pantoprazole 40mg | B1004 | 2026-11-30 | 60 | ✅ Available |
| 5 | Metformin 500mg | B1005 | 2027-01-20 | 45 | ✅ Available |
| 6 | Amlodipine 5mg | B1006 | 2027-05-10 | 35 | ✅ Available |
| 7 | Atorvastatin 10mg | B1007 | 2027-02-28 | 50 | ✅ Available |
| 8 | ORS Sachet | B1008 | 2028-01-01 | 500 | ✅ Available |
| 9 | Insulin Injection | B1009 | 2026-12-15 | 15 | ✅ Available |
| 10 | Ibuprofen 400mg | B1010 | 2027-04-20 | 20 | ✅ Available |
| 11 | Aspirin 75mg | B1011 | 2027-08-31 | 40 | ✅ Available |
| 12 | Domperidone 10mg | B1012 | 2027-06-15 | 22 | ✅ Available |
| 13 | Metronidazole 400mg | B1013 | 2027-07-19 | 30 | ✅ Available |
| 14 | Levocetirizine 5mg | B1014 | 2027-09-30 | 18 | ✅ Available |
| 15 | Ranitidine 150mg | B1015 | 2027-12-31 | 300 | ✅ Available |
| 16 | Amoxicillin Syrup | B1016 | 2026-11-20 | 12 | ✅ Available |
| 17 | Cough Syrup 100ml | B1017 | 2027-03-10 | 25 | ✅ Available |
| 18 | ORS Sachet | B1018 | 2028-06-30 | 400 | ✅ Available |
| 19 | Benadryl 100ml | B1019 | 2027-01-15 | 10 | ✅ Available |
| 20 | Liv 52 Syrup | B1020 | 2027-05-31 | 8 | ✅ Available |
| 21 | Lactulose Syrup | B1021 | 2027-02-14 | 14 | ✅ Available |
| 22 | Zincovit Syrup | B1022 | 2027-08-20 | 20 | ✅ Available |
| 23 | Insulin Injection | B1023 | 2026-12-31 | 10 | ✅ Available |
| 24 | Vitamin B12 Inj | B1024 | 2027-11-30 | 12 | ✅ Available |
| 25 | Dexamethasone Inj | B1025 | 2027-04-15 | 6 | ✅ Available |
| 26 | Ondansetron Inj | B1026 | 2027-06-30 | 8 | ✅ Available |
| 27 | Tramadol Inj | B1027 | 2027-09-20 | 5 | ✅ Available |
| 28 | Betadine Ointment | B1028 | 2027-07-31 | 35 | ✅ Available |
| 29 | Volini Gel | B1029 | 2027-10-15 | 20 | ✅ Available |
| 30 | Soframycin Cream | B1030 | 2027-05-20 | 18 | ✅ Available |
| 31 | Candid Cream | B1031 | 2027-08-10 | 22 | ✅ Available |
| 32 | Burnol Cream | B1032 | 2027-03-25 | 16 | ✅ Available |
| 33 | Otrivin Nasal Drops | B1033 | 2027-11-20 | 25 | ✅ Available |
| 34 | Cineraria Eye Drops | B1034 | 2027-12-15 | 20 | ✅ Available |
| 35 | Visine Eye Drops | B1035 | 2027-06-20 | 18 | ✅ Available |
| 36 | Waxsol Ear Drops | B1036 | 2027-09-10 | 14 | ✅ Available |
| 37 | Rhinolast Nasal Drops | B1037 | 2027-04-28 | 12 | ✅ Available |
| 38 | Vitamin C 500mg | B1038 | 2027-12-31 | 250 | ✅ Available |
| 39 | Vitamin D3 Sachet | B1039 | 2027-10-20 | 60 | ✅ Available |
| 40 | Fish Oil Capsule | B1040 | 2027-08-31 | 55 | ✅ Available |
| 41 | Biotin 10000mcg | B1041 | 2027-07-15 | 40 | ✅ Available |
| 42 | Zinc Sulphate 50mg | B1042 | 2027-06-10 | 75 | ✅ Available |
| 43 | Calcium + Vit D3 | B1043 | 2027-11-30 | 90 | ✅ Available |
| 44 | Paracetamol 500mg | B2001 | 2024-01-01 | 50 | ❌ Expired |
| 45 | Azithromycin 500mg | B2002 | 2023-12-31 | 30 | ❌ Expired |
| 46 | Atorvastatin 10mg | B2003 | 2024-06-30 | 20 | ❌ Expired |
| 47 | Insulin Injection | B3001 | 2027-03-31 | 0 | ⛔ Out of Stock |
| 48 | Insulin Injection | B3002 | 2027-06-30 | 0 | ⛔ Out of Stock |
| 49 | Cetirizine 10mg | B4001 | 2026-10-31 | 8 | 🟡 Near Expiry |
| 50 | Cough Syrup 100ml | B4002 | 2026-10-30 | 5 | 🟡 Near Expiry |

---

## 5. Sales (50 records)

| Sale ID | Customer | Date | Payment Mode | Amount (₹) |
|---------|----------|------|--------------|------------|
| 1 | Aarav Sharma | 2026-09-01 | Cash | 50.00 |
| 2 | Priya Patel | 2026-09-01 | UPI | 196.00 |
| 3 | Rohit Verma | 2026-09-02 | Card | 540.00 |
| 4 | Sneha Iyer | 2026-09-02 | Cash | 30.00 |
| 5 | Karan Mehta | 2026-09-03 | UPI | 170.00 |
| 6 | Anjali Singh | 2026-09-03 | Card | 280.00 |
| 7 | Vikram Nair | 2026-09-04 | Cash | 24.00 |
| 8 | Pooja Gupta | 2026-09-04 | UPI | 360.00 |
| 9 | Manish Yadav | 2026-09-05 | Card | 80.00 |
| 10 | Divya Joshi | 2026-09-05 | Cash | 110.00 |
| 11 | Suresh Kumar | 2026-09-06 | UPI | 200.00 |
| 12 | Nita Desai | 2026-09-06 | Cash | 90.00 |
| 13 | Ramesh Tiwari | 2026-09-07 | Card | 450.00 |
| 14 | Kavya Reddy | 2026-09-07 | UPI | 60.00 |
| 15 | Ajay Malhotra | 2026-09-08 | Cash | 130.00 |
| 16 | Deepa Menon | 2026-09-08 | Card | 275.00 |
| 17 | Sanjay Mishra | 2026-09-09 | UPI | 85.00 |
| 18 | Meera Pillai | 2026-09-09 | Cash | 40.00 |
| 19 | Rahul Saxena | 2026-09-10 | Card | 180.00 |
| 20 | Sunita Chauhan | 2026-09-10 | UPI | 55.00 |
| 21 | Alok Pandey | 2026-09-11 | Cash | 240.00 |
| 22 | Rekha Srivastava | 2026-09-11 | Card | 320.00 |
| 23 | Nitin Kulkarni | 2026-09-12 | UPI | 96.00 |
| 24 | Smita Deshmukh | 2026-09-12 | Cash | 150.00 |
| 25 | Vijay Pawar | 2026-09-13 | Card | 190.00 |
| 26 | Geeta Bhatt | 2026-09-13 | UPI | 70.00 |
| 27 | Harsh Thakkar | 2026-09-14 | Cash | 260.00 |
| 28 | Usha Rathore | 2026-09-14 | Card | 420.00 |
| 29 | Bhavesh Shah | 2026-09-15 | UPI | 100.00 |
| 30 | Archana Kapoor | 2026-09-15 | Cash | 80.00 |
| 31 | Dinesh Rawat | 2026-09-16 | Card | 200.00 |
| 32 | Lalita Bajpai | 2026-09-16 | UPI | 140.00 |
| 33 | Mukesh Agarwal | 2026-09-17 | Cash | 56.00 |
| 34 | Swati Jain | 2026-09-17 | Card | 300.00 |
| 35 | Tarun Bansal | 2026-09-18 | UPI | 160.00 |
| 36 | Manju Khanna | 2026-09-18 | Cash | 90.00 |
| 37 | Pawan Taneja | 2026-09-19 | Card | 350.00 |
| 38 | Ritu Arora | 2026-09-19 | UPI | 220.00 |
| 39 | Gaurav Sethi | 2026-09-20 | Cash | 48.00 |
| 40 | Anita Bose | 2026-09-20 | Card | 130.00 |
| 41 | Subhash Roy | 2026-09-21 | UPI | 270.00 |
| 42 | Pallavi Ghosh | 2026-09-21 | Cash | 60.00 |
| 43 | Arun Tripathi | 2026-09-22 | Card | 390.00 |
| 44 | Nidhi Sinha | 2026-09-22 | UPI | 175.00 |
| 45 | Pramod Chandra | 2026-09-23 | Cash | 95.00 |
| 46 | Lata Nayak | 2026-09-23 | Card | 240.00 |
| 47 | Kishor Rao | 2026-09-24 | UPI | 310.00 |
| 48 | Shobha Krishnan | 2026-09-24 | Cash | 70.00 |
| 49 | Aditya Venkat | 2026-09-25 | Card | 185.00 |
| 50 | Farida Shaikh | 2026-09-25 | UPI | 120.00 |

---

## 6. DBMS Feature Coverage Summary

| Feature | How It's Tested |
|---------|----------------|
| **Triggers** | Batches 44, 45, 46 (Expired) & 47, 48 (Out of Stock) exist to demonstrate blocked inserts |
| **`available_stock_view`** | Only batches 1–43, 49, 50 (non-expired, qty > 0) appear |
| **`low_stock_view`** | Batches 49 & 50 have qty 8 & 5 which are below reorder level |
| **Stored Procedure** | All SaleItems are created via `create_sale_item()` which auto-reduces stock |
| **Foreign Keys** | Sale → Customer, SaleItem → Sale + StockBatch, Medicine → Category |
| **ENUM** | StockBatch status: `Available / Expired / Out of Stock` |
| **Indexes** | `Customer(phone)`, `Medicine(name)` created for fast search |
