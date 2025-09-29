---OLIST TABLES 

CREATE TABLE IF NOT EXISTS olist_customers (
  customer_id               TEXT PRIMARY KEY,
  customer_unique_id        TEXT,
  customer_zip_code_prefix  INTEGER,
  customer_city             TEXT,
  customer_state            TEXT
);

CREATE TABLE IF NOT EXISTS olist_sellers (
  seller_id                 TEXT PRIMARY KEY,
  seller_zip_code_prefix    INTEGER,
  seller_city               TEXT,
  seller_state              TEXT
);

CREATE TABLE IF NOT EXISTS olist_products (
  product_id                   TEXT PRIMARY KEY,
  product_category_name        TEXT,
  product_name_length          INTEGER,
  product_description_length   INTEGER,
  product_photos_qty           INTEGER,
  product_weight_g             INTEGER,
  product_length_cm            INTEGER,
  product_height_cm            INTEGER,
  product_width_cm             INTEGER
);

CREATE TABLE IF NOT EXISTS olist_orders (
  order_id                        TEXT PRIMARY KEY,
  customer_id                     TEXT NOT NULL,
  order_status                    TEXT,
  order_purchase_timestamp        TIMESTAMP,
  order_approved_at               TIMESTAMP,
  order_delivered_carrier_date    TIMESTAMP,
  order_delivered_customer_date   TIMESTAMP,
  order_estimated_delivery_date   TIMESTAMP
);

CREATE TABLE IF NOT EXISTS olist_order_items (
  order_id            TEXT NOT NULL,
  order_item_id       INTEGER NOT NULL,
  product_id          TEXT,
  seller_id           TEXT,
  shipping_limit_date TIMESTAMP,
  price               NUMERIC(12,2),
  freight_value       NUMERIC(12,2),
  PRIMARY KEY (order_id, order_item_id)
);

CREATE TABLE IF NOT EXISTS olist_order_payments (
  order_id              TEXT NOT NULL,
  payment_sequential    INTEGER NOT NULL,
  payment_type          TEXT,
  payment_installments  INTEGER,
  payment_value         NUMERIC(12,2),
  PRIMARY KEY (order_id, payment_sequential)
);

CREATE TABLE IF NOT EXISTS olist_order_reviews (
  review_id                TEXT,
  order_id                 TEXT,
  review_score             INTEGER,
  review_comment_title     TEXT,
  review_comment_message   TEXT,
  review_creation_date     TIMESTAMP,
  review_answer_timestamp  TIMESTAMP
); 

CREATE TABLE IF NOT EXISTS olist_geolocation (
  geolocation_zip_code_prefix  INTEGER,
  geolocation_lat              NUMERIC(9,6),
  geolocation_lng              NUMERIC(9,6),
  geolocation_city             TEXT,
  geolocation_state            TEXT
);

CREATE TABLE IF NOT EXISTS product_category_name_translation (
  product_category_name          TEXT PRIMARY KEY,
  product_category_name_english  TEXT);


