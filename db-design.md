# Pharmanage — Database Design Document

A detailed reference covering the relational structure, key design, joins, normalization, and CRUD operations used in the Pharmanage pharmacy management system.

---

## 1. Entity-Relationship Overview

The system has **6 tables** connected through foreign key relationships:

```
MedicineCategory
      │
      │ 1:N
      ▼
   Medicine
      │
      │ 1:N
      ▼
 StockBatch ──────────────────┐
                              │ N:1
Customer                  SaleItem
   │                          │
   │ 1:N                      │ N:1
   ▼                          │
  Sale ────────────────────────┘
    1:N
```

### Relationships in Plain English

| Relationship | Type | Description |
|---|---|---|
| MedicineCategory → Medicine | One-to-Many | One category (e.g. Tablets) can have many medicines |
| Medicine → StockBatch | One-to-Many | One medicine can have many stock batches with different expiry dates |
| Customer → Sale | One-to-Many | One customer can make many purchases over time |
| Sale → SaleItem | One-to-Many | One sale/bill can contain many medicine items |
| StockBatch → SaleItem | One-to-Many | One batch can appear across multiple sale items |

---

## 2. Key Structure

### Primary Keys

Every table uses a surrogate primary key — an auto-incremented integer (`INT AUTO_INCREMENT`). This ensures:
- Every row has a unique, stable identifier
- Joins are fast and simple
- No dependency on business data (like names or phone numbers) which can change

| Table | Primary Key |
|-------|------------|
| Customer | `id` |
| MedicineCategory | `id` |
| Medicine | `id` |
| StockBatch | `id` |
| Sale | `id` |
| SaleItem | `id` |

### Foreign Keys

Foreign keys enforce referential integrity — you cannot insert data that references a non-existent parent record.

| Table | Foreign Key Column | References |
|-------|--------------------|------------|
| Medicine | `category_id` | MedicineCategory(`id`) |
| StockBatch | `medicine_id` | Medicine(`id`) |
| Sale | `customer_id` | Customer(`id`) |
| SaleItem | `sale_id` | Sale(`id`) |
| SaleItem | `batch_id` | StockBatch(`id`) |

### Unique Keys

Unique constraints prevent duplicate business data:

| Table | Column | Reason |
|-------|--------|--------|
| Customer | `phone` | No two customers share the same phone number |
| MedicineCategory | `name` | Category names must be distinct |

---

## 3. Normalization

The schema is normalized up to **Third Normal Form (3NF)**.

### First Normal Form (1NF)
> Each column contains only atomic (indivisible) values. No repeating groups.

✅ Every column in every table holds a single value.
- A `Sale` does not store a list of medicines in one column — instead each item gets its own row in `SaleItem`.
- A `StockBatch` stores one batch number and one expiry date per row.

**Example of what we avoided (Un-normalized):**
```
Sale(id=1, customer="Aarav", medicines="Paracetamol x2, Cetirizine x5")  ❌
```
**What we do instead (1NF):**
```
Sale(id=1, customer_id=1)
SaleItem(sale_id=1, batch_id=3, quantity=2)
SaleItem(sale_id=1, batch_id=5, quantity=5)  ✅
```

---

### Second Normal Form (2NF)
> All non-key attributes must be fully functionally dependent on the **entire** primary key.

✅ No table has a composite primary key, so partial dependency cannot exist. Every non-key column depends entirely on its table's single `id` column.

**Example:**
- In `StockBatch`, `expiry_date` depends on `batch id` — not on `medicine_id` alone.
- In `SaleItem`, `quantity` depends on the specific `sale_item id` — not just on `sale_id` or `batch_id` alone.

---

### Third Normal Form (3NF)
> No transitive dependencies — non-key columns must not depend on other non-key columns.

✅ Category details are stored in their own table, not inside `Medicine`.

**Example of what we avoided (transitive dependency):**
```
Medicine(id, name, category_id, category_name, category_description)  ❌
```
Here `category_name` depends on `category_id`, not on `medicine id` → transitive dependency.

**What we do instead (3NF):**
```
Medicine(id, name, category_id, ...)
MedicineCategory(id, name, description)  ✅
```
Now `category_name` lives in its own table and is accessed via a JOIN.

---

## 4. Joins Used in the Project

The application uses `JOIN` queries to combine data from multiple tables for display.

### JOIN 1 — Dashboard: Recent Sales
Combines `Sale` and `Customer` to show who made each purchase.

```sql
SELECT s.id, c.name, s.sale_date, s.total_amount
FROM Sale s
JOIN Customer c ON s.customer_id = c.id
ORDER BY s.id DESC
LIMIT 5;
```
**Tables joined:** Sale ↔ Customer

---

### JOIN 2 — Medicines List
Combines `Medicine` and `MedicineCategory` to show the category name instead of just the ID.

```sql
SELECT m.id, m.name, c.name AS category, m.unit_price
FROM Medicine m
JOIN MedicineCategory c ON m.category_id = c.id;
```
**Tables joined:** Medicine ↔ MedicineCategory

---

### JOIN 3 — Stock Batches List
Combines `StockBatch` and `Medicine` to show the medicine name alongside each batch.

```sql
SELECT b.id, m.name, b.batch_number, b.expiry_date, b.quantity, b.status
FROM StockBatch b
JOIN Medicine m ON b.medicine_id = m.id;
```
**Tables joined:** StockBatch ↔ Medicine

---

### JOIN 4 — Available Stock View (3-table join)
The `available_stock_view` joins 3 tables to show all sellable batches with full context.

```sql
SELECT sb.id, m.name AS medicine_name, mc.name AS category_name,
       sb.batch_number, sb.expiry_date, sb.quantity, m.unit_price
FROM StockBatch sb
JOIN Medicine m  ON sb.medicine_id = m.id
JOIN MedicineCategory mc ON m.category_id = mc.id
WHERE sb.quantity > 0
  AND sb.expiry_date > CURDATE()
  AND sb.status = 'Available';
```
**Tables joined:** StockBatch ↔ Medicine ↔ MedicineCategory

---

### JOIN 5 — Low Stock View (with GROUP BY + HAVING)
Uses a `LEFT JOIN` and aggregation to find medicines whose total stock is at or below the reorder level.

```sql
SELECT m.id, m.name, SUM(sb.quantity) AS total_qty, m.reorder_level
FROM Medicine m
LEFT JOIN StockBatch sb ON m.id = sb.medicine_id
GROUP BY m.id
HAVING total_qty <= m.reorder_level;
```
**Tables joined:** Medicine ↔ StockBatch (LEFT JOIN to include medicines with zero stock)

---

### JOIN 6 — Sale Item Procedure (inside stored procedure)
The `create_sale_item` stored procedure fetches the unit price by joining `StockBatch` and `Medicine`.

```sql
SELECT m.unit_price, sb.quantity, sb.expiry_date
FROM StockBatch sb
JOIN Medicine m ON sb.medicine_id = m.id
WHERE sb.id = p_batch_id;
```
**Tables joined:** StockBatch ↔ Medicine

---

## 5. CRUD Operations

The application implements full Create, Read, Update, Delete operations on each table through the Flask web interface.

### Customer

| Operation | How |
|-----------|-----|
| **Create** | `GET/POST /customers/add` — Form to add a new customer |
| **Read** | `GET /customers` — Lists all customers in a table |
| **Update** | *(extendable via edit route)* |
| **Delete** | Prevented if customer has existing sales (FK constraint) |

**SQL — Create:**
```sql
INSERT INTO Customer (name, phone, city) VALUES (%s, %s, %s);
```
**SQL — Read:**
```sql
SELECT * FROM Customer;
```

---

### MedicineCategory

| Operation | How |
|-----------|-----|
| **Create** | `GET/POST /categories/add` — Form to add a category |
| **Read** | `GET /categories` — Lists all categories |
| **Update** | *(extendable)* |
| **Delete** | Prevented if medicines exist under that category (FK constraint) |

**SQL — Create:**
```sql
INSERT INTO MedicineCategory (name) VALUES (%s);
```
**SQL — Read:**
```sql
SELECT * FROM MedicineCategory;
```

---

### Medicine

| Operation | How |
|-----------|-----|
| **Create** | *(extendable via add route)* |
| **Read** | `GET /medicines` — Lists all medicines with their category name (uses JOIN) |
| **Update** | *(extendable)* |
| **Delete** | Prevented if stock batches exist for that medicine (FK constraint) |

**SQL — Read (with JOIN):**
```sql
SELECT m.id, m.name, c.name AS category, m.unit_price
FROM Medicine m
JOIN MedicineCategory c ON m.category_id = c.id;
```

---

### StockBatch

| Operation | How |
|-----------|-----|
| **Create** | *(extendable via add route)* |
| **Read** | `GET /batches` — Lists all batches with medicine name (uses JOIN) |
| **Update** | Automatically updated by `create_sale_item` stored procedure (reduces `quantity`, updates `status`) |
| **Delete** | Prevented if batch appears in any SaleItem (FK constraint) |

**SQL — Update (inside stored procedure):**
```sql
UPDATE StockBatch SET quantity = quantity - p_quantity WHERE id = p_batch_id;
UPDATE StockBatch SET status = 'Out of Stock' WHERE id = p_batch_id AND quantity = 0;
```

---

### Sale & SaleItem

| Operation | How |
|-----------|-----|
| **Create** | `GET/POST /sale` — Select customer, batch, quantity, payment mode → creates Sale + SaleItem via stored procedure |
| **Read** | `GET /` (Dashboard) — Shows recent sales with customer names (uses JOIN) |
| **Update** | Not applicable (sales are immutable records) |
| **Delete** | SaleItems cascade-delete if their parent Sale is deleted (ON DELETE CASCADE) |

**SQL — Create Sale:**
```sql
INSERT INTO Sale (customer_id, sale_date, payment_mode, total_amount)
VALUES (%s, NOW(), %s, %s);
```
**SQL — Create SaleItem (via stored procedure):**
```sql
CALL create_sale_item(sale_id, batch_id, quantity);
```

---

## 6. Referential Integrity Summary

| Action | Result |
|--------|--------|
| Delete a Customer who has Sales | ❌ Blocked by FK constraint |
| Delete a Category that has Medicines | ❌ Blocked by FK constraint |
| Delete a Medicine that has StockBatches | ❌ Blocked by FK constraint |
| Delete a Batch that appears in SaleItems | ❌ Blocked by FK constraint |
| Delete a Sale | ✅ Allowed — SaleItems are cascade-deleted automatically |
| Insert a SaleItem for an expired batch | ❌ Blocked by `prevent_expired_batch_sale` trigger |
| Update StockBatch quantity to negative | ❌ Blocked by `prevent_negative_stock` trigger |
| Insert a SaleItem for quantity > available stock | ❌ Blocked by `prevent_over_selling` trigger |
