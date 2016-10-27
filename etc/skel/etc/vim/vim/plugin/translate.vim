" Name:          translate.vim
" Last Modified: 2016-10-26 06:21:25
" Author:        Kai Wilke <kiste@netzworkk.de>
" Summary:       Vim plugin for translate - translates words from English
"                into German or viceversa
" URL:           http://www.netzworkk.de
" License:       GNU GPL3
" 
" ____________________________________________________________

" Please don't hesitate to correct my english :)

" check translate command to install{{{
if executable("translate")
  " Aufruf des Lexikons german to english
  noremap ,l yiw:!translate -l de-en -w <C-R>"<CR>
  " Aufruf des Lexikons english to german
  noremap ,li yiw:!translate -l de-en -i -w <C-R>"<CR>
  
  if (has("menu"))
    amenu <silent> Programme.Translate.\ de-en yiw:!translate -l de-en -w <C-R>"<CR>
    amenu <silent> Programme.Translate.\ en-de yiw:!translate -l de-en -i -w <C-R>"<CR>
  endif
endif

" vim600: set foldmethod=marker foldlevel=0 :
