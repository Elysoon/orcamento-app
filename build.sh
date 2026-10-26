#!/bin/sh
# Gera o index.html completo (GitHub Pages) a partir do app.html.
# Tudo que vem antes de <div id="app"> (título, metas, manifesto, estilos) vai para o <head>,
# senão o Chrome não acha o manifesto e não deixa instalar o app.
cd "$(dirname "$0")"
python3 - <<'PY'
s = open('app.html', encoding='utf-8').read()
i = s.index('<div id="app">')
head, body = s[:i], s[i:]
out = ('<!doctype html>\n<html lang="pt-BR">\n<head>\n<meta charset="utf-8">\n'
       '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
       '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>\n'
       + head + '</head>\n<body>\n' + body + '\n</body>\n</html>\n')
open('index.html', 'w', encoding='utf-8').write(out)
PY
