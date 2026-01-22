# Análisis de Viabilidad de Negocio: E-commerce Brasileño

## El Ejercicio

Para este ejercicio me hice la siguiente pregunta: **¿Si una empresa de retail quisiera entrar a nuevas categorías de productos en Brasil, en cuáles debería enfocarse?**

Para responderla, usé un dataset público de Olist (2016-2018). No es una recomendación actual - es un ejercicio de análisis donde aplico pensamiento de negocio a datos reales. El objetivo es demostrar cómo abordaría decisiones de entrada a mercado, análisis de competencia y evaluación de oportunidades.

El hallazgo principal fue que **la mejor oportunidad** no está donde hay más ventas, sino **donde hay demanda comprobada pero pocos competidores**.

## Los Datos

Usé el dataset **Brazilian E-Commerce Public Dataset** disponible en Kaggle:
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

El dataset contiene 100k órdenes entre 2016-2018. Es data real de comercio, anonimizada. Para este análisis extrajé:
- 3,095 proveedores activos
- 74 categorías de productos
- ~98,666 transacciones
- Distribuidos en 23 estados brasileños

*Transparencia:* estos datos tienen ~6-8 años. El propósito de este proyecto es demostrar metodología de análisis, no hacer recomendaciones sobre el mercado actual.
Quien quiera replicar este ejercicio puede descargar el mismo dataset en Kaggle.

## Qué Analicé (y Cómo)

Para cada categoría de producto, calculé cuatro métricas:

### 1. Competencia - Órdenes por Proveedor (Promedio)

La idea: ¿Está el mercado concentrado en pocos jugadores o distribuido entre muchos?

*Cómo se calcula:* Órdenes por Proveedor = Total de Órdenes en la Categoría / Número de Proveedores

*ACLARACIÓN:* Este es un promedio y puede contener distribuciones atípicas. Por ejemplo, un proveedor gigante + 400 pequeños darían un promedio engañoso. Por eso lo complementé analizando también quiénes son los top proveedores y cómo está distribuida la demanda real.

**Ejemplo:**
- Belleza & Salud: 8,836 órdenes ÷ 492 proveedores = **17.96 órdenes/proveedor**
- Relojes y Presentes: 5,624 órdenes ÷ 101 proveedores = **55.68 órdenes/proveedor**

*Interpretación:* Con un promedio de 17,96 órdenes por proveedor, la categoría Belleza presenta un alto nivel de fragmentación, con muchos actores compitiendo por un volumen reducido de demanda. En contraste, con 55,68 órdenes por proveedor, tiene una mayor demanda concentrada por proveedor, lo que implica menor fragmentación y una mayor oportunidad de capturar participación sin enfrentar una competencia tan intensa.

### 2. Demanda Real - Volumen Absoluto de Transacciones

La idea: ¿Existe demanda comprobada? No basta saber si hay pocos competidores - necesitas que haya clientes comprando.

*Cómo se calcula:* Total de Órdenes por Categoría (conteo directo del dataset)

**Ejemplo:**
- Belleza & Salud: 8,836 órdenes (mucha demanda)
- Alimentos: 450 órdenes (poca demanda)
- Flores: 29 órdenes (muy poca demanda)

*Interpretación:* 8,836 vs 450 es casi 20x de diferencia. Belleza tiene demanda comprobada a escala mientas que Alimentos existe pero es nicho, y  Flores es muy pequeño. El volumen importa porque necesitas suficiente demanda para sustentar un negocio.

### 3. Rentabilidad - Margen Después de Logística

La idea: ¿Cuánto dinero queda después de pagar envíos? El margen bruto pierde relevancia si los costos logísticos absorben gran parte de la rentabilidad.

*Cómo se calcula:*  Margen Neto = Precio Promedio - Costo Logística Promedio
                  Margen % = (Margen Neto / Precio Promedio) × 100

**Ejemplo:**
- PCs: Precio $1,098 - Logística $48 = **Margen neto $1,050 = 95.59%**
- Relojes: Precio $201 - Logística $17 = **Margen neto $184 = 91.66%**
- Flores: Precio $34 - Logística $15 = **Margen neto $19 = 55.96%**

*Interpretación:* La categoría PCs presenta un margen bruto elevado (95%), mientras que Flores muestra un margen considerablemente menor (56%). Esta diferencia es relevante desde una perspectiva competitiva: en un escenario con numerosos competidores, como el de Flores, la competencia vía precio termina erosionando ese margen, dejando poco espacio para la rentabilidad. Por lo tanto, el margen solo resulta sostenible cuando la dinámica competitiva del mercado es limitada en términos de presión sobre precios.

### 4. Logística - Velocidad de Entrega

La idea: ¿Podes cumplir con las expectativas operativas del mercado? Si el promedio es 5 días pero tardás 20, los clientes te dejan malas reseñas antes de empezar.

*Cómo se calcula:* Días Promedio de Entrega = Promedio de (Fecha de Entrega Real - Fecha del Pedido)

**Ejemplo:**
- Artes y Artesanía: 5.0 días promedio
- Relojes y Presentes: 12.2 días promedio
- Muebles de Oficina: 20.2 días promedio

*Interpretación:* 5 vs 20 días es una diferencia operativa GRANDE. Si entras a una categoría donde el cliente espera 5 días y tu logística tarda 20, estás fuera de competencia antes de competir. Esto limita quién puede jugar en cada mercado.

### 5. Score de Viabilidad - La Métrica Compuesta

Todo junto es difícil de comparar. Necesitás un número que resuma "¿Qué tan viable es esta categoría?"

*Cómo se calcula (simplificado):* Score = (Órdenes por Proveedor) + (Cantidad de órdenes) + (Margen %) - (Días de entrega)

La lógica: más órdenes/proveedor = mejor (menos saturación). Más demanda = mejor. Más margen = mejor. Menos días = mejor.

**Ejemplo:**
- Relojes: 55.68 órdenes/proveedor + 5,624 órdenes + 91.66% margen + 12.2 días = **Score 125 (ALTO)**
- Belleza: 17.96 órdenes/proveedor + 8,836 órdenes + 85.5% margen + 11.5 días = **Score 57 (BAJO)**

*Interpretación:*
Aunque Belleza tiene margen similar y más demanda, el score es mucho más bajo. ¿Por qué? Porque la saturación de competidores (492 vs 101) es un problema mayor que la demanda. Un mercado saturado mata rentabilidad, incluso si el margen teórico es alto.

------------
**Relojes y Presentes** fue el hallazgo más claro. Tiene 5,624 órdenes con solo 101 proveedores. Eso significa 55.68 órdenes por proveedor - mucho más que el promedio. El margen es 91.66%  y la entrega promedio es manejable (12.2 días). **¿Por qué esto importa?** Hay demanda comprobada pero el mercado no está saturado. Hay lugar para crecer.

**Portátiles** (cafeteras, aparatos de cocina especializados) es similar. Muy pocos proveedores, márgenes de 90%+, pero volumen menor. Es un nicho, pero un nicho rentable.

**Cama, Mesa, Baño** es el punto intermedio interesante. 9,417 órdenes (bastante volumen) pero solo 196 proveedores (competencia manejable). Margen 80.26%. Score: 114. Es viable sin ser un nicho ultra-específico.

### Dónde NO Entrar

**Belleza & Salud** parece atractiva de lejos: 8,836 órdenes, margen 85.5%. Pero hay 492 proveedores. Eso es 17.96 órdenes por proveedor. Muy poco para tanta competencia. Es un mercado maduro donde ya hay ganadores establecidos.

**Deporte & Ocio** similar: 481 proveedores, margen decente pero pocas órdenes por proveedor. Es un mercado consolidado.

**Utilidades Domésticas** está saturada (468 proveedores, score 52). No lo recomendaría

## Cómo Interpretar Esto

La lógica es simple: en retail/CPG, **la saturación de mercado es más riesgosa que un margen bajo**.

Un margen del 80% en un mercado con baja competencia puede resultar más sostenible que un margen del 85% en un mercado con 492 proveedores, donde la competencia en precios reduce de forma significativa la rentabilidad real.

## Validación de la Metodología vs Limitaciones de Scope

**Este análisis valida una METODOLOGÍA y un CONCEPTO. No pretende ser la respuesta final.**

Cualquier decisión de negocio se construye en capas. Este proyecto completa la primera:

**Capa 1 - ¿Existe una oportunidad teórica?**

¿La saturación de mercado es realmente el factor más importante? ¿La metodología (órdenes/proveedor + demanda + margen) tiene sentido? 

Respuesta: Validado. Con datos históricos, la metodología produce insights claros y consistentes. Si una categoría tiene 55 órdenes/proveedor y otra tiene 18, la diferencia en viabilidad es evidente.

**Capa 2 - ¿Es la oportunidad actual?**

¿Sigue siendo válida en 2024? Los datos son de 2016-2018. El mercado cambió. 

Respuesta: No, se necesitan datos actuales de Olist u otros marketplaces brasileños para responder esta pregunta.

**Capa 3 - ¿Quiénes son realmente los competidores?**

¿Cómo entramos específicamente? ¿Cuáles son las barreras reales?

Respuesta: Este proyecto no se enfoca en un análisis competitivo detallado, donde se tiene en cuenta reseñas de proveedores o tasas de devolución.

**Capa 4 - ¿Validación de cliente?**

¿El mercado efectivamente quiere esto?

Respuesta: Para responder esta pregunta se requiere research primaria con clientes reales.

**Por qué esto importa:** No tiene sentido invertir recursos en Capas 3 y 4 si Capa 1 ya falla. Este análisis prueba que Capa 1 es viable. 

La metodología es sólida. Los datos son históricos pero reales. Eso es suficiente para validar el concepto.

## Archivos

- `queries/` → Los 8 SQL scripts que usé para analizar
- `results/` → Los CSVs con los resultados de cada análisis
- `README.md` → Este archivo


## Nota Final

Este proyecto nació de una pregunta de negocio real. Muchos análisis de datos producen números bonitos pero olvidan lo importante: **convertir esos números en una recomendación clara**.

Es fácil mostrar 492 competidores, 85% de margen, 8,836 órdenes y decir "acá están los datos." Más difícil es decir "con esos datos, mi recomendación es: NO entres acá porque está saturado."

Este análisis intenta hacer eso: empezar con una decisión ("¿dónde expando?"), analizar datos para responderla, y terminar con conclusiones claras ("entra en Relojes, no entres en Belleza").

¿Es perfecto? No. ¿Responde a la pregunta? Sí.


