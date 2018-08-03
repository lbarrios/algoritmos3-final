Árboles
=======

* Un árbol es un grafo conexo sin circuitos simples.

* Una hoja es un nodo de grado 1.

* Un árbol orientado es un grafo orientado G tal que:
	1. Es un grafo acíclico dirigido.
	2. El grafo no orientado subyacente es un árbol.
	3. En G existe un nodo r tal que existe un camino orientado desde r a todos los demás nodos (cualquier nodo es alcanzable desde r por un camino orientado).

* En un árbol no orientado podemos definir un nodo cualquiera como raíz.
	* El nivel de un nodo de un árbol es la distancia de ese nodo a la raíz.
	* La altura `h` de un árbol es la longitud desde la raíz al nodo más lejano.
	* Un árbol se dice (exactamente) m-ario si todos sus nodos, salvo las hojas y la raíz tienen grado (exactamente) a lo sumo `m + 1` y la raíz (exactamente) a lo sumo `m`.
	* Un árbol se dice balanceado si todas sus hojas están a nivel `h` o `h − 1`.
	* Un árbol se dice balanceado completo si todas sus hojas están a nivel `h`.

* Los nodos internos de un árbol son aquellos que no son ni hojas ni la raíz.

* Dado un grafo `G`, un árbol generador de `G` es un subgrafo de `G` que es un árbol y tiene el mismo conjunto de nodos que `G`.

* Sea `T = (V, X)` un árbol y `l : X → R` una función que asigna longitudes (o pesos) a las aristas de `T`. Se define la longitud de `T` como `l(T) = sumatoria{e∈T} l(e)`

* Dado un grafo `G = (V, X)`, `T` un árbol generador mínimo de `G` es un árbol generador de `G` de mínima longitud, es decir, `l(T) ≤ l(T')` para todo `T'` árbol generador de `G`.

Teoremas sobre árboles
======================

* Lema 1: Sea `G = (V, X)` un grafo conexo y `e ∈ X`. `G∖e` es conexo si y solo si `e` pertenece a un circuito simple de `G`.
* Lema 2: La concatenación de dos caminos distintos entre un par de vértices contiene un circuito simple.

Definición de Árbol
-------------------
* Dado un grafo `G = (V, X)`, son equivalentes:
	* (1) **Árbol**: `G` es conexo y sin circuitos simples.
	* (2) **Sin circuitos maximal**: `G` es un grafo sin circuitos simples, pero si se agrega una arista `e` a `G` resulta un grafo con exactamente un circuito simple que pasa por `e`.
	* (3) **Exactamente un camino**: Existe exactamente un camino simple entre todo par de nodos.
	* (4) **Conexo minimal**: `G` es conexo, pero si se quita cualquier arista a `G` queda un grafo no conexo.

Definición de Árbol (2)
-----------------------
* Dado un grafo G son equivalentes:
	* (1) **Árbol**: `G` es un árbol.
	* (5) **Sin circuitos y cantidad de aristas**: `G` es un grafo sin circuitos simples y `m = n − 1`.
	* (6) **Conexo y cantidad de aristas**: `G` es conexo y `m = n − 1`.

* Lema 3: Todo árbol no trivial tiene al menos dos hojas.

* Lema 4: Sea `G = (V, X)` un árbol. Entonces `m = n − 1`.

* Corolario 1: Sea `G = (V, X)` sin circuitos simples y `c` componentes conexas. Entonces `m = n − c`.

* Corolario 2: Sea `G = (V, X)` con `c` componentes conexas. Entonces `m ≥ n − c`.

Cantidad de aristas de un Árbol
-------------------------------
* Sea `G = (V, X)` arbol, entonces `m = n − 1`.
	
	Demostración: inducción en n.

	. n=1: trivial

	. n>1: tomo un arbol de tamaño n y le saco una hoja; por HI el árbol resultante tiene m'=(n-1)-1, luego vuelvo a agregar la hoja que saqué, m = (n-1)-1+1 = n-1

Árboles m-arios
---------------
* Un árbol m-ario de altura `h` tiene a lo sumo `m*h` hojas.
* Un árbol m-ario con `l` hojas tiene `h ≥ techo[log_m(l)]`.
* Si T es un árbol exactamente m-ario balanceado entonces `h = techo[log_m(l)]`.

Algoritmo de Prim
-----------------

* Lema: Sea `T = (V, XT)` un árbol generador de `G = (V, X)`. Si `e ∈ X`,
`e no pertenece a XT` y `f ∈ XT` una arista del ciclo de `T + e`. Entonces `T' = (V, XT ∪ {e} \ {f })` es un árbol generador de G.

* Proposición: Sea `G = (V,X)` un grafo conexo. Sea `Tk = (VTk , XTk)` el árbol que el algoritmo de Prim determina en la iteración `k`, para `0 ≤ k ≤ n − 1`. `Tk` es un subárbol de un árbol generador mínimo de `G`.

* Teorema: El algoritmo de Prim es correcto, es decir dado un grafo `G` conexo determina un árbol generador mínimo de `G`.