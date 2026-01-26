--15)DEMANDA POR REGION (SP VS RESTO)

SELECT 
  CASE 
    WHEN c.customer_state = 'SP' THEN 'São Paulo'
    ELSE 'Resto de Brasil'
  END as region,
  COUNT(DISTINCT o.order_id) as ordenes,
  ROUND(100.0 * COUNT(DISTINCT o.order_id) / 
    (SELECT COUNT(DISTINCT o2.order_id) 
     FROM olist_orders_dataset o2
     LEFT JOIN olist_order_items_dataset oi2 ON o2.order_id = oi2.order_id
     LEFT JOIN olist_products_dataset p2 ON oi2.product_id = p2.product_id
     WHERE p2.product_category_name = 'relogios_presentes'), 2) as pct_demanda
FROM olist_orders_dataset o
LEFT JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
LEFT JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
LEFT JOIN olist_products_dataset p ON oi.product_id = p.product_id
WHERE p.product_category_name = 'relogios_presentes'
GROUP BY region;