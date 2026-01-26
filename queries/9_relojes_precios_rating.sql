--9) RELOJES: PRECIO VS RATING
-- Análisis de Relojes: precio vs satisfacción
SELECT 
  CASE 
    WHEN oi.price < 100 THEN 'Bajo (<$100)'
    WHEN oi.price < 200 THEN 'Medio ($100-200)'
    WHEN oi.price < 300 THEN 'Alto ($200-300)'
    ELSE 'Premium (>$300)'
  END as rango_precio,
  COUNT(DISTINCT o.order_id) as ordenes,
  ROUND(AVG(oi.price), 2) as precio_promedio,
  ROUND(AVG(r.review_score), 2) as rating_promedio,
  ROUND(AVG(CAST(JULIANDAY(o.order_delivered_customer_date) - JULIANDAY(o.order_approved_at) AS FLOAT)), 1) as dias_entrega_promedio
FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi ON p.product_id = oi.product_id
LEFT JOIN olist_orders_dataset o ON oi.order_id = o.order_id
LEFT JOIN olist_order_reviews_dataset r ON o.order_id = r.order_id
WHERE p.product_category_name = 'relogios_presentes'
  AND r.review_score IS NOT NULL
GROUP BY rango_precio
ORDER BY precio_promedio;