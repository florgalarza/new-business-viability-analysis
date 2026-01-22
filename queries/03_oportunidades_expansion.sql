-- 3) Oportunidades de expansion
-- Identificar categorias con BAJA competencia(pocos proveedores) pero ALTA demanda
SELECT 
  p.product_category_name,
  COUNT(DISTINCT oi.seller_id) as cantidad_proveedores,
  COUNT(DISTINCT oi.order_id) as total_ordenes,
  ROUND(AVG(oi.price), 2) as precio_promedio,
  ROUND(COUNT(DISTINCT oi.order_id) * 1.0 / COUNT(DISTINCT oi.seller_id), 2) as ordenes_por_proveedor,
  CASE 
    WHEN COUNT(DISTINCT oi.seller_id) < 150 AND COUNT(DISTINCT oi.order_id) > 2000 THEN 'ALTA OPORTUNIDAD'
    WHEN COUNT(DISTINCT oi.seller_id) < 200 AND COUNT(DISTINCT oi.order_id) > 3000 THEN 'MEDIA OPORTUNIDAD'
    ELSE 'BAJA OPORTUNIDAD'
  END as viabilidad
FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
GROUP BY p.product_category_name
HAVING COUNT(DISTINCT oi.seller_id) > 50
ORDER BY viabilidad DESC, ordenes_por_proveedor DESC;