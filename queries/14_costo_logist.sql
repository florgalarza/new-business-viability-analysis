--14)COSTO LOGISTICO POR ESCENARIO (300, 500, 1000 ordenes/mes))
SELECT 
  'Escenario 300 órdenes/mes' as escenario,
  300 as ordenes_mes,
  ROUND(AVG(oi.freight_value), 2) as costo_logistica_promedio,
  ROUND(300 * AVG(oi.freight_value), 2) as costo_logistica_total_mes
FROM olist_order_items_dataset oi
LEFT JOIN olist_products_dataset p ON oi.product_id = p.product_id
WHERE p.product_category_name = 'relogios_presentes'

UNION ALL

SELECT 
  'Escenario 500 órdenes/mes',
  500,
  ROUND(AVG(oi.freight_value), 2),
  ROUND(500 * AVG(oi.freight_value), 2)
FROM olist_order_items_dataset oi
LEFT JOIN olist_products_dataset p ON oi.product_id = p.product_id
WHERE p.product_category_name = 'relogios_presentes'

UNION ALL

SELECT 
  'Escenario 1000 órdenes/mes',
  1000,
  ROUND(AVG(oi.freight_value), 2),
  ROUND(1000 * AVG(oi.freight_value), 2)
FROM olist_order_items_dataset oi
LEFT JOIN olist_products_dataset p ON oi.product_id = p.product_id
WHERE p.product_category_name = 'relogios_presentes';