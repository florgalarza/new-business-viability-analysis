-- 6) VELOCIDAD DE ENTREGA POR CATEGORÍA
-- Propósito: Analizar barrera operativa (velocidad de entrega por categoría)
-- Nota: Cada categoría tiene estándar implícito; incumplirlo = fuera de competencia

SELECT 
  p.product_category_name,
  COUNT(DISTINCT o.order_id) as total_ordenes,
  ROUND(AVG(CAST(
    JULIANDAY(o.order_delivered_customer_date) - 
    JULIANDAY(o.order_approved_at) 
  AS FLOAT)), 1) as dias_promedio_entrega,
  ROUND(MIN(CAST(
    JULIANDAY(o.order_delivered_customer_date) - 
    JULIANDAY(o.order_approved_at) 
  AS FLOAT)), 1) as dias_minimo,
  ROUND(MAX(CAST(
    JULIANDAY(o.order_delivered_customer_date) - 
    JULIANDAY(o.order_approved_at) 
  AS FLOAT)), 1) as dias_maximo
FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
LEFT JOIN olist_orders_dataset o ON oi.order_id = o.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY p.product_category_name
ORDER BY dias_promedio_entrega ASC;