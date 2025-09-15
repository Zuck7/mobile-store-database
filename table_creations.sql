-- 1. PRODUCT_BRANDS
CREATE TABLE MOBI_PRODUCT_BRANDS (
   brand_id NUMBER PRIMARY KEY,
   brand_name VARCHAR2(100),
   country VARCHAR2(100),
   description VARCHAR2(500)
);

-- 2. PRODUCTION_CATEGORIES
CREATE TABLE MOBI_PRODUCTION_CATEGORIES (
   category_id NUMBER PRIMARY KEY,
   category_name VARCHAR2(100),
   description VARCHAR2(500)
);

-- 3. PRODUCT_AVAILABLE
CREATE TABLE MOBI_PRODUCT_AVAILABLE (
   product_id NUMBER PRIMARY KEY,
   brand_id NUMBER,
   category_id NUMBER,
   product_name VARCHAR2(100),
   model_number VARCHAR2(50),
   description VARCHAR2(1000),
   price NUMBER,
   stock_quantity NUMBER,
   is_active NUMBER,
   created_at DATE,
   CONSTRAINT fk_brand_id FOREIGN KEY (brand_id) REFERENCES MOBI_PRODUCT_BRANDS(brand_id),
   CONSTRAINT fk_category_id FOREIGN KEY (category_id) REFERENCES MOBI_PRODUCTION_CATEGORIES(category_id)
);

-- 4. SALES_CUSTOMERS
CREATE TABLE MOBI_SALES_CUSTOMERS (
   customer_id NUMBER PRIMARY KEY,
   full_name VARCHAR2(100),
   email VARCHAR2(100),
   phone VARCHAR2(20),
   address VARCHAR2(255),
   city VARCHAR2(50),
   postal_code VARCHAR2(20),
   country VARCHAR2(50),
   created_at DATE
);

-- 5. SALES_STORES
CREATE TABLE MOBI_SALES_STORES (
   store_id NUMBER PRIMARY KEY,
   store_name VARCHAR2(100),
   location VARCHAR2(100),
   address VARCHAR2(255),
   phone VARCHAR2(20),
   email VARCHAR2(100),
   created_at DATE
);

-- 6. STORE_STAFF
CREATE TABLE MOBI_STORE_STAFF (
   staff_id NUMBER PRIMARY KEY,
   store_id NUMBER,
   full_name VARCHAR2(100),
   email VARCHAR2(100),
   phone VARCHAR2(20),
   role VARCHAR2(30),
   hire_date DATE,
   CONSTRAINT fk_staff_store FOREIGN KEY (store_id) REFERENCES MOBI_SALES_STORES(store_id)
);

-- 7. SALES_ORDERS
CREATE TABLE MOBI_SALES_ORDERS (
   order_id NUMBER PRIMARY KEY,
   customer_id NUMBER,
   store_id NUMBER,
   order_date DATE,
   total_amount NUMBER,
   status VARCHAR2(20),
   CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES MOBI_SALES_CUSTOMERS(customer_id),
   CONSTRAINT fk_order_store FOREIGN KEY (store_id) REFERENCES MOBI_SALES_STORES(store_id)
);

-- 8. SALES_ORDER_ITEMS
CREATE TABLE MOBI_SALES_ORDER_ITEMS (
   order_item_id NUMBER PRIMARY KEY,
   order_id NUMBER,
   product_id NUMBER,
   quantity NUMBER,
   unit_price NUMBER,
   CONSTRAINT fk_order_item_order FOREIGN KEY (order_id) REFERENCES MOBI_SALES_ORDERS(order_id),
   CONSTRAINT fk_order_item_product FOREIGN KEY (product_id) REFERENCES MOBI_PRODUCT_AVAILABLE(product_id)
);