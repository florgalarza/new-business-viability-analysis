--16)CUSTOMER REPEAT REAT RELOJES

WITH clientes_relojes AS (
  SELECT 
    o.customer_id,
    COUNT(DISTINCT o.order_id) as ordenes_cliente
  FROM olist_orders_dataset o
  LEFT JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
  LEFT JOIN olist_products_dataset p ON oi.product_id = p.product_id
  WHERE p.product_category_name = 'relogios_presentes'
  GROUP BY o.customer_id
)
SELECT 
  'Clientes 1 orden' as tipo,
  COUNT(*) as cantidad,
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM clientes_relojes), 2) as pct
FROM clientes_relojes
WHERE ordenes_cliente = 1

UNION ALL

SELECT 
  'Clientes 2+ órdenes',
  COUNT(*),
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM clientes_relojes), 2)
FROM clientes_relojes
WHERE ordenes_cliente >= 2;