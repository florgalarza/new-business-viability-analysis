-- 2) Analisis de proveedores por categoria
-- Identificar cuales categorías tienen más proveedores y cual es su calidad promedio
SELECT 
  p.product_category_name,
  COUNT(DISTINCT oi.seller_id) as cantidad_proveedores,
  COUNT(DISTINCT oi.order_id) as total_ordenes,
  ROUND(AVG(oi.price), 2) as precio_promedio,
  ROUND(AVG(oi.freight_value), 2) as costo_logistica_promedio
FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY cantidad_proveedores DESC;