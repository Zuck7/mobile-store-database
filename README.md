# mobile-store-database
Mobile Store Database
This repository contains SQL scripts for creating and populating a relational database designed to manage data for a mobile store. The database includes tables for products, customers, stores, staff, sales orders, and order items. The two main files in this repository are:

table_creations.sql: Defines the schema for the database tables.
store_data.sql: Populates the database with sample data.
File Descriptions
1. table_creations.sql
This file contains the SQL statements to create the database schema. It defines the structure of the tables, their columns, data types, and relationships between tables using foreign keys. Below is a summary of the tables created in this file:

Tables:
MOBI_PRODUCT_BRANDS

Stores information about product brands.
Columns: brand_id, brand_name, country, description.
MOBI_PRODUCTION_CATEGORIES

Stores information about product categories.
Columns: category_id, category_name, description.
MOBI_PRODUCT_AVAILABLE

Stores information about available products.
Columns: product_id, brand_id, category_id, product_name, model_number, description, price, stock_quantity, is_active, created_at.
Foreign Keys:
brand_id → MOBI_PRODUCT_BRANDS(brand_id)
category_id → MOBI_PRODUCTION_CATEGORIES(category_id)
MOBI_SALES_CUSTOMERS

Stores information about customers.
Columns: customer_id, full_name, email, phone, address, city, postal_code, country, created_at.
MOBI_SALES_STORES

Stores information about stores.
Columns: store_id, store_name, location, address, phone, email, created_at.
MOBI_STORE_STAFF

Stores information about store staff.
Columns: staff_id, store_id, full_name, email, phone, role, hire_date.
Foreign Key:
store_id → MOBI_SALES_STORES(store_id)
MOBI_SALES_ORDERS

Stores information about sales orders.
Columns: order_id, customer_id, store_id, order_date, total_amount, status.
Foreign Keys:
customer_id → MOBI_SALES_CUSTOMERS(customer_id)
store_id → MOBI_SALES_STORES(store_id)
MOBI_SALES_ORDER_ITEMS

Stores information about items in sales orders.
Columns: order_item_id, order_id, product_id, quantity, unit_price.
Foreign Keys:
order_id → MOBI_SALES_ORDERS(order_id)
product_id → MOBI_PRODUCT_AVAILABLE(product_id)
2. store_data.sql
This file contains SQL INSERT statements to populate the database with sample data. It provides realistic data for testing and demonstration purposes. Below is a summary of the data inserted into each table:

Data Populated:
MOBI_PRODUCT_BRANDS

Contains 10 entries for popular mobile brands like Samsung, Apple, Xiaomi, etc.
MOBI_PRODUCTION_CATEGORIES

Contains 8 entries for product categories such as Smartphones, Tablets, Smartwatches, etc.
MOBI_PRODUCT_AVAILABLE

Contains multiple entries for products, including details like brand, category, price, stock quantity, and creation date.
MOBI_SALES_CUSTOMERS

Contains customer data, including names, contact details, and addresses.
MOBI_SALES_STORES

Contains store data, including store names, locations, and contact details.
MOBI_STORE_STAFF

Contains staff data, including roles, hire dates, and store assignments.
MOBI_SALES_ORDERS

Contains sales order data, including customer, store, order date, total amount, and status.
MOBI_SALES_ORDER_ITEMS

Contains details of items in each sales order, including product, quantity, and unit price.
How to Use
Create the Database Schema
Run the SQL statements in table_creations.sql to create the database tables.

Insert Sample Data
Run the SQL statements in store_data.sql to populate the tables with sample data.

Query the Database
Use SQL queries to explore the data, test relationships, and perform operations like filtering, joining, and aggregating.

Example Queries
Here are some example queries you can run on the database:

List all products with their brand and category:

Find all orders placed by a specific customer:

Get total sales per store:

License
This project is licensed under the MIT License.

