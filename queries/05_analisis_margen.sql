-- 5) Analisis de margen por categoria
-- Calcular margen de ganancia (precio - costo logística = margen neto)

SELECT 
  p.product_category_name,
  COUNT(DISTINCT oi.order_id) as total_ordenes,
  ROUND(AVG(oi.price), 2) as precio_promedio,
  ROUND(AVG(oi.freight_value), 2) as costo_logistica_promedio,
  ROUND(AVG(oi.price) - AVG(oi.freight_value), 2) as margen_neto,
  ROUND(((AVG(oi.price) - AVG(oi.freight_value)) / AVG(oi.price)) * 100, 2) as margen_porcentaje
FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY margen_porcentaje DESC;