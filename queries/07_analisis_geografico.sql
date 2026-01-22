-- 7) Analisis operativo por Estado
-- Evaluar margen y velocidad de entrega por región geográfica
SELECT 
  s.seller_state,
  COUNT(DISTINCT s.seller_id) as proveedores,
  COUNT(DISTINCT oi.order_id) as ordenes,
  ROUND(AVG(oi.price) - AVG(oi.freight_value), 2) as margen_promedio,
  ROUND(((AVG(oi.price) - AVG(oi.freight_value)) / AVG(oi.price)) * 100, 2) as margen_pct,
  ROUND(AVG(CAST(JULIANDAY(o.order_delivered_customer_date) - JULIANDAY(o.order_approved_at) AS FLOAT)), 1) as dias_entrega_promedio
FROM olist_sellers_dataset s
LEFT JOIN olist_order_items_dataset oi ON s.seller_id = oi.seller_id
LEFT JOIN olist_orders_dataset o ON oi.order_id = o.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY s.seller_state
ORDER BY margen_pct DESC;