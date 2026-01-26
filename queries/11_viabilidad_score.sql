-- 11) SCORE DE VIABILIDAD COMPLETO
-- Propósito: Integrar todas las dimensiones en una métrica única
-- Responde: ¿En qué categorías debería entrar? (respuesta final)

WITH analisis_base AS (
  SELECT 
    p.product_category_name,
    COUNT(DISTINCT oi.seller_id) as cantidad_proveedores,
    COUNT(DISTINCT oi.order_id) as total_ordenes,
    ROUND(AVG(oi.price) - AVG(oi.freight_value), 2) as margen_neto,
    ROUND(((AVG(oi.price) - AVG(oi.freight_value)) / AVG(oi.price)) * 100, 2) as margen_pct,
    ROUND(AVG(CAST(JULIANDAY(o.order_delivered_customer_date) - JULIANDAY(o.order_approved_at) AS FLOAT)), 1) as dias_entrega
  FROM olist_products_dataset p
  LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
  LEFT JOIN olist_orders_dataset o ON oi.order_id = o.order_id
  WHERE o.order_delivered_customer_date IS NOT NULL
  GROUP BY p.product_category_name
)
SELECT 
  product_category_name,
  cantidad_proveedores,
  total_ordenes,
  margen_pct,
  dias_entrega,
  ROUND(
    CASE WHEN cantidad_proveedores < 100 THEN 100
         WHEN cantidad_proveedores < 200 THEN 80
         WHEN cantidad_proveedores < 400 THEN 60
         ELSE 40 END *
    CASE WHEN total_ordenes > 5000 THEN 1.3
         WHEN total_ordenes > 3000 THEN 1.1
         ELSE 1.0 END *
    CASE WHEN margen_pct > 90 THEN 1.2
         WHEN margen_pct > 80 THEN 1.1
         ELSE 1.0 END *
    CASE WHEN dias_entrega < 10 THEN 1.1
         WHEN dias_entrega < 20 THEN 1.0
         ELSE 0.9 END, 0) as viabilidad_score_final
FROM analisis_base
ORDER BY viabilidad_score_final DESC;