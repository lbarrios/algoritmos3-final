Grafos
======

* Un grafo `G = (V, E)` son dos conjuntos
    * V un conjunto de nodos, vértices o puntos.
        * n = |V|
    * E un conjunto de aristas, ejes o arcos.
        * m = |E|

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

* Dado `G=(V,E)`, `u,v ∈ V`, `e=(u,v) ∈ E`, entonces
    * `u` y `v` son **adyacentes**
    * `e` es **incidente** a `u` y `v`

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