# Análisis de Viabilidad de Negocio: E-commerce Brasileño

¿Qué determina si una categoría de productos en retail es una oportunidad viable para expansión?

Para este ejercicio me hice la siguiente pregunta: **¿Si una empresa de retail quisiera entrar a nuevas categorías de productos en Brasil, en cuáles debería enfocarse?**

---

El hallazgo principal fue que **la mejor oportunidad** no está donde hay más ventas, sino **donde hay demanda comprobada pero pocos competidores**.

| Parámetro | Valor |
|-----------|-------|
| **Fuente** | [Brazilian E-Commerce Public Dataset (Olist)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) |
| **Período** | 2016-2018 |
| **Órdenes analizadas** | 98,666 |
| **Proveedores únicos** | 3,095 |
| **Categorías de productos** | 74 |
| **Cobertura geográfica** | 23 estados brasileños |

**Transparencia:** Los datos tienen 6-8 años. El objetivo es demostrar una metodología de análisis, no hacer recomendaciones para 2024. Quien quiera replicar esto puede descargar el dataset en Kaggle y verificar.

---

## Metodología

El análisis integra dimensiones operativas y de satisfacción del cliente. Cada métrica responde una pregunta estratégica que cualquier decisión de expansión enfrenta: ¿es sostenible entrar a una categoría?
Para todas las secciones usamos 6 categorías consistentes como referencia: Libros, Alimentos, Belleza, Relojes, Muebles y Flores, a fin de poder identificar el patrón claramente en cada dimensión.

### 1. Competencia: Concentración de Demanda

**¿Por qué importa?**

Un mercado saturado genera presión competitiva en precios. Si hay pocos clientes repartiéndose entre muchos vendedores, cada proveedor recibe pocas órdenes. Esto obliga a competir por volumen reduciendo los márgenes.

**Métrica:**
```
Órdenes por Proveedor = Total Órdenes / Número de Proveedores
```

*ACLARACIÓN:* Este es un promedio y puede contener distribuciones atípicas. Por ejemplo, un proveedor gigante + 400 pequeños darían un promedio engañoso. Por eso lo complementé analizando también quiénes son los top proveedores y cómo está distribuida la demanda real.

**Ejemplo:**
- Belleza & Salud: 8,836 órdenes ÷ 492 proveedores = **17.96 órdenes/proveedor**
- Relojes y Presentes: 5,624 órdenes ÷ 101 proveedores = **55.68 órdenes/proveedor**

*Interpretación:* Con un promedio de 17,96 órdenes por proveedor, la categoría Belleza presenta un alto nivel de fragmentación, con muchos actores compitiendo por un volumen reducido de demanda. En contraste, con 55,68 órdenes por proveedor, tiene una mayor demanda concentrada por proveedor, lo que implica menor fragmentación y una mayor oportunidad de capturar participación sin enfrentar una competencia tan intensa.

**Qué significa cada una:**

Relojes tiene 55.71 órdenes/proveedor vs Belleza con 17.96. Esa diferencia de 3x no es casual: significa que cada proveedor en Relojes recibe 3 veces más órdenes que en Belleza. Con esa cantidad los márgenes son defendibles. Por el contrario, con 492 proveedores peleando por demanda en Belleza, la presión de precios es enorme.

Libros y Alimentos están en el extremo opuesto: pocos proveedores (54 y 58), pero también pocas órdenes. Eso genera fragmentación moderada. 
Muebles (37.44) está intermedio: más proveedores que Relojes pero menos presión que Belleza. 
Flores es extremo: solo 3 proveedores, pero con 29 órdenes totales, no hay escala.

**Ejemplo:**
- Belleza & Salud: 8,836 órdenes (mucha demanda)
- Alimentos: 450 órdenes (poca demanda)
- Flores: 29 órdenes (muy poca demanda)

*Interpretación:* 8,836 vs 450 es casi 20x de diferencia. Belleza tiene demanda comprobada a escala mientas que Alimentos existe pero es nicho, y  Flores es muy pequeño. El volumen importa porque necesitas suficiente demanda para sustentar un negocio.

En Libros, el top-5 controla 29.10% (fragmentación moderada). En Alimentos, 59.33% (mercado concentrado en pocos, lo que explica por qué es nicho). En Belleza, solo 14.02% (fragmentación extrema: ni siquiera los top-5 tienen poder). En Relojes, 30% (fragmentación moderada: sus líderes tienen poder real). En Muebles, 24.74% (fragmentación moderada). En Flores, 86.21% (concentrado, pero volumen insignificante).

La idea: ¿Cuánto dinero queda después de pagar envíos? El margen bruto pierde relevancia si los costos logísticos absorben gran parte de la rentabilidad.

*Cómo se calcula:*  Margen Neto = Precio Promedio - Costo Logística Promedio
                  Margen % = (Margen Neto / Precio Promedio) × 100

### 2. Demanda: Volumen Absoluto

*Interpretación:* La categoría PCs presenta un margen bruto elevado (95%), mientras que Flores muestra un margen considerablemente menor (56%). Esta diferencia es relevante desde una perspectiva competitiva: en un escenario con numerosos competidores, como el de Flores, la competencia vía precio termina erosionando ese margen, dejando poco espacio para la rentabilidad. Por lo tanto, el margen solo resulta sostenible cuando la dinámica competitiva del mercado es limitada en términos de presión sobre precios.

Un nicho con pocas órdenes no sustenta un negocio. La demanda absoluta limita cuánta rentabilidad podés extraer.

La idea: ¿Podes cumplir con las expectativas operativas del mercado? Si el promedio es 5 días pero tardás 20, los clientes te dejan malas reseñas antes de empezar.

| Categoría | Total Órdenes | Escala |
|-----------|---------|-----------|
| Libros Interés General | 512 | Nicho pequeño |
| Alimentos | 450 | Nicho pequeño |
| Belleza & Salud | 8,836 | Demanda a escala |
| **Relojes y Presentes** | **5,624** | **Demanda sostenible** |
| Muebles Escritorio | 1,273 | Nicho moderado |
| Flores | 29 | Demasiado pequeño |

**Ejemplo:**
- Artes y Artesanía: 5.0 días promedio
- Relojes y Presentes: 12.2 días promedio
- Muebles de Oficina: 20.2 días promedio

*Interpretación:* 5 vs 20 días es una diferencia operativa GRANDE. Si entras a una categoría donde el cliente espera 5 días y tu logística tarda 20, estás fuera de competencia antes de competir. Esto limita quién puede jugar en cada mercado.

---

### 3. Rentabilidad: Margen Neto tras Logística

**¿Por qué importa?**

El margen bruto es precio menos costo de producto. El margen neto es lo que queda después de restar logística. En algunas categorías, la logística consume tanta rentabilidad que prácticamente desaparece.

**Con datos reales:**

| Categoría | Precio Promedio | Costo Logística | Margen Neto | Margen % |
|-----------|--------|-----------|-------------|----------|
| Libros Interés General | $84.73 | $16.63 | $68.10 | 80.38% |
| Alimentos | $57.63 | $14.26 | $43.38 | 75.26% |
| Belleza & Salud | $130.16 | $18.88 | $111.28 | 85.50% |
| **Relojes y Presentes** | **$201.14** | **$16.78** | **$184.35** | **91.66%** |
| Muebles Escritorio | $162.01 | $40.55 | $121.46 | 74.97% |
| Flores | $33.64 | $14.81 | $18.82 | 55.96% |

**Qué significa:**

Relojes gana en ambas dimensiones: precio alto ($201) y costo logística bajo ($16.78), resultado = margen 91.66%. Eso es defendible incluso con competencia moderada.

Belleza tiene precio decente ($130) pero margen de 85.50% que parece alto pero se erosiona rápidamente con 492 competidores. 
Libros (80.38%) y Alimentos (75.26%) tienen márgenes modestos, lo que significa poco espacio para error operativo. 
Muebles (74.97%) sufre: costo logística alto ($40.55), se lleva parte del margen. 
Flores es dramático: $33.64 de precio, $14.81 de logística, solo quedan $18.82. Con presión competitiva, ese margen desaparece.

---

**Belleza & Salud** parece atractiva de lejos: 8,836 órdenes, margen 85.5%. Pero hay 492 proveedores. Eso es 17.96 órdenes por proveedor. Muy poco para tanta competencia. Es un mercado maduro donde ya hay ganadores establecidos.

**Deporte & Ocio** similar: 481 proveedores, margen decente pero pocas órdenes por proveedor. Es un mercado consolidado.

Cada categoría establece un estándar implícito de entrega. Si todos entregan en 12 días y vos entregas en 20, perdiste antes de empezar.

**Con datos reales:**

| Categoría | Días Promedio Entrega | Estándar |
|-----------|--------------|----------|
| Libros Interés General | 11.1 | Moderado |
| Alimentos | 9.2 | Bajo |
| Belleza & Salud | 11.5 | Moderado |
| **Relojes y Presentes** | **12.2** | **Moderado** |
| Muebles Escritorio | 20.2 | Alto |
| Flores | 10.8 | Bajo |

Un margen del 80% en un mercado con baja competencia puede resultar más sostenible que un margen del 85% en un mercado con 492 proveedores, donde la competencia en precios reduce de forma significativa la rentabilidad real.

Alimentos y Flores tienen expectativas bajas (9-10 días), lo que es favorable operativamente. 
Libros, Belleza y Relojes están en 11-12 días: estándar moderado, hay espacio para diferenciarse si entregas más rápido. Muebles (20.2) es barrera de entrada: es difícil competir si la expectativa del mercado es tan alta.

Para Relojes, 12.2 días significa que si entregas en 11 días, ya te destacas. Eso es una oportunidad real.

Cualquier decisión de negocio se construye en capas. Este proyecto completa la primera:

Mayor variabilidad de precios = más fragmentación y presión competitiva. Un coeficiente de variación alto significa que hay múltiples estrategias de pricing, lo que típicamente pasa en mercados saturados.

**Con datos reales:**

| Categoría | Precio Promedio | Coef. Variación % | Interpretación |
|-----------|-----------------|-------------------|-----------------|
| Libros Interés General | $84.73 | 124.69% | Moderada |
| Alimentos | $57.63 | 71.65% | Baja |
| Belleza & Salud | $130.16 | 137.90% | Moderada-Alta |
| **Relojes y Presentes** | **$201.14** | **127.64%** | **Moderada** |
| Muebles Escritorio | $162.01 | 57.84% | Baja |
| Flores | $33.64 | 49.0% | Muy baja |

**Qué significa:**

Belleza tiene variabilidad alta (137.90%), lo que refleja que 492 proveedores compiten con múltiples estrategias de precio.  
Relojes tiene variabilidad moderada (127.64%), menos intensa que Belleza: hay espacio de precio sin guerra de precios.

Respuesta: No, se necesitan datos actuales de Olist u otros marketplaces brasileños para responder esta pregunta.

---

### 6. Score de Viabilidad: Integrando Todo

Respuesta: Este proyecto no se enfoca en un análisis competitivo detallado, donde se tiene en cuenta reseñas de proveedores o tasas de devolución.

**Con datos reales:**

| Categoría | Fragmentación | Demanda | Margen | Entrega | Score |
|-----------|---------|---------|--------|---------|--------|
| Libros | 9.48 órd/prov | 512 | 80.38% | 11.1 días | 94 |
| Alimentos | 7.76 órd/prov | 450 | 75.26% | 9.2 días | 82 |
| Belleza & Salud | 17.96 órd/prov | 8,836 | 85.50% | 11.5 días | 57 |
| **Relojes y Presentes** | **55.71 órd/prov** | **5,624** | **91.66%** | **12.2 días** | **125** |
| Muebles Escritorio | 37.44 órd/prov | 1,273 | 74.97% | 20.2 días | 71 |
| Flores | 9.67 órd/prov | 29 | 55.96% | 10.8 días | 28 |

Respuesta: Para responder esta pregunta se requiere research primaria con clientes reales.

**Por qué esto importa:** No tiene sentido invertir recursos en Capas 3 y 4 si Capa 1 ya falla. Este análisis prueba que Capa 1 es viable. 

Belleza tiene demanda más grande (8,836) y margen decente (85.50%), pero la fragmentación extrema (492 proveedores) reduce el score a 57. Ese margen de 85.5% es teórico; en realidad, con esa presión competitiva, se erosiona rápidamente.

Libros y Alimentos tienen scores moderados (94 y 82) pero ambos sufren baja demanda. Muebles (71) sufre por logística cara (20.2 días es barrera). Flores (28) es inviable: demanda prácticamente inexistente.

---

## Conclusión Central: La Viabilidad No Depende de Una Sola Métrica

Belleza tiene 85.5% de margen y Relojes 91.66%. A primera vista, Relojes gana. Pero el margen teórico es eso: teórico. Con 492 proveedores compitiendo en Belleza, la presión de precios es tan fuerte que ese 85.5% en realidad termina siendo 60-70% real. En Relojes, con 101 proveedores, el 91.66% se mantiene más firme.

En Belleza su margen se erosiona rápidamente por saturación. Por el contrario en  Relojes el margen es mejor y está menos fragmentado. Por eso es importante no detenerse unicamente en el margen aislado sino evaluar contexto competitivo.

Es fácil mostrar 492 competidores, 85% de margen, 8,836 órdenes y decir "acá están los datos." Más difícil es decir "con esos datos, mi recomendación es: NO entres acá porque está saturado."

## Satisfacción del Cliente: La Parte que Muchos Olvidan

¿Es perfecto? No. ¿Responde a la pregunta? Sí.

### 7. Satisfacción por Categoría

**¿Qué vemos?**

| Categoría | Órdenes | Rating Promedio | % Satisfechos | % Insatisfechos |
|-----------|---------|-----------------|----------------|-----------------|
| Libros Interés General | 404 | 4.48/5 | 95.54% | 8.42% |
| Alimentos | 337 | 4.26/5 | 92.28% | 14.54% |
| Belleza & Salud | 6,923 | 4.14/5 | 85.69% | 15.04% |
| **Relojes y Presentes** | **4,443** | **4.0/5** | **79.52%** | **17.89%** |
| Muebles Escritorio | 1,005 | 3.46/5 | 79.7% | 35.42% |
| Flores | 22 | 4.25/5 | 90.91% | 9.09% |

**Qué significa:**

Libros lidera en satisfacción (4.48 rating, 95.54% satisfechos). 
Alimentos también fuerte (4.26, 92.28%). 
Belleza está en la media (4.14, 85.69%). 
Relojes está más bajo (4.0, 79.52%): casi 1 de cada 5 órdenes genera experiencia negativa. 
Muebles sufre más (3.46, 79.7%, 35.42% insatisfechos). 
Flores tiene rating decente (4.25) pero la muestra es muy pequeña (22 órdenes).

Para Relojes, 79.52% satisfechos vs 95.54% en Libros es una brecha real. Eso significa oportunidad: si mejorás satisfacción, ganás participación sin competir solo por precio.

---

### 8. Relojes: ¿Precio Alto = Mejor Satisfacción?

Un análisis específico en Relojes para entender qué valoran los clientes:

| Rango Precio | Órdenes | Precio Promedio | Rating | Días Entrega |
|-------------|---------|-----------------|--------|-------------|
| Bajo (<$100) | 1,584 | $56.20 | 3.93 | 9.9 |
| Medio ($100-200) | 1,640 | $146.65 | 4.02 | 13.6 |
| Alto ($200-300) | 570 | $240.94 | 4.0 | 14.5 |
| Premium (>$300) | 664 | $669.96 | 4.14 | 12.7 |

**Hallazgo clave:** Los premium (>$300) tienen mejor rating (4.14) pero entregan más lento (12.7 días). Los baratos (<$100) tienen peor rating (3.93) y entregan más rápido (9.9 días).

**Qué significa:** Hay un gap. Los clientes con presupuesto alto valoran calidad + entrega rápida. Hoy nadie está combinando ambos. Eso es una oportunidad clara: **relojes premium con entrega rápida**.

---

### 9. Entrega Rápida vs Satisfacción: ¿Hay Correlación?

¿Entregar rápido mejora el rating? Miramos todas las categorías:

| Categoría | Días Entrega | Rating | % Satisfechos |
|-----------|------------|--------|-------------|
| Alimentos | 9.2 | 4.26 | 92.28% |
| Flores | 10.8 | 4.25 | 90.91% |
| Libros Interés General | 11.1 | 4.48 | 95.54% |
| Belleza & Salud | 11.5 | 4.14 | 85.69% |
| **Relojes y Presentes** | **12.2** | **4.0** | **79.52%** |
| Muebles Escritorio | 20.2 | 3.46 | 79.7% |

**Qué significa:**

No hay correlación directa simple (algunos con entrega lenta tienen mejor rating). Pero hay un patrón: cuando logística es extrema (Muebles 20.2 días), la satisfacción cae (3.46). Relojes está en un rango intermedio (12.2 días, 4.0 rating).

Lo importante: **Relojes CON entrega más rápida (11 días vs 12.2 hoy) probablemente mejoraría satisfacción de 79.52% a 85%+**. Libros lo demuestra: 11.1 días + 95.54% satisfacción.

---

## Síntesis: Por Qué Relojes Es Viable

Juntamos todo:

| Métrica | Valor | Contexto |
|---------|-------|---------|
| **Competencia** | 101 proveedores | Fragmentación media (no extrema) |
| **Demanda** | 5,624 órdenes | Volumen sostenible |
| **Margen** | 91.66% | Defendible, especialmente en premium |
| **Entrega** | 12.2 días | Estándar moderado (hay espacio para mejorar) |
| **Satisfacción** | 4.0/5 (79.52%) | Media-baja (oportunidad de diferenciarse) |
| **Score** | 125 | ALTO |

**Relojes no es "la mejor categoría" pero es viable. Hay demanda, márgenes defendibles, y espacio operativo para diferenciarse.**

---

## Dónde No Entrar (El Contraejemplo: Belleza)

| Métrica | Valor | Por Qué No |
|---------|-------|---------|
| **Competencia** | 492 proveedores | Fragmentación extrema |
| **Demanda** | 8,836 órdenes | Mucha demanda, pero... |
| **Margen** | 85.5% | Teórico, pero presión real |
| **Satisfacción** | 4.14/5 (85.69%) | Media, con saturación erosiona |
| **Score** | 57 | BAJO |

Belleza parece atractiva (mucha demanda, margen alto, rating decente). Pero 492 proveedores generan presión de precios que reduce ese 85% significativamente. No es negocio sostenible.

---

## La Lógica Detrás: Por Qué Importa la Saturación

En retail y CPG, la saturación competitiva es más riesgosa que un margen bajo.

Un margen del 80% en un mercado con 150 proveedores va a ser más sostenible que un margen del 85% con 500 proveedores.

Lo que vemos como "margen alto" (Belleza con 85.5%) se desmorona cuando ves que 492 proveedores compiten por lo mismo. La presión de precios es real. 

---

## Limitaciones Explícitas: Marco de Capas

Este análisis valida una metodología y un concepto. No pretende ser respuesta definitiva.

Cualquier decisión de negocio se construye en capas progresivas:

### Capa 1: ¿Existe Oportunidad Teórica?

**Pregunta:** ¿La saturación de mercado es realmente determinante? ¿La metodología produce insights consistentes?

**Respuesta:** Validado. Con datos históricos, cuando una categoría tiene 55 órdenes/proveedor (Relojes) vs 18 (Belleza), la diferencia de viabilidad es clara y consistente.

### Capa 2: ¿Es Vigente la Oportunidad?

**Pregunta:** ¿Siguen siendo válidas estas conclusiones en el presente? Los datos son de 2016-2018.

**Respuesta:** No validado. Se requieren datos actuales de Olist o marketplaces brasileños para responder.

### Capa 3: ¿Quiénes son los Competidores Reales?

**Pregunta:** ¿Cómo entraríamos específicamente? ¿Cuáles son las barreras reales (reseñas, devoluciones, reputación)?

**Respuesta:** Fuera de scope. Este proyecto no analiza competencia cualitativa detallada.

### Capa 4: ¿Hay Validación de Cliente?

**Pregunta:** ¿El mercado efectivamente quiere lo que ofrecemos?

**Respuesta:** Fuera de scope. Se requiere research primaria con clientes reales.

**Por qué esto importa:** No tiene sentido invertir recursos en Capas 3-4 si Capa 1 falla. Este análisis prueba que Capa 1 (para Relojes) es sólida.

---

## Plan de Ejecución: Si Entramos en Relojes

### ¿Sin Repeat Rate Sigue Siendo Buen Negocio?

Primer hallazgo: **En Relojes, 0% de clientes compran más de una vez.**

Eso suena malo. Pero necesitamos contexto:

**Productos de baja frecuencia de compra:**
Relojes es como heladeras, monopatines, o sofás. Nadie compra 2 relojes al mismo vendedor en 6 meses. Eso NO significa que sea mal negocio; significa que el modelo es diferente.

| Métrica | Relojes | Libros | Alimentos |
|---------|---------|--------|-----------|
| Repeat Rate | 0% | 30%+ | 80%+ |
| Margen | 91.66% | 80.38% | 75.26% |
| Precio Promedio | $201 | $85 | $58 |
| Compras/Año | 1 | 12+ | 50+ |
| LTV por Cliente | $184 | $1,000+ | $2,000+ |

**El punto:** Relojes NO compite por repeat, compite por **margen alto + volumen.**

**Cálculo realista (500 órdenes/mes):**

```
Ingresos:
500 órdenes/mes × $201 precio promedio = $100,500/mes

Costos variables:
- Costo de goods (20% del precio): $20,100
- Logística ($16.78): $8,391
- Costo variable total: $28,491

Margen bruto: $72,009/mes

Costos fijos (estimados):
- Marketing/CAC ($15 × 500): $7,500
- Operaciones (staff, almacén): $3,000
- Plataforma/tech: $1,000
- Costo fijo total: $11,500

Margen operativo: $72,009 - $11,500 = $60,509/mes

Margen anual: $60,509 × 12 = $726,108/año
```

**Eso SÍ es buen negocio.** Sin repeat, pero con margen alto y volumen.

**El riesgo real:**
Si CAC sube a $25 (porque competencia es fuerte):
- Marketing/CAC: $12,500/mes
- Margen operativo: $59,509/mes
- Sigue siendo viable pero ajustado

Si CAC sube a $35:
- Marketing/CAC: $17,500/mes
- Margen operativo: $54,509/mes
- Empieza a ser frágil

**Conclusión:** Sin repeat rate, Relojes sigue siendo negocio viable. El factor existencial es **CAC**, no volumen. Si podés adquirir clientes por <$15, funciona. Si sube a >$25, necesitás diferenciarte (marca, servicio) para justificar.

---

### Realidad del Mercado (Basado en Datos)

Antes de planificar, necesitás entender qué está pasando realmente en Relojes:

**Volumen de órdenes:**
Relojes creció de 4 órdenes/mes (oct 2016) a 507 órdenes/mes (jul 2018). El promedio en 2018 fue ~430 órdenes/mes. Eso es sostenible.

**Costo logística:**
$16.78 por orden. En escenarios realistas:
- 300 órdenes/mes = $5,034/mes en logística
- 500 órdenes/mes = $8,391/mes en logística
- 1000 órdenes/mes = $16,781/mes en logística

**Distribución geográfica:**
37.96% de la demanda está en São Paulo, 62.04% en resto de Brasil. Esto significa que NO debemos enfocarnos solo en SP como pensábamos. Hay mercado distribuido por lo que invertir todo en SP sería error.

**Customer Repeat Rate (CRÍTICO):**
100% de clientes en Relojes compran solo una vez = CERO repeat. Eso cambia completamente la estrategia. No podemos contar con lifetime value alto. Cada cliente es una adquisición nueva.

---

### Estimación de Inversión - Año 1 (Basada en Datos Reales)

Con 430 órdenes/mes promedio, el escenario realista es ~500 órdenes/mes de meta conservadora:

| Componente | Cálculo | Estimado | Justificación |
|-----------|---------|----------|---------------|
| **Costo Logística Anual** | 500 órdenes/mes × $16.78 × 12 meses | $100,680 | Datos reales de Query 14 |
| **Inventario Inicial** | 500 órdenes × Precio promedio 2018 ($190) × 20% costo | $19,000 | Basado en rotación esperada |
| **Marketing/Adquisición** | CAC estimado $15-20 × 500 órdenes/mes × 12 | $90,000-120,000 | Crítico sin repeat rate |
| **Plataforma Tech** | Integración marketplace + CRM | $10,000-15,000 | Estándar |
| **Operaciones (staff, almacén)** | 0.5 FTE + costos operativos | $30,000-40,000 | Mínimo viable |
| **Buffer (contingencia 10%)** | | $25,000 | Porque sin repeat, márgenes ajustados |
| **Total Año 1** | | **$274,680-340,680** | Rango realista |

**Por qué estos números:**
- Logística: 100% data-driven (Query 14)
- Inventario: Basado en precio real 2018 (~$190)
- Marketing: SIN repeat rate, customer acquisition cost es el 70% del presupuesto. No es negocio de bajo costo.
- Operaciones: Necesitás mínimo para manejar 500 órdenes/mes

---

### La Sorpresa: El Problema de Repeat Rate

Aća está el hallazgo más importante: **En Relojes, 100% de clientes compran una sola vez.**

Eso significa:
- No hay fidelización natural
- No hay upsell
- Cada mes necesitás 500 clientes NUEVOS
- Customer Acquisition Cost es crítico

**Comparativa:**
- Sin repeat: LTV = Margen × 1 compra
- Con repeat (industria típica): LTV = Margen × 2-3 compras

En Relojes: LTV = $184.35 (el margen neto). Con CAC de $15-20, ratio es 9-12x. Sigue funcionano pero es ajustado.

---

### Timeline Estimado

| Hito | Timeline | Qué sucede | Métrica Clave |
|------|----------|-----------|---------------|
| Validación comercial | Mes 1-2 | Hablar con 5 proveedores, probar CAC real | ¿CAC es <$15 realista? |
| Setup operativo + Inventario | Mes 2-4 | Logística (no SP-only), plataforma, primeros 100 SKU | Costo operativo real |
| MVP: 100 órdenes/mes | Mes 4-5 | Primeras ventas, validar margen real | Margen neto real vs 91.66% |
| Escala a 300 órdenes/mes | Mes 5-9 | Después de probar, aumentar marketing | CAC sigue siendo <$15? |
| Evaluación | Mes 9-12 | ¿Vale la pena escalar a 500+? | ROI claro |

---

### KPIs de Éxito - Año 1

| KPI | Target | Realidad Mercado | Por Qué Importa | Data Source |
|-----|--------|------------------|-----------------|-------------|
| Órdenes/mes | 500+ | Promedio histórico: 430 (2018) | Necesitás volumen para cubrir fixed costs | Query 13 |
| Margen neto real | 75%+ | Promedio en datos: 91.66% | Competencia puede reducir esto | Query 14 datos históricos |
| CAC (Customer Acq Cost) | <$15 | A validar | Sin repeat, CAC es el 70% del presupuesto | Nuevo KPI |
| Rating | 4.2+/5 | Relojes actual: 4.0/5 | Diferenciador vs competencia | Dataset reviews |
| % Devoluciones | <8% | Estándar industria | Impacta margen real | A calcular con datos reales |
| Costo Logística Real | <$18/orden | Datos: $16.78 | Es fijo, necesitás mantenerlo bajo | Query B |

**Criterio de parada:**
- Si CAC sube a >$18 → Modelo no funciona
- Si margen real cae <75% → Price-war agresiva
- Si 3 meses y no llegas a 200 órdenes → Demanda no existe

---

### Riesgos Principales (Actualizados con Datos)

| Riesgo | Probabilidad | Impacto | Mitigación | Data |
|--------|------------|--------|-----------|------|
| CAC más alto que $15 | **Alta** | **Crítico** | Validar CAC ANTES de escalar. Sin repeat, CAC es existencial | 0% repeat rate |
| Margen cae por price-war | Media | Alto | Diferenciar por servicio, no precio | Variabilidad 127.64% |
| Costo logística sube | Baja | Medio | Mercado está optimizado ($16.78), difícil bajar | Query B datos reales |
| Distribución geográfica compleja | Media | Medio | 62% está fuera SP. Logística en interior es cara | Query 15 |
| Operación logística falla | Baja | Crítico | Outsourcear a 3PL, NO hacer propio | Entrega promedio 12.2 días |

---

### Validación Requerida - Próximos Pasos (Prioridad por Data-Driven)

**Paso 1 (CRÍTICO): Validar CAC Real**
- Test: Lanzar 100 órdenes con marketing específico
- Presupuesto test: $1,500-2,000
- Target: CAC <$15 (breakeven a 12 compras, acá es 1)
- Si CAC >$20: PARAR. Modelo no funciona.

**Paso 2: Entender Por Qué Sin Repeat**
- ¿Clientes compran 1 reloj y listo?
- ¿O hay insatisfacción (rating 4.0)?
- ¿Cómo otros competidores logran repeat?
- Encuesta: 20 clientes que compraron en Relojes

**Paso 3: Validar Margen Real**
- Datos dicen 91.66% pero eso es promedio
- ¿Tu costo de goods es 20%? ¿O 30%?
- ¿Hay devoluciones ocultas?
- Negociar con 3 proveedores reales

**Paso 4: Geográfico**
- 62% fuera SP, 38% en SP
- ¿Cómo manejás logística interior?
- ¿Costo logística se va a $20+?
- Probar envíos a 2-3 estados

**Paso 5: Financiero Realista**
- Proyectar P&L con:
  - Órdenes/mes: 300 (conservador)
  - CAC: $15
  - Margen neto: 80% (pesimista)
  - Costo logística: $17/orden
- Break-even: mes 12-18
- ROI positivo: mes 24+

---

## Estructura del Proyecto

```
queries/
├── 01_exploracion_basica.sql
├── 02_proveedores_por_categoria.sql
├── 02.5_top_n_concentration.sql
├── 03_mapeo_competencia_demanda.sql
├── 04_top_proveedores.sql
├── 05_margen_por_categoria.sql
├── 06_velocidad_entrega.sql
├── 07_distribucion_demanda_estado.sql
├── 08_reviews_por_categoria.sql
├── 09_relojes_precio_vs_rating.sql
├── 10_entrega_vs_rating.sql
├── 11_score_viabilidad.sql
├── 12_variabilidad_precios.sql
├── 13_ordenes_por_mes_relojes.sql (Plan de Ejecución)
├── 14_costo_logistica_escenarios.sql (Plan de Ejecución)
├── 15_demanda_por_region.sql (Plan de Ejecución)
└── 16_customer_repeat_rate.sql (Plan de Ejecución)

results/
└── (CSV con resultados de cada query enumerados)
```
---


## Sobre los Datos: Qué es Real y Qué es Estimación

**En el análisis de Viabilidad (Secciones 1-9):**
Todos los datos vienen del dataset Olist:
-  Órdenes por proveedor (Query 2)
-  Top-N concentration (Query 2.5)
-  Margen por categoría (Query 5)
-  Velocidad entrega (Query 6)
-  Reviews y satisfacción (Query 8)
-  Precio vs rating (Query 9)
-  Entrega vs satisfacción (Query 10)
-  Variabilidad de precios (Query 12)

**En el Plan de Ejecución (Secciones posteriores):**

| Dato | Fuente | Tipo |
|------|--------|------|
| Órdenes/mes promedio (430) | Query 13 (datos históricos) |  Real |
| Costo logística ($16.78/orden) | Query 14 (datos históricos) |  Real |
| Distribución SP vs Resto (37.96% vs 62.04%) | Query 15 (datos históricos) |  Real |
| Repeat Rate (0%) | Query 16 (datos históricos) |  Real |
| **CAC ($15/cliente)** | Estimación educada |  Asunción |
| **Costo de goods (20%)** | Estándar industria |  Asunción |
| **Costo operaciones ($3k/mes)** | Estimación basada en escala |  Asunción |
| **Margen neto real en operación (75-80%)** | Proyección pesimista |  Asunción |

**Por qué aclaramos:**
El Plan de Ejecución mezcla datos reales (Queries 13-16) con estimaciones razonables. Las estimaciones están fundamentadas pero requieren validación operativa real.

---

## Cómo Usar Este Análisis

1. Descargá el dataset: [Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
2. Ejecutá las queries SQL en orden (01 → 12)
3. Revisá los resultados en la carpeta `/results/`
4. Leé el análisis completo en este README


---

## Reflexión Final

Cuando empecé este análisis pensé que la saturación era obvia, y que si había muchos proveedores, eso era malo. Pero trabajando con los datos me di cuenta que no es tan simple.

Lo que pensamos que es un "margen alto" (Belleza con 85.5%) se desmorona cuando ves que 492 proveedores compiten por lo mismo. La presión de precios es real. Y eso es lo que muchos análisis pasan por alto: miran el margen aislado, no el contexto competitivo.

Pero acá hay algo importante que este análisis no puede responder: ¿y si nuestro producto/servicio tiene algo diferente? ¿Una marca fuerte, logística mejor, mejor servicio al cliente? Ese 101 proveedores en Relojes puede no importar si tenés algo que te diferencia. Este análisis asume que todos compiten igual.

En la práctica, la competencia en el mercado nunca es homogénea. Siempre hay alguien con mejor reputación, mejor precio, mejor ubicación, etc. Por lo tanto quien analiza esto tiene que reconocer que la saturación es un factor, pero no es el único. Si tenés ventaja competitiva real, podés ganar incluso en mercados fragmentados.

Por eso el "marco de capas" en este análisis. Capa 1 (¿existe oportunidad teórica?) la validamos acá. Pero Capas 2, 3, 4 son donde pasa lo importante: quiénes son realmente los competidores, cómo diferenciarte, si hay clientes que quieren lo que ofrecés.

Entonces la pregunta no es solo saber en qué categoría entrar, sino cuál es tu diferencial dentro de ese mercado.

---

**Dataset:** [Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  
**Metodología:** SQL + Análisis Estadístico Descriptivo + Validación de Satisfacción del Cliente  
**Período de Datos:** 2016-2018
