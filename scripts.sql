
CREATE TABLE public.customers (
	customers_id serial4 NOT NULL,
	"name" varchar(100) NOT NULL,
	address text NULL,
	CONSTRAINT customers_pkey PRIMARY KEY (customers_id)
);


CREATE TABLE invoices (
	invoices_id serial4 NOT NULL,
	invoice_date date NOT NULL,
	total_amount numeric(12, 2) NOT NULL,
	order_item_id int4 NULL,
	CONSTRAINT invoices_pkey PRIMARY KEY (invoices_id),
	CONSTRAINT invoices_order_item_id_fkey FOREIGN KEY (order_item_id) REFERENCES orderitems(order_item_id)
);


CREATE TABLE orderitems (
	order_item_id serial4 NOT NULL,
	quantity int4 NOT NULL,
	weight_item int4 NOT NULL,
	order_id int4 NULL,
	product_id int4 NULL,
	promo_id int4 NULL,
	shipper_id int4 NULL,
	CONSTRAINT orderitems_pkey PRIMARY KEY (order_item_id),
	CONSTRAINT fk_promo FOREIGN KEY (promo_id) REFERENCES promo(promo_id),
	CONSTRAINT fl_shipper FOREIGN KEY (shipper_id) REFERENCES shippers(shipper_id),
	CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(order_id),
	CONSTRAINT orderitems_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(products_id)
);

CREATE TABLE orders (
	order_id serial4 NOT NULL,
	order_date date NOT NULL,
	customers_id int4 NULL,
	seller_id int4 NULL,
	CONSTRAINT orders_pkey PRIMARY KEY (order_id),
	CONSTRAINT fk_seller FOREIGN KEY (seller_id) REFERENCES sellers(sellers_id),
	CONSTRAINT orders_customers_id_fkey FOREIGN KEY (customers_id) REFERENCES customers(customers_id)
);


CREATE TABLE payments (
	payment_id serial4 NOT NULL,
	payment_date date NOT NULL,
	payment_method varchar(100) NULL,
	invoices_id int4 NULL,
	CONSTRAINT payments_pkey PRIMARY KEY (payment_id),
	CONSTRAINT payments_invoices_id_fkey FOREIGN KEY (invoices_id) REFERENCES invoices(invoices_id)
);

CREATE TABLE products (
	products_id serial4 NOT NULL,
	"name" varchar(100) NOT NULL,
	price numeric(10, 2) NOT NULL,
	CONSTRAINT products_pkey PRIMARY KEY (products_id)
);


CREATE TABLE promo (
	promo_id serial4 NOT NULL,
	promo_name varchar(100) NOT NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	deleted_at timestamp NULL,
	CONSTRAINT promo_pkey PRIMARY KEY (promo_id)
);


CREATE TABLE sellers (
	sellers_id serial4 NOT NULL,
	"name" varchar(100) NOT NULL,
	CONSTRAINT sellers_pkey PRIMARY KEY (sellers_id)
);


CREATE TABLE shippers (
	shipper_id serial4 NOT NULL,
	shipper_provider varchar(100) NOT NULL,
	insurance numeric(10, 2) NOT NULL,
	created_at timestamp NULL,
	updated_at timestamp NULL,
	deleted_at timestamp NULL,
	CONSTRAINT shippers_pkey PRIMARY KEY (shipper_id)
);