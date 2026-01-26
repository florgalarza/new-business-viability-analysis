-- 12) VARIABILIDAD DE PRECIOS POR CATEGORIA
-- Detectar volatilidad de precios como indicador de presion competitiva
-- Interpretacion: Mayor variabilidad = mayor presion de precios / segmentacion de mercado

SELECT 
  p.product_category_name,
  COUNT(DISTINCT oi.order_id) AS total_ordenes,
  ROUND(AVG(oi.price), 2) AS precio_promedio,
  ROUND(MIN(oi.price), 2) AS precio_minimo,
  ROUND(MAX(oi.price), 2) AS precio_maximo,

  -- Desviacion estandar poblacional
  ROUND(
    SQRT(AVG(oi.price * oi.price) - AVG(oi.price) * AVG(oi.price)),
    2
  ) AS desviacion_estandar,

  -- Coeficiente de variacion
  ROUND(
    (
      SQRT(AVG(oi.price * oi.price) - AVG(oi.price) * AVG(oi.price))
      / AVG(oi.price)
    ) * 100,
    2
  ) AS coeficiente_variacion_pct

FROM olist_products_dataset p
LEFT JOIN olist_order_items_dataset oi 
  ON p.product_id = oi.product_id

WHERE oi.price > 0
GROUP BY p.product_category_name
ORDER BY coeficiente_variacion_pct DESC;