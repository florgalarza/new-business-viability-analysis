-- 3) MAPEO COMPETENCIA VS DEMANDA
-- Propósito: Visualizar relación entre saturación y volumen de órdenes
-- Nota: Es exploración visual, no recomendación final (eso es Query 8)

SELECT 
  p.product_category_name,
  COUNT(DISTINCT oi.seller_id) as cantidad_proveedores,
  COUNT(DISTINCT oi.order_id) as total_ordenes,
  ROUND(AVG(oi.price), 2) as precio_promedio,
  ROUND(COUNT(DISTINCT oi.order_id) * 1.0 / COUNT(DISTINCT oi.seller_id), 2) as ordenes_por_proveedor,
  CASE 
    WHEN COUNT(DISTINCT oi.seller_id) < 150 THEN 'Baja fragmentación'
    WHEN COUNT(DISTINCT oi.seller_id) < 300 THEN 'Fragmentación moderada'
    ELSE 'Alta fragmentación'
  END as nivel_fragmentacion,
  CASE 
    WHEN COUNT(DISTINCT oi.order_id) > 5000 THEN 'Demanda alta'
    WHEN COUNT(DISTINCT oi.order_id) > 2000 THEN 'Demanda moderada'
    ELSE 'Demanda baja'
  END as nivel_demanda
FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
GROUP BY p.product_category_name
HAVING COUNT(DISTINCT oi.seller_id) > 50
ORDER BY ordenes_por_proveedor DESC;