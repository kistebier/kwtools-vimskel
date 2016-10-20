" File: csyntax.vim
" Maintainer:	Kai Wilke 'Kiste' <kiste@netzworkk.de>
" Last Change: 2016/10/10
" Version: $Netzworkk: ~/etc/vim/vim/csyntax.vim,v 0.1.0 2016/10/10 10:46:51 Kiste Exp $
"
" Description: Source this file while editing C source code
"              for better formating.

:silent! execute "%s/} else/}else/gc"
:silent! execute "%s/\([ 	]\+\)if(/\1if (/gc"
:silent! execute "%s/\([ 	]\+\)for(/\1for (/gc"
:silent! execute "%s/\([ 	]\+\)switch(/\1switch (/gc"
:silent! execute "%s/\([ 	]\+\)while(/\1while (/gc"
:silent! execute "%s/[ 	]\+$//gc"
:silent! execute "%s/[^ 	]==[^ 	]/ == /gc"
