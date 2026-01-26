-- 2.5) ANALISIS TOP-N: CONCENTRACION DE DEMANDA
-- Validar que promedios (Query 2) no oculten distribuciones asimetricas
-- Muestra top-5 proveedores por categoria y su participacion de mercado

WITH proveedores_ranking AS (
  SELECT 
    p.product_category_name,
    oi.seller_id,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) as ordenes_vendedor,
    ROUND(AVG(oi.price), 2) as precio_promedio_vendedor,
    ROW_NUMBER() OVER (PARTITION BY p.product_category_name ORDER BY COUNT(DISTINCT oi.order_id) DESC) as ranking
  FROM olist_products_dataset p
  LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
  LEFT JOIN olist_sellers_dataset s ON oi.seller_id = s.seller_id
  GROUP BY p.product_category_name, oi.seller_id, s.seller_state
)
SELECT 
  product_category_name,
  ranking,
  seller_id,
  seller_state,
  ordenes_vendedor,
  precio_promedio_vendedor,
  ROUND(100.0 * ordenes_vendedor / 
    (SELECT COUNT(DISTINCT oi.order_id) 
     FROM olist_order_items_dataset oi 
     LEFT JOIN olist_products_dataset p ON oi.product_id = p.product_id 
     WHERE p.product_category_name = proveedores_ranking.product_category_name), 2) as porcentaje_demanda
FROM proveedores_ranking
WHERE ranking <= 5
ORDER BY product_category_name, ranking;