#!/usr/bin/env bash

rm -f 999-todo_junto.md 999-todo_junto.pre.html

echo -e "[TOC]\n" > 999-todo_junto.md
cat 01-introduccion.md <(echo) <(echo) 02-grafos.md <(echo) <(echo) 03-arboles.md <(echo) <(echo) 04-camino-minimo.md <(echo) <(echo) 05-grafos-eulerianos-y-hamiltonianos.md <(echo) <(echo) 06-grafos-planares.md <(echo) <(echo) 07-coloreo.md <(echo) <(echo) 08-matching-conjunto-independiente-recubrimientos.md <(echo) <(echo) 09-flujo-maximo.md <(echo) <(echo) 10-complejidad-problemas-np-completos.md <(echo) <(echo) >> 999-todo_junto.md

sed -i 's/[ ]*```/```/g' 999-todo_junto.md

markdown_py -q -o "html5" -x markdown.extensions.toc -x markdown.extensions.tables -x markdown.extensions.fenced_code -x markdown.extensions.codehilite -x pymdownx.mark 999-todo_junto.md > 999-todo_junto.pre.html
#pygmentize -S default -f html > codehilite.css

echo "
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="./css/codehilite.css">
	<link rel="stylesheet" type="text/css" href="./css/github-markdown.css">
	<link rel="stylesheet" type="text/css" href="./css/custom.css">
	<style>
		.markdown-body {
			box-sizing: border-box;
			min-width: 200px;
			max-width: 980px;
			margin: 0 auto;
			padding: 45px;
		}

		@media (max-width: 767px) {
			.markdown-body {
				padding: 15px;
			}
		}
	</style>
</head>

<body>
	<article class="markdown-body">" > resumen.html

cat 999-todo_junto.pre.html >> resumen.html

echo "</article>
</body></html>" >> resumen.html

rm -f 999-todo_junto.md 999-todo_junto.pre.html
