--10) ENTREGA RAPIDA VS RATING (TODAS LAS CATEGORIAS)
-- ¿Entrega rapida = mejor satisfaccion?
SELECT 
  p.product_category_name,
  COUNT(DISTINCT o.order_id) as ordenes,
  ROUND(AVG(CAST(JULIANDAY(o.order_delivered_customer_date) - JULIANDAY(o.order_approved_at) AS FLOAT)), 1) as dias_entrega,
  ROUND(AVG(r.review_score), 2) as rating_promedio,
  COUNT(CASE WHEN r.review_score >= 4 THEN 1 END) as satisfechos,
  ROUND(100.0 * COUNT(CASE WHEN r.review_score >= 4 THEN 1 END) / COUNT(DISTINCT o.order_id), 2) as pct_satisfechos
FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
LEFT JOIN olist_orders_dataset o ON oi.order_id = o.order_id
LEFT JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE r.review_score IS NOT NULL
GROUP BY p.product_category_name
ORDER BY dias_entrega ASC;