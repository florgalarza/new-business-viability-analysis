-- 1) Exploracion basica del mercado
SELECT 
  (SELECT COUNT(DISTINCT seller_id) FROM olist_sellers_dataset) as total_proveedores,
  (SELECT COUNT(DISTINCT seller_state) FROM olist_sellers_dataset) as total_estados,
  (SELECT COUNT(DISTINCT product_category_name) FROM olist_products_dataset) as total_categorias,
  (SELECT COUNT(DISTINCT order_id) FROM olist_order_items_dataset) as total_items_ordenes;
