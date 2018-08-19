Árboles
=======

* Un **bosque** es un grafo sin circuitos simples.

* Un **árbol** es un grafo conexo sin circuitos simples.
	- Equivalentemente, un **árbol** es un bosque conexo.

* Una **hoja** es un nodo de grado 1.

* Un **árbol orientado** es un grafo orientado G tal que:
	1. Es un grafo acíclico dirigido.
	2. El grafo no orientado subyacente es un árbol.
	3. En G existe un nodo r tal que existe un camino orientado desde r a todos los demás nodos (cualquier nodo es alcanzable desde r por un camino orientado).

* En un **árbol no orientado** podemos definir un nodo cualquiera como raíz.
	* El **nivel de un nodo** de un árbol es la distancia de ese nodo a la raíz.
	* La **altura** `h` de un árbol es la longitud desde la raíz al nodo más lejano.
	* Un árbol se dice (exactamente) m-ario si todos sus nodos, salvo las hojas y la raíz tienen grado (exactamente) a lo sumo `m + 1` y la raíz (exactamente) a lo sumo `m`.
	* Un árbol se dice **balanceado** si todas sus hojas están a nivel `h` o `h − 1`.
	* Un árbol se dice **balanceado completo** si todas sus hojas están a nivel `h`.

* Los **nodos internos** de un árbol son aquellos que no son ni hojas ni la raíz.

* Dado un grafo `G`, un **árbol generador** de `G` es un subgrafo de `G` que es un árbol y tiene el mismo conjunto de nodos que `G`.
	- **Proposición**: Un grafo es conexo sí y sólo sí contiene un árbol generador.
	- **Proposición**: Dado un grafo `G` conexo, todo subgrafo `H⊆G` sin ciclos se encuentra contenido en al menos un Árbol Generador.
	
* Sea `T = (V, X)` un árbol y `l : X → R` una función que asigna longitudes (o pesos) a las aristas de `T`. Se define la **longitud** de `T` como `l(T) = ∑{e∈T} l(e)`

* Dado un grafo `G = (V, X)`, `T` un **árbol generador mínimo** de `G` es un árbol generador de `G` de mínima longitud, es decir, `l(T) ≤ l(T')` para todo `T'` árbol generador de `G`.

Teoremas sobre árboles
======================

* Lema 1: Sea `G = (V, X)` un grafo conexo y `e ∈ X`. `G∖e` es conexo si y solo si `e` pertenece a un circuito simple de `G`.

	=>) Sea G−e conexo, quiero ver que e pertenece a algún circuito simple de G. Supongo que e no pertenece a algún circuito de G. Esto equivale a afirmar que e es una arista puente, por lo que al removerla de G, la cantidad de componentes conexas debería aumentar. Absurdo, ya que como G−e es conexo, luego #c(G−e) = #c(G), y surge de suponer que e no pertenece a algún circuito de G. Luego, en particular, pertenece a algún circuito simple.

	<=) Sea e=(u,v)=eᵤᵥ la arista entre los nodos u y v, que pertenece a un circuito simple Cₑ en G. Quiero ver que G−e es conexo. Para ello, bastaría ver que todo camino simple entre dos nodos cualesquiera en G, que contenga a eᵤᵥ, puede ser reemplazado por otro camino (simple). En particular, dado cualquier camino simple Pᵢⱼ = (eᵢ ⋯ eᵤ eᵤᵥ eᵥ ⋯ eⱼ) = (Pᵢᵤ) + (eᵤᵥ) + (Pᵥⱼ) entre los nodos i,j∈V tal que contiene a eᵤᵥ, es decir está formado por la concatenación de tres caminos: un camino hasta u, la arista eᵤᵥ, y un camino desde v, este puede ser reemplazado por un camino Pᵢⱼ' formado por la concatenación de Pᵢᵤ, Pᵥᵤ y Pᵥⱼ, siendo Pᵥᵤ=Cₑ−eᵤᵥ el camino entre v y u surgido de sacarle la arista eᵤᵥ al circuito simple Cₑ. Es fácil ver que Pᵢⱼ' es un camino entre los nodos i, j.

* Lema 2: La concatenación de dos caminos distintos entre un par de vértices contiene un circuito simple.

	Sean los vértices u,v ∈ V, tal que u≠v, y los caminos P₁, P₂, ambos entre u y v, tal que P₁≠P₂. Quiero ver que P₁+P₂ contiene un circuito simple.

	Si P₁∩P₂ no coinciden en ningún nodo (excepto u y v), entonces P₁+P₂ es un circuito simple.

	En caso contrario, entonces en particular existe un subcamino en P₁, Q = (u ⋯ wₙ) formado por todos los nodos y aristas de P₁ desde u, hasta el primer nodo wₙ que exista en P₂. Asimismo, existe un subcamino en P₂, R = (u ⋯ wₙ) formado desde u hasta ese mismo nodo wₙ. Luego, Q+R es un circuito simple.

	Finalmente, la concatenación de P₁ y P₂ dos caminos distintos entre u y v, contiene un circuito simple.

Definición de Árbol
-------------------
* Dado un grafo `G = (V, X)`, son equivalentes:
	* (1) **Árbol**: `G` es conexo y sin circuitos simples.
	* (2) **Sin circuitos maximal**: `G` es un grafo sin circuitos simples, pero si se agrega una arista `e` a `G` resulta un grafo con exactamente un circuito simple que pasa por `e`.
	* (3) **Exactamente un camino**: Existe exactamente un camino simple entre todo par de nodos.
	* (4) **Conexo minimal**: `G` es conexo, pero si se quita cualquier arista a `G` queda un grafo no conexo.

	1 => 2) Sea G conexo y sin circuitos simples. Quiero ver que esto equivale a que G+e tenga exactamente un circuito simple, que pasa por e. Por LEMA 1, (G+e)−e = G es conexo ssi e pertenece a un circuito simple en G+e. Luego, como G no tiene circuitos simples, G+e tiene exactamente uno, y además pasa por e.

	2 => 3) Supongo que G es un grafo sin circuitos simples tal que G+e tiene exactamente un circuito simple que pasa por e. Supongo que no existe exactamente un camino simple entre todo par de nodos de G. En particular, existen dos nodos u,v tal que o bien no existe un camino, o bien existe más de uno. 

	Supongo que no existe un camino entre u y v, entonces u y v pertenecen a distintas componentes conexas de G, luego el grafo surgido de agregar una arista uniendo u y v no tiene un circuito que pase por esta arista, ya que sería una arista puente (uniendo dos componentes conexas distintas). Absurdo, ya que G es un grafo tal que al agregar e debe tener exactamente un circuito simple, que pase por e.

	Supongo que existe más de un camino entre u y v en G. Por LEMA 2, la concatenación de estos caminos contiene un circuito simple. Absurdo, ya que G no tiene circuitos simples.

	Luego, existe exactamente un camino simple entre todo par de nodos de G.

	3 => 4) Sea G tal que existe exactamente un camino simple entre todo par de nodos. Quiero ver que G es conexo, pero si se le quita cualquier arista deja de serlo. Que G es conexo vale trivialmente. Supongo que existe una arista e=(u,v) tal que al G−e sigue siendo conexo. En particular, eso significa que existe en G−e un camino simple entre u y v. Este camino es distinto al camino formado por la arista e, luego existirían en G dos caminos simples distintos entre u y v. Absurdo surgido de suponer que existe una arista tal que al removerla G sigue siendo conexo.

	4 => 1) Sea G conexo tal que para cualquier e, G−e no es conexo. Quiero ver que G es conexo y sin circuitos simples. Que G es conexo vale trivialmente. Supongo entonces que G tiene algún circuito simple, llamemoslo C. Sea e=(u,v) una arista de ese circuito, luego por LEMA 1 G−e es conexo. Absurdo, luego G no puede tener circuitos simples.

* Lema 3: Todo árbol no trivial tiene al menos dos hojas.
	
	Demostración 1) Dado que un arbol tiene m=n-1 aristas, la sumatoria de los grados de todos los nodos es 2m = 2n-2. Supongo que no existen hojas, luego todo nodo tiene grado al menos 2, por lo que la sumatoria de los grados de todos los nodos es mayor o igual a 2n, es decir 2n-2≥2n ⟺ 0≥2, absurdo. Supongo que existe una sola hoja, luego la sumatoria de los grados de todos los nodos que no son hojas es mayor o igual a 2(n-1) = 2n-2, por lo que la sumatoria de los grados de todos los nodos es mayor o igual a 2n-2 + 1 = 2n-1, lo cual nuevamenete es absurdo puesto que 2n-2 ≥ 2n-1 ⟺ 0≥1. Luego, la cantidad de hojas de cualquier árbol no trivial es al menos 2.

	Demostración 2) Usando la propiedad "todo grafo no trivial tiene al menos dos nodos que son puntos de corte", basta ver que cualquier nodo que no sea una hoja es un punto de corte.

* Lema 4: Sea `G = (V, X)` un árbol. Entonces `m = n − 1`.
	
	Inducción en n.

	Para n=1,2,3 vale.

	Quiero ver que si vale para menos de n vértices, entonces vale para n: sea T un árbol de n vértices. Sea eₖ=(vᵢ vⱼ) una arista que conecta los nodos vᵢ y vⱼ. Dado que G es un árbol, existe exactamente un camino simple entre todo par de nodos, luego en particular eₖ es el único camino simple entre vᵢ y vⱼ, por lo que es una arista puente (al removerla, la cantidad de componentes conexas aumenta). Luego, T−eₖ es un grafo con dos componentes conexas, y dado que T al ser un árbol no tiene circuitos simples, cada una de ellas no tiene circuitos simples, luego cada una es un árbol. Cada una de esas componentes conexas tiene menos de n nodos, por lo que para cada una de ellas vale la hipótesis inductiva: el número de aristas de cada una es uno menos que el número de nodos. Sean n₁ y n₂ tal que n=n₁+n₂, el número de vértices de cada componente conexa, luego el número de aristas de T−eₖ es (n₁-1)+(n₂-1) = (n₁+n₂)+(-2) = n-2. Finalmente, dado que T−eₖ tiene n-2 aristas, T tiene m=n-1 aristas.

Definición de Árbol (2)
-----------------------
* Dado un grafo G son equivalentes:
	* (1) **Árbol**: `G` es un árbol (`G` es conexo y sin circuitos simples).
	* (5) **Sin circuitos y cantidad de aristas**: `G` es un grafo sin circuitos simples y `m = n − 1`.
	* (6) **Conexo y cantidad de aristas**: `G` es conexo y `m = n − 1`.

	1 => 5) Sea G un árbol. Quiero ver que G no tiene circuitos simples, y que m = n - 1. Que no tiene circuitos simples vale trivialmente.

	TODO:

* Corolario 1: Sea `G = (V, X)` sin circuitos simples y `c` componentes conexas. Entonces `m = n − c`.

	Sean G₁,⋯,Gc⊆G las c componentes conexas de G. Cada componente conexa es un subgrafo conexo sin circuitos simples, es decir, un árbol. Luego, por definición, cada componente conexa i tiene mᵢ=nᵢ−1 aristas. Finalmente, m = ∑c(mᵢ) = ∑c(nᵢ−1) = ∑c(nᵢ) − c = n−c ⟺ m=n−c.

* Corolario 2: Sea `G = (V, X)` con `c` componentes conexas. Entonces `m ≥ n − c`.
	
	Sean G₁,⋯,Gc⊆G las c componentes conexas de G. Cada Gᵢ=(Vᵢ,Xᵢ) componente conexa, en particular, es un grafo conexo, por lo que contiene un arbol generador Tᵢ=(Vᵢ, XTᵢ) tal que XTᵢ⊆Xᵢ, por lo que |XTᵢ|≤|Xᵢ|=mᵢ. Dado que la cantidad de aristas de cada Tᵢ es |XTᵢ|=nᵢ−1, vale que mᵢ≥nᵢ−1. Finalmente, m = ∑c(mᵢ) ≥ ∑c(nᵢ−1) = ∑c(nᵢ) − c = n−c ⟺ m≥n−c.

Cantidad de aristas de un Árbol
-------------------------------
* Sea `G = (V, X)` arbol, entonces `m = n − 1`.
	
	Demostración: inducción en n.

	. n=1: trivial

	. n>1: tomo un arbol de tamaño `n`, por propiedad de árbol tiene al menos dos hojas. Le saco una hoja, por HI el árbol resultante tiene `m'=(n-1)-1`. Luego vuelvo a agregar la hoja que saqué, finalmente `m = (n-1)-1+1 = n-1`.

Árbol Generador
---------------
* Un grafo es conexo sí y sólo sí contiene un árbol generador.

	=>) Sea G=(V,X) conexo, luego existe al menos un camino entre cada par de nodos. Si G no tiene ciclos, entonces en particular es en sí mismo un árbol generador de G. Si G tiene ciclos, realizo el siguiente proceso: remuevo una arista de algún ciclo de G. El proceso termina, ya que en cada paso remuevo una arista de un conjunto finito de aristas. Eventualmente, me va a quedar grafo T=(V,X') con X'⊆X, conexo y sin ciclos (ya que una arista de un ciclo no puede ser una arista puente), es decir un árbol generador.

	<=) Sea G=(V,X) un grafo que contiene un árbol generador, es decir, existe T=(V,X') un subgrafo de G tal que X'⊆X, y T es conexo y sin ciclos. Dado que G se puede reconstruir agregando a T de forma sucesiva todas las aristas en X-X', y que agregar aristas no puede generar más componentes conexas, entonces G es conexo.

* Dado un grafo `G` conexo, todo subgrafo `H⊆G` sin ciclos se encuentra contenido en al menos un Árbol Generador.

	Sea G conexo. Sea H=(Vₕ,Xₕ)⊆G, H sin ciclos. Sea H'=(V, Xₕ)⊆G, el grafo tal que tiene el mismo conjunto de nodos que G, y el mismo conjunto de aristas que H, de lo que se desprende que H⊆H'. Si H' es conexo, en particular es un Árbol Generador, luego la afirmación vale. Si H' no es conexo, existen H'₁, H'₂, ..., H'ₙ ⊆ H' componentes conexas de H', y dado que H' no tiene ciclos en particular cada una de estas es un arbol. Dado que G es conexo, y que H' es subgrafo de G, existe en G para algún par de componentes conexas H'ᵢ H'ⱼ una arista e tal que va de un nodo de H'ᵢ a un nodo de H'ⱼ, de forma tal que el grafo H'ᵢⱼ = H'ᵢ ∪ H'ⱼ + e es un árbol (ya que es un grafo conexo y con m=n-1 aristas). Sea H'' = H'+e, entonces, el grafo surgido de agregar e a H', y tal que H'⊆H''. H'' tiene exactamente una componente conexa menos que H'. Aplico esta misma lógica sucesivamente hasta terminar con una sola componente conexa. El grafo resultante Hⁿ es conexo, no tiene ciclos, y tiene como conjunto de nodos a V, por lo que es un Àrbol Generador. Finalmente, vale que H⊆H'⊆H''⊆...⊆Hⁿ.

Árboles m-arios
---------------
* Lema 1: La cantidad de hojas de un árbol m-ario balanceado completo de altura `h` es mayor o igual a la cantidad de hojas de cualquier otro árbol m-ario de altura `h`.

	Por absurdo. Supongo que existe T un árbol de altura h tal que tiene k hojas, y tal que esta cantidad de hojas es mayor que las de un árbol balanceado completo de altura h. Dado que el arbol no es completo, existen hojas cuya altura es menor a h. Para cada una de estas hojas, le agrego m hijos, cada uno de los cuales van a ser hojas en el nuevo arbol. Repito este proceso hasta que no queden hojas de altura menor a h, formando el arbol T'. En particular, el arbol T' formado es un completo de altura h (ya que no puede tener hojas de altura distinta de h), y dado que el arbol T no era completo, la operación descripta se va a realizar al menos una vez, lo que me asegura que T' va a tener al menos (k+m-1)≥k hojas. Es decir, formé un completo de altura h tal que la cantidad de hojas es mayor o igual a k, lo cual es absurdo, y surge de suponer que existe un árbol de altura h cuya cantidad de hojas es mayor a la de un completo de altura h.

* Un árbol m-ario de altura `h` tiene a lo sumo `mʰ` hojas.

	Sea T=(V,X) un árbol m-ario de altura h. Por inducción sobre h:

	h=1: la cantidad de hojas es la cantidad de hijos de la raíz, a lo sumo m¹.

	h ⟹ h+1: sea Tₕ₊₁ un arbol de altura h+1. Le saco la raíz, formando a lo sumo k árboles, con k≤m. Cada uno de estos árboles tiene altura h, por lo que aplicando HI tienen a lo sumo mʰ hojas. Vuelvo a agregar la raíz. Luego, la cantidad de hojas es a lo sumo ∑ₖ(mʰ) = k(mʰ), y como k≤m, vale que k(mʰ) ≤ m(mʰ) = mʰ⁺¹, es decir, la cantidad de hojas es a lo sumo mʰ⁺¹.

* Si T es un árbol exactamente m-ario balanceado (completo) con `l` hojas, entonces `h = ⎡logₘ(l)⎤`.

	Por inducción en h.

	Caso base, h=0. 1 hoja, luego logₘ(1)=0.

	Caso inductivo, h⟹h+1. Sea T un arbol completo de altura h y l hojas, para el cual vale la HI, es decir h = ⎡logₘ(l)⎤. Para cada una de estas hojas, agrego m hijos. El arbol resultante es completo y tiene l' = m*l hojas, y altura h+1. Luego, ⎡logₘ(l')⎤ = ⎡logₘ(m*l)⎤ = ⎡logₘ(m)+logₘ(l)⎤ = ⎡1 + logₘ(l)⎤ = 1 + ⎡logₘ(l)⎤ = 1 + h. Finalmente, h+1 = ⎡logₘ(l')⎤.

* Un árbol m-ario con `l` hojas tiene `h ≥ ⎡logₘ(l)⎤`.

	Sea T un árbol m-ario con l hojas, de altura h. Sea T' el arbol completo de altura h, con l' hojas. Por lema 1 vale que l'≥l ⟺ logₘ(l')≥logₘ(l) ⟺ ⎡logₘ(l')⎤≥⎡logₘ(l)⎤. Y dado que en un árbol completo vale h = ⎡logₘ(l')⎤, vale h≥⎡logₘ(l)⎤.

Algoritmo de Prim
-----------------
* Lema: Sea `T = (V, XT)` un árbol generador de `G = (V, X)`. Si `e ∈ X`,
`e ∉ a XT` y `f ∈ XT` una arista del ciclo de `T + e`. Entonces `T' = (V, XT ∪ {e} \ {f})` es un árbol generador de G.

	Que T' sea árbol generador de G significa que es un árbol y que el conjunto de nodos es V. Esto último vale, así que resta ver que es un árbol. Para ver que es un árbol basta con ver que es conexo, y que la cantidad de aristas es m=n-1. Que tiene m=n-1 se desprende de que T tiene m=n-1 aristas, y T' surge de agregarle una arista y sacarle otra. Sea Tₑ=T+e, un grafo conexo (puesto que T es conexo) con exactamente un ciclo que pasa por e (por definición de árbol). Finalmente por lema 1, dado que Tₑ es conexo y tiene un ciclo que pasa por f, en particular T' = Tₑ−f es conexo.

* Proposición: Sea `G = (V,X)` un grafo conexo. Sea `Tk = (VTₖ, XTₖ)` el árbol que el algoritmo de Prim determina en la iteración `k`, para `0 ≤ k ≤ n − 1`. `Tₖ` es un subárbol de un árbol generador mínimo de `G`.

* Teorema: El algoritmo de Prim es correcto, es decir dado un grafo `G` conexo determina un árbol generador mínimo de `G`.