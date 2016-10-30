" Vim filetype plugin file
" Language:      Zsh files
" Maintainer:    Kai Wilke <kiste@netzworkk.de>
" Last Modified: 2016-10-28 17:36:06 CET
" License:       GNU GPL3
"
" Verschiedene Schleifen
"
inoremap nif if [  ] ; then<CR><CR>fi<ESC>--5li
inoremap nwhile while [  ] ; do<CR><CR>done<ESC>--8li
inoremap nfor for i in  ; {<CR><CR>}<ESC>--9li
inoremap ncase case  in<CR>*)<CR>;;<CR>esac<ESC>3-5li
"
"
"autocmd BufWritePost /home/kiste/cvs/scripts/kwtools/* !cvs ci %

" input_method is UTF-8
let b:input_method = "utf-8"

" Modeline {{{
" vim:set ts=4:
" vim600: fdm=marker fdl=0 fdc=3
" }}}

