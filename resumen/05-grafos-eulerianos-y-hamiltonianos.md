# Grafo Eulerianos y Hamiltonianos

Definiciones
------------

### Circuito Euleriano
* Un circuito `C` en un grafo (o multigrafo) `G` es un circuito euleriano si `C` pasa por todos las aristas de `G` una y sólo una vez.
* Un grafo euleriano es un grafo que tiene un circuito euleriano (o multigrafo).

```
Entrada: G = (V, X) conexo con todos los nodos de grado par.

comenzar por cualquier nodo v y construir un ciclo Z

mientras exista e ∈ X \ Z hacer
	elegir w tal que existe (w,u)∈Z y (w,z)∈X\Z
	desde w construir un ciclo D con D∩Z=∅
	Z := unir Z y D por medio de w
fin mientras

retornar Z
```
¿Cuál es la complejidad de este algoritmo?

### Camino Euleriano
* Un camino euleriano en un grafo (o multigrafo) `G` es un camino que pasa por cada arista de `G` una y sólo una vez.
* Un grafo orientado o digrafo, se dice euleriano si tiene un circuito orientado que pasa por cada arco de `G` una y sólo una vez.

### Problema del Cartero Chino (Guan, 1962)
* Definición: Dado un grafo `G=(V,X)` con longitudes asignadas a sus aristas, `l: X → (R≥0)`, el problema del cartero chino consiste en encontrar un circuito que pase por cada arista de `G` al menos una vez de longitud mínima.
	* Si `G` es euleriano, un circuito euleriano es la solución del problema del cartero chino.
	* Hay algoritmos polinomiales para el problema del cartero chino cuando `G` es orientado o no orientado.
	* Pero no se conocen algoritmos polinomiales (el problema no está computacionalmente resuelto) si el grafo es mixto (algunas aristas orientados y otros no).

### Grafos Hamiltonianos
* Un circuito en un grafo `G` es un circuito hamiltoniano si pasa por cada nodo de G una y sólo una vez.
* Un grafo se dice hamiltoniano si tiene un circuito hamiltoniano.
	* No se conocen buenas caracterizaciones para grafos hamiltonianos.
	* ¿Cómo intentar construir un circuito hamiltoniano?
	* No se conocen algoritmos polinomiales para decidir si un grafo es hamiltoniano o no.

### Metaheurísticas
* Tipos de heurísticas
	* Heurísticas clásicas.
	* Metaheurísticas o heurísticas “modernas”.
* ¿Cuándo usarlas?
	* Problemas para los cuales no se conocen buenos algoritmos exactos.
	* Problemas difíciles de modelar.
* ¿Cómo se evalúan?
	* Problemas test.
	* Problemas reales.
	* Problemas generados al azar.
	* Cotas.

### Problema del Viajante de Comercio (TSP)
* Definición: Dado un grafo `G=(V,X)` con longitudes asignadas a las aristas, `l: X → (R≥0)`, queremos determinar un circuito hamiltoniano de longitud mínima.
	* No se conocen algoritmos polinomiales para resolver el problema del viajante de comercio.
	* Tampoco se conocen algoritmos `ϵ-aproximados` polinomiales para el TSP general (si se conocen cuando las distancias son euclideanas).
	* Es el problema de optimización combinatoria más estudiado.

Teoremas sobre Grafos Eulerianos y Hamiltonianos
================================================

### Teorema de Euler
* **Teorema**: Un grafo (o multigrafo) conexo es euleriano si y sólo si
todos sus nodos tienen grado par. 

* **Teorema** (versión alterntiva): Son equivalentes, para G grafo o multigrafo conexo:
	* `G` es Euleriano.
	* Todo vértice de `G` tiene grado par.
	* Las aristas de `G` pueden particionarse en circuitos.

* A partir de la demostración del teorema de Euler se puede escribir un algoritmo para construir un circuito euleriano para un grafo que tiene todos sus nodos de grado par.

### Camino Euleriano
* **Teorema**: Un grafo o multigrafo conexo tiene un camino Euleriano si y sólo si
todos sus vértices tienen grado par salvo dos.

* **Teorema**: Un digrafo conexo es Euleriano si y sólo si para todo vértice `v` de
`G` se verfica que `din(v) = dout(v)`.

### Grafo Hamiltoniano
* **Teorema (condición necesaria)**: Sea `G` un grafo conexo. Si existe `W⊂V` tal que `G\W` tiene `c` componentes conexas con `c>|W|` entonces `G` no es hamiltoniano.
	* ¿Es cierta la recíproca de este teorema?
* **Teorema (Dirac) (condición suficiente)**: Sea `G` un grafo con `n≥3` y tal que para todo `v∈V` se verifica que `d(v)≥n/2` entonces `G` es hamiltoniano.

* Preguntas Frecuentes:
	* ¿Es cierta la recíproca de este teorema?
	* ¿Cómo intentar construir un circuito hamiltoniano?
	* ¿Se conocen algoritmos polinomiales para decidir si un grafo es hamiltoniano?