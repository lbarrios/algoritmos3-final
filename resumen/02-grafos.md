Grafos
======

* Un grafo `G = (V, E)` o `G = (V, X)` son dos conjuntos
    * `V` un conjunto de nodos, vértices o puntos.
        * `n = |V|`
    * `E` o `X` un conjunto de aristas, ejes o arcos.
        * `m = |E|`

* Una arista `e = (u,v)` es un par no ordenado de nodos.

```
Ejemplo de grafo etiquetado: 
G=({v1,v2,v3,v4},{e1=(v1,v2),e2=(v2,v4),e3=(v3,v2),e4=(v4,v3)})

       e1          e2
v1 --------- v2 -------- v4
               \        /
             e3 \      / e4
                 \    /
                   v3

```

* Dado `G=(V,E)`, `u,v,w ∈ V`, `e=(u,v),f=(v,w) ∈ E`, entonces
    * al estar unidos por `e`, `u` y `v` son **nodos adyacentes**
    * `e` es **incidente** a `u` y `v`
    * al compartir el nodo `v`, `e` y `f` son **aristas adyacentes**

* Un **multigrafo** es un grafo en el que pueden haber varias aristas entre sí.
```
Ejemplo de multigrafo: 
e1=(v1, v2), e3=(v1, v2), pero e1!=v2
     
     e1          e2
v1 ------- v2 ------- v3
  \       /
   \-----/
     e3
```

* Un **seudografo** es un grafo en el que pueden haber loops que unan a un nodo con sí mismo.
```
Ejemplo de multigrafo: 
e4=(v3,v3)
     
     e1          e2     /--\
v1 ------- v2 ------- v3    | e4
  \       /             \--/
   \-----/
     e3
```

* Un **digrafo** o **grafo dirigido** es aquel en donde las aristas son pares ordenados de nodos. Dicho de otro modo, las aristas tienen dirección.

```
     e1         e2
v1 ------> v2 ------> v3
 \         |         /
  \        / e4     /
e5 \      |        / e3
    \     V       /
     --> v4 <-----

```

* El **grado** de un nodo `v` (`d(v)`), es la cantidad de aristas incidentes a `v`.

* Un grafo `K` se dice **completo** (`K_n`) si todos los nodos son adyacentes entre sí.
  * Obs: un `K_n` tiene `2*n` aristas.

* Dado un grafo `G = (V, E)`, el grafo complemento tiene el mismo conjunto de nodos y para cada par de nodos en `G'` son adyacentes si y solo si no son adyacentes en `G`. Notación: `G'`, `G^c` o `G^_` es el grafo complemento de `G`.
  * Obs: Si `G` tiene `n` nodos y `m` aristas, `G'` tiene `n` nodos y `(2n-m)` aristas.

* Un **camino** en un grafo es una sucesión de aristas `e1 e2 ... ek` tal que un extremo de ei coincide con uno de `ei−1` y el otro con uno de `ei+1` para `i=2,...,k-1`.
  * Un camino simple es un camino que no pasa dos veces por el mismo nodo.
  * Un circuito es un camino que empieza y termina en el mismo nodo.
  * Un circuito simple es un circuito de 3 o más nodos que no pasa dos veces por el mismo nodo.

* La longitud de un camino es la cantidad de aristas que tiene ese camino.

* La distancia entre dos nodos `v` y `w` (`d(v,w)`) se define como la longitud del camino más corto de `v` a `w`.
    * Para todo nodo `v`, `d(v,v) = 0`.
    * Si no existe camino entre `v` y `w`, se dice que `d(v,w)=∞` (distancia infinita).

* La función de distancia cumple las siguientes propiedades para todo u, v, w pertenecientes a V:
    * d(u, v) = 0 si y sólo si u = v.
    * d(u, v) = d(v, u).
    * d(u, w) ≤ d(u, v) + d(v, w).

* Un grafo se dice conexo si existe un camino entre todo par de nodos.

* Dado un grafo `G = (V, X)`, un subgrafo de G es un grafo `H = (V0, X0)` tal que `V0 ⊆ V` y `X0 ⊆ X ∩ (V0 × V0)`.

* Un subgrafo `H = (V0, X0)` de `G = (V, X)`, es un subgrafo inducido si para todo par de nodos `u, v ∈ V0`, `(u, v) ∈ X ⇐⇒ (u, v) ∈ X0`.

* Una componente conexa de un grafo `G` es un subgrafo conexo maximal de `G`.

* Un grafo `G = (V, X)` se dice bipartito si existe una partición V1, V2 del conjunto de nodos V tal que:
  * `V = V1 ∪ V2`
  * `V1 ∩ V2 = ∅`
  * `V1 != ∅` 
  * `V2 != ∅`
  * Todas las aristas de `G` tienen un extremo en `V1` y otro en `V2`.

* Un grafo bipartito con partición `V1, V2`, es biparito completo si todo nodo en `V1` es adyacente a todo nodo en `V2`.


* Dados dos grafos `G = (V, X)` y `G0 = (V0, X0)` se dicen isomorfos si existe una función biyectiva `f : V → V0` tal que para todo `v, w ∈ V`: `(v,w) ∈ X ⇐⇒ (f (v), f (w)) ∈ X0`.

Si dos grafos `G = (V, X)` y `G0 = (V0, X0)` son isomorfos, entonces
  * tienen el mismo número de nodos,
    * para todo `k`, `0 ≤ k ≤ n − 1`, tienen el mismo número de nodos de grado `k`,
  * tienen el mismo número de aristas,
    * para todo `k`, `1 ≤ k ≤ n − 1`, tienen el mismo número de caminos simples de longitud `k`.
  * tienen el mismo número de componentes conexas,

* Matriz de adyacencia: `A ∈ R^{n×n}`, donde los elementos `a_ij` de `A` se definen como `1` si `G` tiene una aristas entre los nodos `i` y `j`, o `0` si no.

* Matriz de incidencia: `B ∈ R^{m×n}`, donde los elementos `b_ij` de `B` se definen como `1` si la arista `i` es incidente al nodo `j`, o `0` si no.

* Un grafo orientado o digrafo `G = (V, X)` es un par de conjuntos `V` y `X` donde `V` es el conjunto de puntos, nodos o vértices y `X` es un subconjunto del conjunto de los pares
ordenados de elementos distintos de V.
  * El grado de entrada `din(v)` de un nodo `v` de un grafo
orientado es la cantidad de arcos que llegan a `v`. Es decir, la
cantidad de arcos que tienen a `v` como segundo elemento.
  * El grado de salida `dout(v)` de un nodo `v` de un grafo
orientado es la cantidad de arcos que salen de `v`. Es decir, la
cantidad de arcos que tienen a `v` como primer elemento.

* Un camino orientado en un grafo orientado es una sucesión de arcos `e1 e2 ... ek` tal que el primer elemento del par `ei` coincide con el segundo de `ei−1` y el segundo elemento de `ei` con el primero de `ei+1`, para `i = 2,..., k − 1`.
  * Un cicuito orientado en un grafo orientado es un camino orientado que comienza y termina en el mismo nodo.
  * Un digrafo se dice fuertemente conexo si para todo par de nodos `u, v` existe un camino orientado de `u` a `v` y otro de `v` a `u`.

Teoremas sobre Grafos
=====================

### Grado
* La suma de los grados de los nodos de un grafo es igual a 2 veces el número de aristas.

    Sea G=(V,X) un grafo. Sea m=|X|. Quiero probar que sum(v∈V) d(v) = 2m.
    Voy a hacer inducción sobre la cantidad de aristas.
    
    P(m): sum(v∈V) d(v) = 2m para todo m natural.
    
    Caso base: P(1): sum(v∈V) d(v) = 2
      Grafo:
                e1
            v1 ---- v2
      
      d(v1) + d(v2) = 2

    Supongo que vale P(m): sum(v∈V) d(v) = 2m, qvq vale P(m+1): sum(v∈V) d(v) = 2(m+1).
    Sea G' = (V,X') tal que |X'|=m+1.
    Sea G = (V,X), tal que X = X'\e con e=(v1,v2)∈X', y |X| = m.
    Aplicando HI, se obtiene que sum(v∈V) d(v) = 2m en G.
    Dado que e no pertenece a X, en particular v1 y v2 no son adyacentes en G, por lo que cada uno suma 1 a su grado en la sumatoria. Luego, sum(v∈V) d(v) = 2m + 2 en G'.

### Distancia
* Si un camino P entre v y w tiene longitud d(v,w), P debe ser un camino simple.

    Sea G(V,X) un grafo, sean v,w ∈ V, sea (v u1 ... uk-1 w) algún camino mínimo de v a w, de largo d(v,w)=k. Sea P un camino entre v y w de longitud k (es decir, es un camino mínimo), quiero ver que es un camino simple.

    Supongo que P no es un camino simple, luego existe en el recorrido de P un circuito simple C ⊆ P, con |C|>=1, que en particular comienza y termina en un nodo ux, de forma tal que P = P1 U C U P2, en donde P1 es un camino que comienza en v y termina en ux, y P2 es un camino que comienza en ux y termina en w.

    Sea P' = P\C el resultado de sacar las aristas de C en P. Luego, P' = P1 U P2 = (v ... ux ... w)es un camino de v a w de largo |P'| = |P1| + |P2| < |P| = k, es decir, un camino menor al mínimo. Lo cual es una contradicción surgida de suponer que P no es un camino simple.

### Bipartitos
* Un grafo G con 2 o más nodos es bipartito si y sólo si no tiene circuitos simples de longitud impar.
    
    Sea G=(V,X) un grafo con |V|>=2:

    =>) Supongo que G es bipartito, con {V1, V2} la partición de nodos definida por el grafo. Quiero ver que G no tiene circuitos simples de longitud impar.
    Supongo que existe C=(v w1 ... w_k v) con k>=2 y k par un circuito simple de longitud impar en G. Sin pérdida de generalidad, asumo que v pertenece a V1. Luego, por definición del grafo, debe valer que w1 pertenece a V2, w2 pertenece a V1, y en general para cada w_i, este pertenece a V1 si i es par, y a V2 si i es impar. En particular, como k es par w_k pertenece a V1. Luego, v pertenece a V2, lo cual es absurdo, y surge de suponer que existe un circuito simple de longitud impar.

    <=) Supongo que G no tiene circuitos simples de longitud impar. Quiero ver que G es bipartito, es decir, puedo formar {V1, V2} una partición de nodos tal que los nodos de cada partición no sean adyacentes entre sí.
    
    Sin pérdida de generalidad, asumo que G es conexo (si G no es conexo, aplico el mismo procedimiento para cada componente conexa, formando V1 = U_i V1_i y V2 = U_i v2_i). 

    Tomo un nodo arbitrario u. Defino los conjuntos {V1, V2} mediante el siguiente proceso. Tomo un nodo u, y lo agrego a V1. Luego agrego todos los vecinos de u a V2. Luego agrego todos los vecinos de estos a V1, y así hasta terminar. Como el grafo es finito, este procedimiento termina. Para ver que V1 y V2 forman una bipartición de G, restaría ver que para todo para todo v, o bien pertenece a v1, o bien pertenece a v2. Supongo que existe w tal que w pertenece a V1 y w pertenece a V2. En particular, existe un camino de u a w, de longitud par, y un camino distinto de u a w, de longitud impar, y la unión de ambos caminos contiene un circuito simple de longitud impar, lo cual es absurdo y surge de suponer que existe un nodo que pertenece a ambos conjuntos; luego, el grafo es bipartito.

### Matriz de Adyacencia
* Si `A` es la matriz de adyacencia del grafo `G`, el elemento `a^{k}_{ij}` de `A^k` es igual a la cantidad de caminos de longitud `k` entre los nodos `i` y `j`.
  * Corolario: `a^{2}_{ii} = d(vi)`.