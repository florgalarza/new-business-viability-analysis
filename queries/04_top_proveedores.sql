-- 4) Top proveedores por categoria
-- Identificar los proveedores con mejor desempeño (mas ordenes + mejor precio)
SELECT 
  p.product_category_name,
  oi.seller_id,
  s.seller_city,
  s.seller_state,
  COUNT(DISTINCT oi.order_id) as total_ordenes,
  ROUND(AVG(oi.price), 2) as precio_promedio,
  ROUND(AVG(oi.freight_value), 2) as costo_envio_promedio,
  ROUND(AVG(oi.price) + AVG(oi.freight_value), 2) as costo_total_promedio
FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
LEFT JOIN olist_sellers_dataset s ON oi.seller_id = s.seller_id
GROUP BY p.product_category_name, oi.seller_id, s.seller_city, s.seller_state
HAVING COUNT(DISTINCT oi.order_id) > 20
ORDER BY p.product_category_name, total_ordenes DESC;