-- 7) DISTRIBUCION DE DEMANDA POR ESTADO DEL CLIENTE
-- Entender donde están los clientes (cobertura geografica real)
-- Mira estado del CLIENTE (dónde compra), no del vendedor

SELECT 
  c.customer_state,
  COUNT(DISTINCT o.order_id) as total_ordenes,
  ROUND(AVG(oi.price), 2) as precio_promedio,
  ROUND(AVG(oi.freight_value), 2) as costo_logistica_promedio,
  ROUND(AVG(oi.price) - AVG(oi.freight_value), 2) as margen_promedio,
  ROUND(((AVG(oi.price) - AVG(oi.freight_value)) / AVG(oi.price)) * 100, 2) as margen_pct,
  ROUND(AVG(CAST(JULIANDAY(o.order_delivered_customer_date) - JULIANDAY(o.order_approved_at) AS FLOAT)), 1) as dias_entrega_promedio
FROM olist_orders_dataset o
LEFT JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
LEFT JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY total_ordenes DESC;