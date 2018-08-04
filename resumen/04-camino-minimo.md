Camino Mínimo
=============

Definiciones
------------

Sea `G = (V, X)` un grafo y `l : X → R` una función de longitud/peso para las aristas de `G`.

* La longitud de un camino `C` entre dos nodos `v` y `u` es la suma de las longitudes de las aristas del camino: `l(C) = sum{e∈C} l(e)`

* Un camino mínimo `C^0` entre `u` y `v` es un camino entre `u` y `v` tal que `l(C^0) = min{l(C)|C es un camino entre u y v}`, es decir, para todo camino `C'`, `l(C^0) <= l(C')`.

* Pueden haber varios caminos mínimos.

* Se pueden definir tres variantes de problemas:
    * **Unico origen - único destino**: Determinar un camino mínimo entre dos vértices específicos, `v` y `u`.
    * **Unico origen - múltiples destinos**: Determinar un camino mínimo desde un vértice específico `v` al resto de los vértices de `G`.
    * **Múltiples orígenes - múltiples destinos**: Determinar un camino mínimo entre todo par de vértices de `G`.
    * Todos estos conceptos se pueden adaptar cuando se trabaja con un grafo orientado.

* **Aristas con peso negativo**: Si el grafo `G` no contiene ciclos de peso negativo o contiene alguno pero no es alcanzable desde `v`, entonces el problema sigue estando bien definido, aunque algunos caminos puedan tener longitud negativa. Sin embargo, si `G` tiene algún ciclo con peso negativo alcanzable desde `v`, el concepto de camino de peso mínimo deja de estar bien definido.

* **Circuitos**: Un camino mínimo no puede contener circuitos.

* **Propiedad de subestructura óptima de un camino mínimo**: Dado un digrafo `G = (V, X)` con una función de peso `l : X → R`, sea `P : v1 ... vk` un camino mínimo de `v1` a `vk`. Entonces `∀1 ≤ i ≤ j ≤ k`, el subcamino `P[vi,vj]` es un camino mínimo desde `vi` a `vj`.

Definición problema: "Camino Mínimo"
------------------------------------
* Dado `G = (V, X)` un grafo y `l : X → R` una función que asigna a cada arco una cierta longitud y `v ∈ V` un nodo del grafo, calcular los caminos mínimos de `v` al resto de los nodos.

Algoritmos
----------

### Algoritmo de Dijkstra

```
S := {v}
π(v) := 0

para todo u ∈ V hacer
    si (v, u) ∈ X entonces
        π(u) := l(v, u)
    si no
        π(u) := ∞
    fin si
fin para

mientras S != V hacer
    elegir w ∈ V \ S tal que π(w) = min{u∈V \S} π(u)
    S := S ∪ w

    para todo u ∈ V \ S y (w, u) ∈ X hacer
        si π(u) > π(w) + l(w, u) entonces
            π(u) := π(w) + l(w, u)
        fin si
    fin para
fin mientras

retornar π
```

### Algoritmo de Dijkstra (retorna camino mínimo)
```
S := {v}
π(v) := 0
pred(v) := 0

para todo u ∈ V hacer
    si (v, u) ∈ X entonces
        π(u) := l(v, u)
        pred(u) := v
    si no
        π(u) := ∞
        pred(w) := ∞
    fin si
fin para

mientras S != V hacer
    elegir w ∈ V \ S tal que π(w) = min{u∈V \S} π(u)
    S := S ∪ w

    para todo u ∈ V \ S y (w, u) ∈ X hacer
        si π(u) > π(w) + l(w, u) entonces
            π(u) := π(w) + l(w, u)
            pred(u) := w
        fin si
    fin para
fin mientras

retornar (π, pred)
```

### Algoritmo de Bellman-Ford
Asumimos que el grafo es orientado y no tiene circuitos de longitud negativa.
```
π(v) := 0

para todo u ∈ V \ {v} hacer
    π(u) := ∞
fin para

mientras hay cambios en π hacer
    π' := π

    para todo u ∈ V \ {v} hacer
        π(u) := min(
                    π(u), 
                    min{(w,u)∈X} π'(w) + l(w, u)
                )
    fin para
fin mientras

retornar π
```

Algoritmos Matriciales
----------------------
* Sea `G=({1,..., n}, X)` un digrafo y `l:X→R` una función de longitud/peso para las aristas de `G`.
    Definimos las siguientes matrices: 
    * `L ∈ R^{n×n}`, donde los elementos `l_ij` de `L` se definen como:
        * `l_{ij} = 0` si `i=j`
        * `l(i→j)` si `i→j ∈ X`
        * `∞` si `i→j ∉ X`
    * `D ∈ R^{n×n}`, donde los elementos `d_ij` de `D` se definen como:
        * `d_{ij} = longitud del camino mínimo orientado de i a j` si existe alguno
        * `∞` si no
* D es llamada matriz de distancias de G.

### Algoritmo de Floyd
Llamamos `v1,...,vn` a los nodos de `G`. El algoritmo de Floyd se basa en lo siguiente:

1. Si `L^0 = L` y calculamos `L^1` como
    * `l^1_{ij} = min(l^0_{ij}, l^0_{i1} + l^0_{1j})`
    `l^1_{ij}` es la longitud de un camino mínimo de `i` a `j` con nodo intermedio `v_1` o directo.

2. Si calculamos `L^k` a partir de `L^{k−1}` como
    * `l^k_{ij}= min(l^{k−1}_{ij}, l^{k−1}{ik} + l^{k−1}_{kj})`

    `l^k_{ij}` es la longitud del camino mínimo de `i` a `j` cuyos nodos intermedios están en `{v1, ..., vk}`

3. `D = L^n`

```
L^0 := L

para k desde 1 a n hacer
    para i desde 1 a n hacer
        si i ≠ k y l^{k−1}_{ik} ≠ ∞ entonces
            si l^{k-1}_{ik} + l^{k−1}_{ki} < 0 entonces
                retornar "Hay circuitos negativos."
            fin si
            para j desde 1 a n (si j ≠ k y j ≠ i) hacer
                l^k_{ij} := min(l^{k−1}_{ij}, l^{k-1}_{ik} + l^{k-1}_{kj})
            fin para
        fin si
    fin para
fin para

retornar L
```

### Algoritmo de Dantzig

```
para k desde 1 a n − 1 hacer
    para i desde 1 a k hacer
        L[i,k+1] := min{1≤j≤k} (L[i,j] + L[j,k+1])
        L[k+1,i] := min{1≤j≤k} (L[k+1,j] + [Lj,i])
    fin para

    t := min{1≤i≤k} (L[k+1,i] + L[i,k+1])
    
    si t < 0 entonces
        retornar "Hay circuitos de longitud negativa"
    fin si

    para i desde 1 a k hacer
        para j desde 1 a k hacer
            L[i,j] := min(L[i,j], L[i,k+1] + L[k+1,j])
        fin para
    fin para
fin para

retornar L
```

Teoremas sobre Camino Mínimo
============================

### Dijkstra
* **Lema**: Dado un grafo orientado `G` con pesos positivo en las aristas, al finalizar la iteración `k` el algoritmo de Dijkstra determina el camino mínimo entre el nodo `v` y los nodos de `Sk` (donde `Sk` es el conjunto `S` al finalizar la iteración `k`).

* **Teorema**: Dado un grafo orientado `G` con pesos positivos en las aristas, el algoritmo de Dijkstra determina el camino mínimo entre el nodo `v` y el resto de los nodos de `G`.

### Bellman-Ford
* **Lema**: Dado un grafo orientado `G=(V,X)` sin circuitos de longitud negativa, al finalizar la iteración `k` el algoritmo de Bellman-Ford determina el camino mínimo de a lo sumo `k` aristas entre el nodo `v` y el resto de los nodos de `V`.
* **Teorema**: Dado un grafo orientado `G=(V,X)` sin circuitos de longitud negativa, el algoritmo de Bellman-Ford determina el camino mínimo entre el nodo `v` y el resto de los nodos de `G`.

* Preguntas típicas:
    * ¿Cuál es la complejidad del algoritmo de Bellman-Ford?
    * ¿Qué pasa si aplicamos Bellman-Ford a un grafo no orientado?
    * Mejora del cálculo de `π`
    * ¿Cómo podemos modificar el algoritmo de Bellman-Ford para detectar si hay circuitos de longitud negativa?


### Algoritmo de Dantzig

* **Lema**: Al finalizar la iteración `k−1` del algoritmo de Dantzig, la matriz de `k×k` generada contiene la longitud de los caminos mínimos en el subgrafo inducido por los vértices `{v1,...,vk}`.
* **Teorema**: El algoritmo de Dantzig determina los caminos mínimos entre todos los pares de nodos de un grafo orientado sin circuitos.

* Preguntas típicas:
    * ¿Cuál es la complejidad del algoritmo de Dantzig?
    * ¿Qué diferencia tiene con el algoritmo de Floyd?
    * ¿Qué ventajas o desventajas tiene?