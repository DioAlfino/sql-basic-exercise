INSERT INTO public.customers
(customers_id, "name", address)
VALUES
(nextval('customers_customers_id_seq'::regclass), 'Customer A', 'Address A'),
(nextval('customers_customers_id_seq'::regclass), 'Customer B', 'Address B'),
(nextval('customers_customers_id_seq'::regclass), 'Customer C', 'Address C');

INSERT INTO public.products
(products_id, "name", price)
VALUES
(nextval('products_products_id_seq'::regclass), 'Product A', 10.00),
(nextval('products_products_id_seq'::regclass), 'Product B', 20.00),
(nextval('products_products_id_seq'::regclass), 'Product C', 30.00);

INSERT INTO public.promo
(promo_id, promo_name, created_at, updated_at, deleted_at)
VALUES
(nextval('promo_promo_id_seq'::regclass), 'Promo A', '2023-01-01', '2023-01-01', NULL),
(nextval('promo_promo_id_seq'::regclass), 'Promo B', '2023-01-02', '2023-01-02', NULL),
(nextval('promo_promo_id_seq'::regclass), 'Promo C', '2023-01-03', '2023-01-03', NULL);

INSERT INTO public.sellers
(sellers_id, "name")
VALUES
(nextval('sellers_sellers_id_seq'::regclass), 'Seller A'),
(nextval('sellers_sellers_id_seq'::regclass), 'Seller B'),
(nextval('sellers_sellers_id_seq'::regclass), 'Seller C');

INSERT INTO public.shippers
(shipper_id, shipper_provider, insurance, created_at, updated_at, deleted_at)
VALUES
(nextval('shippers_shipper_id_seq'::regclass), 'Shipper A', 10.00, '2023-01-01', '2023-01-01', NULL),
(nextval('shippers_shipper_id_seq'::regclass), 'Shipper B', 20.00, '2023-01-02', '2023-01-02', NULL),
(nextval('shippers_shipper_id_seq'::regclass), 'Shipper C', 30.00, '2023-01-03', '2023-01-03', NULL);

INSERT INTO public.orders
(order_id, order_date, customers_id, seller_id)
VALUES
(nextval('orders_order_id_seq'::regclass), '2023-01-01', 1, 1),
(nextval('orders_order_id_seq'::regclass), '2023-01-02', 2, 2),
(nextval('orders_order_id_seq'::regclass), '2023-01-03', 3, 3);

INSERT INTO public.orderitems
(order_item_id, quantity, weight_item, order_id, product_id, promo_id, shipper_id)
VALUES
(nextval('orderitems_order_item_id_seq'::regclass), 1, 1.0, 1, 1, 1, 1),
(nextval('orderitems_order_item_id_seq'::regclass), 2, 2.0, 2, 2, 2, 2),
(nextval('orderitems_order_item_id_seq'::regclass), 3, 3.0, 3, 3, 3, 3);

INSERT INTO public.invoices
(invoices_id, invoice_date, total_amount, order_item_id)
VALUES
(nextval('invoices_invoices_id_seq'::regclass), '2023-01-01', 100.00, 1),
(nextval('invoices_invoices_id_seq'::regclass), '2023-01-02', 200.00, 2),
(nextval('invoices_invoices_id_seq'::regclass), '2023-01-03', 300.00, 3);

INSERT INTO public.payments
(payment_id, payment_date, payment_method, invoices_id)
VALUES
(nextval('payments_payment_id_seq'::regclass), '2023-01-01', 'Credit Card', 1),
(nextval('payments_payment_id_seq'::regclass), '2023-01-02', 'PayPal', 2),
(nextval('payments_payment_id_seq'::regclass), '2023-01-03', 'Bank Transfer', 3);
