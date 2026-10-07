# Pharmanage

A simple web-based **Pharmacy Management System** for a single pharmacy, built as a DBMS lab project.

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Backend | Python (Flask) |
| Database | MySQL 8.0 |
| Frontend | HTML, CSS, Jinja2 Templates |
| DB Connector | `mysql-connector-python` |
| Config | `python-dotenv` |

---

## Project Structure

```
pharmacy-management-system/
├── app.py               # Main Flask application
├── schema.sql           # Database schema (tables, keys, constraints)
├── data.sql             # Sample test data (50 entries per table)
├── advanced.sql         # Views, Triggers, Stored Procedure, Indexes
├── sample-data.md       # Human-readable version of data.sql
├── normalization.md     # Database normalization explanation (1NF, 2NF, 3NF)
├── requirements.txt     # Python dependencies
├── .env.example         # Environment variable template
├── .gitignore
├── templates/
│   ├── base.html        # Base layout with navigation
│   ├── index.html       # Dashboard
│   ├── list.html        # Reusable list/table page
│   ├── form.html        # Reusable form page
│   ├── sale_form.html   # New sale / billing page
│   └── reports.html     # Reports page
└── static/
    └── style.css        # Application styling
```

---

## Database Tables

| Table | Description |
|-------|-------------|
| `Customer` | Stores customer details |
| `MedicineCategory` | Stores medicine categories (Tablets, Syrups, etc.) |
| `Medicine` | Master data for all medicines |
| `StockBatch` | Tracks stock by batch number and expiry date |
| `Sale` | Bill/sale header records |
| `SaleItem` | Individual medicine items within each sale |

---

## Advanced SQL Features (`advanced.sql`)

| Feature | Name | Purpose |
|---------|------|---------|
| View | `available_stock_view` | Shows only non-expired, in-stock batches |
| View | `low_stock_view` | Shows medicines below reorder level |
| Trigger | `prevent_expired_batch_sale` | Blocks selling expired stock |
| Trigger | `prevent_negative_stock` | Blocks stock going below zero |
| Stored Procedure | `create_sale_item` | Safely inserts sale items and reduces stock |
| Indexes | Multiple | Speeds up searches on phone, name, date, etc. |

---

## Setup & How to Run

### Prerequisites
- Python 3.x (added to system PATH)
- MySQL 8.0 (added to system PATH or use full path)

### Step 1 — Create the Database

Open MySQL and run:
```sql
CREATE DATABASE pharmacy_db;
```

### Step 2 — Import SQL Files (run in this order)

Open PowerShell inside the `pharmacy-management-system` folder and run:

```powershell
cmd /c '"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p pharmacy_db < schema.sql'
```
```powershell
cmd /c '"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p pharmacy_db < advanced.sql'
```

> ⚠️ Always run `schema.sql` before `data.sql` and `advanced.sql` before `data.sql`.

### Step 3 — Load Sample Data (optional but recommended)

```powershell
cmd /c '"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u root -p pharmacy_db < data.sql'
```

On success you will see:
```
Test data loaded successfully! 50 entries across all tables.
```

### Step 4 — Configure Environment

Copy `.env.example` to `.env` and update with your MySQL credentials:
```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password_here
DB_NAME=pharmacy_db
```

### Step 5 — Install Python Dependencies

```powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
```

> 💡 If `.venv\Scripts\Activate.ps1` is blocked by Windows execution policy, use the full path to the venv Python directly as shown above.

### Step 6 — Run the Application

```powershell
.\.venv\Scripts\python.exe app.py
```

### Step 7 — Open in Browser

```
http://127.0.0.1:5000
```

---

## Sample Data (`data.sql` & `sample-data.md`)

The project includes a comprehensive sample dataset for testing all features.

### What's included

| Table | Records | Notes |
|-------|---------|-------|
| Customer | 50 | Indian names across 30+ cities |
| MedicineCategory | 6 | Tablets, Syrups, Injections, Ointments, Drops, Others |
| Medicine | 50 | Real Indian medicine names across all 6 categories |
| StockBatch | 50 | Mix of Available, Expired, Out of Stock, Near-Expiry batches |
| Sale | 50 | Spread across September–October 2026, all 4 payment modes |
| SaleItem | 60+ | Inserted via the `create_sale_item` stored procedure |

### How to use it

1. Run `data.sql` **after** `schema.sql` and `advanced.sql` as shown in Step 2–3 above.
2. To **reset** the data and reload fresh, simply run `data.sql` again — it truncates all tables first before inserting.
3. To **view the data** without opening MySQL, open `sample-data.md` in any Markdown viewer or VS Code. It shows all 50 entries per table in clean readable tables with status icons.

### DBMS features covered by the sample data

| Feature | How it's demonstrated |
|---------|----------------------|
| Triggers | Expired batches (IDs 44–46) and out-of-stock batches (47–48) exist to test blocked inserts |
| Views | `available_stock_view` excludes expired/out-of-stock; `low_stock_view` flags near-expiry items |
| Stored Procedure | All SaleItems are created via `create_sale_item()` which auto-reduces stock quantities |
| Foreign Keys | Cascading relationships across all 6 tables |
| Indexes | Applied on phone, medicine name, expiry date, sale date |

---

## Pages

| URL | Description |
|-----|-------------|
| `/` | Dashboard with stats and recent sales |
| `/customers` | List all customers |
| `/customers/add` | Add a new customer |
| `/categories` | List all medicine categories |
| `/categories/add` | Add a new category |
| `/medicines` | List all medicines |
| `/batches` | List all stock batches |
| `/sale` | Create a new sale (billing) |
| `/reports` | View low stock and available stock reports |

---

## Scope

This project intentionally excludes: multiple branches, supplier management, employee login, GST billing, barcode scanning, prescription uploads, and warehouse management.
