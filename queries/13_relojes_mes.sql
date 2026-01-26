--13)ORDENES POR MES DE RELOJES

SELECT 
  strftime('%Y-%m', o.order_purchase_timestamp) as mes,
  COUNT(DISTINCT o.order_id) as ordenes_mes,
  ROUND(AVG(oi.price), 2) as precio_promedio
FROM olist_orders_dataset o
LEFT JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
LEFT JOIN olist_products_dataset p ON oi.product_id = p.product_id
WHERE p.product_category_name = 'relogios_presentes'
  AND o.order_status = 'delivered'
GROUP BY mes
ORDER BY mes;