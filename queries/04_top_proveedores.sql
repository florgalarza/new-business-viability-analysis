-- 4) TOP PROVEEDORES POR CATEGORÍA
-- Propósito: Identificar líderes por categoría y cómo compiten (precio)
-- Muestra ranking explícito: top-1, top-2, etc dentro de cada categoría

WITH proveedores_ranked AS (
  SELECT 
    p.product_category_name,
    oi.seller_id,
    s.seller_city,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) as total_ordenes,
    ROUND(AVG(oi.price), 2) as precio_promedio,
    ROUND(AVG(oi.freight_value), 2) as costo_envio_promedio,
    ROW_NUMBER() OVER (PARTITION BY p.product_category_name ORDER BY COUNT(DISTINCT oi.order_id) DESC) as ranking
  FROM olist_products_dataset p
  LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
  LEFT JOIN olist_sellers_dataset s ON oi.seller_id = s.seller_id
  GROUP BY p.product_category_name, oi.seller_id, s.seller_city, s.seller_state
  HAVING COUNT(DISTINCT oi.order_id) > 20
)
SELECT 
  product_category_name,
  ranking,
  seller_id,
  seller_city,
  seller_state,
  total_ordenes,
  precio_promedio,
  costo_envio_promedio
FROM proveedores_ranked
WHERE ranking <= 10
ORDER BY product_category_name, ranking;