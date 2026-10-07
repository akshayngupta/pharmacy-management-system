import os
from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
from dotenv import load_dotenv

load_dotenv()
app = Flask(__name__)

def get_db():
    return mysql.connector.connect(
        host=os.getenv('DB_HOST', 'localhost'),
        user=os.getenv('DB_USER', 'root'),
        password=os.getenv('DB_PASSWORD', ''),
        database=os.getenv('DB_NAME', 'pharmacy_db')
    )

@app.route('/')
def index():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT COUNT(*) as c FROM Medicine")
    total_meds = cursor.fetchone()['c']
    cursor.execute("SELECT COUNT(*) as c FROM Customer")
    total_custs = cursor.fetchone()['c']
    cursor.execute("SELECT SUM(total_amount) as t FROM Sale WHERE DATE(sale_date) = CURDATE()")
    total_sales = cursor.fetchone()['t']
    cursor.execute("SELECT COUNT(*) as c FROM low_stock_view")
    low_stock = cursor.fetchone()['c']
    
    cursor.execute("""
        SELECT s.id, c.name, s.sale_date, s.total_amount 
        FROM Sale s JOIN Customer c ON s.customer_id = c.id 
        ORDER BY s.id DESC LIMIT 5
    """)
    sales = cursor.fetchall()
    conn.close()
    
    stats = {
        'total_medicines': total_meds,
        'total_customers': total_custs,
        'total_sales': total_sales,
        'low_stock': low_stock
    }
    return render_template('index.html', stats=stats, sales=sales)

@app.route('/customers', methods=['GET'])
def customers():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Customer")
    items = cursor.fetchall()
    conn.close()
    return render_template('list.html', title='Customers', items=items, 
                           columns=['ID', 'Name', 'Phone', 'City'], 
                           item_keys=['id', 'name', 'phone', 'city'],
                           add_url='/customers/add')

@app.route('/customers/add', methods=['GET', 'POST'])
def add_customer():
    if request.method == 'POST':
        conn = get_db()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO Customer (name, phone, city) VALUES (%s, %s, %s)", 
                       (request.form['name'], request.form['phone'], request.form['city']))
        conn.commit()
        conn.close()
        return redirect('/customers')
    fields = [
        {'name': 'name', 'label': 'Name', 'type': 'text'},
        {'name': 'phone', 'label': 'Phone', 'type': 'text'},
        {'name': 'city', 'label': 'City', 'type': 'text'}
    ]
    return render_template('form.html', title='Add Customer', fields=fields)

@app.route('/categories')
def categories():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM MedicineCategory")
    items = cursor.fetchall()
    conn.close()
    return render_template('list.html', title='Categories', items=items, columns=['ID', 'Name'], item_keys=['id', 'name'], add_url='/categories/add')

@app.route('/categories/add', methods=['GET', 'POST'])
def add_category():
    if request.method == 'POST':
        conn = get_db()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO MedicineCategory (name) VALUES (%s)", (request.form['name'],))
        conn.commit()
        conn.close()
        return redirect('/categories')
    fields = [{'name': 'name', 'label': 'Category Name', 'type': 'text'}]
    return render_template('form.html', title='Add Category', fields=fields)

@app.route('/medicines')
def medicines():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT m.id, m.name, c.name as cat, m.unit_price FROM Medicine m JOIN MedicineCategory c ON m.category_id = c.id")
    items = cursor.fetchall()
    conn.close()
    return render_template('list.html', title='Medicines', items=items, columns=['ID', 'Name', 'Category', 'Price'], item_keys=['id', 'name', 'cat', 'unit_price'], add_url=None)

@app.route('/batches')
def batches():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT b.id, m.name, b.batch_number, b.expiry_date, b.quantity, b.status FROM StockBatch b JOIN Medicine m ON b.medicine_id = m.id")
    items = cursor.fetchall()
    conn.close()
    return render_template('list.html', title='Stock Batches', items=items, columns=['ID', 'Medicine', 'Batch No', 'Expiry', 'Qty', 'Status'], item_keys=['id', 'name', 'batch_number', 'expiry_date', 'quantity', 'status'], add_url=None)

@app.route('/sale', methods=['GET', 'POST'])
def sale():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    if request.method == 'POST':
        c_id = request.form['customer_id']
        b_id = request.form['batch_id']
        qty = int(request.form['quantity'])
        pmode = request.form['payment_mode']
        
        cursor.execute("SELECT unit_price FROM Medicine m JOIN StockBatch b ON m.id = b.medicine_id WHERE b.id = %s", (b_id,))
        price = cursor.fetchone()['unit_price']
        total = price * qty
        
        cursor.execute("INSERT INTO Sale (customer_id, sale_date, payment_mode, total_amount) VALUES (%s, NOW(), %s, %s)", (c_id, pmode, total))
        sale_id = cursor.lastrowid
        
        cursor.callproc('create_sale_item', (sale_id, b_id, qty))
        conn.commit()
        conn.close()
        return redirect('/')
        
    cursor.execute("SELECT id, name, phone FROM Customer")
    customers = cursor.fetchall()
    cursor.execute("SELECT b.id as batch_id, m.name, b.batch_number, b.quantity FROM available_stock_view b JOIN Medicine m ON b.medicine_id = m.id")
    batches = cursor.fetchall()
    conn.close()
    return render_template('sale_form.html', customers=customers, batches=batches)

@app.route('/reports')
def reports():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM low_stock_view")
    low_stock = cursor.fetchall()
    cursor.execute("SELECT * FROM available_stock_view")
    available_stock = cursor.fetchall()
    conn.close()
    return render_template('reports.html', low_stock=low_stock, available_stock=available_stock)

if __name__ == '__main__':
    app.run(debug=True)
