" Name:          boxes.vim
" Last Modified: 2016-10-26 06:33:06
" Author:        Kai Wilke <kiste@netzworkk.de>
" Summary:       Vim plugin for boxes - textmode box- and comment drawing filter
" URL:           http://www.netzworkk.de
" License:       GNU GPL3
" 
" ____________________________________________________________

" Please don't hesitate to correct my english :)

" check boxes command to install{{{
if executable("boxes")
  " Call boxes - with some funny box-styles ;o)
  " Blick
  map ;0 <ESC>:'<,'>!boxes -d peek -a c -s 40x5<CR>
  " C_Box
  map ;1 <ESC>:'<,'>!boxes<CR>
  " C_Kommentar
  map ;2 <ESC>:'<,'>!boxes -d c-cmt<CR>
  " Kopfzeile
  map ;3 <ESC>:'<,'>!boxes -d headline<CR>
  " Hund
  map ;4 <ESC>:'<,'>!boxes -d dog -a c<CR>
  " simple
  map ;5 <ESC>:'<,'>!boxes -d simple -a jr<CR>
  " Zitat
  map ;6 <ESC>:'<,'>!boxes -d boxquote<CR>
  
  if (has("menu"))
    amenu <silent> Programme.boxes.\ Blick<TAB> :'<,'>!boxes -d peek -a c -s 40x5<CR>
    amenu <silent> Programme.boxes.\ C_Box<TAB> :'<,'>!boxes<CR>
    amenu <silent> Programme.boxes.\ C_Kommentar<TAB> :'<,'>!boxes -d c-cmt<CR>
    amenu <silent> Programme.boxes.\ Kopfzeile<TAB> :'<,'>!boxes -d headline<CR>
    amenu <silent> Programme.boxes.\ Hund<TAB> :'<,'>!boxes -d dog -a c<CR>
    amenu <silent> Programme.boxes.\ simple<TAB> 	:'<,'>!boxes -d simple -a jr<CR>
    amenu <silent> Programme.boxes.\ Zitat<TAB> :'<,'>!boxes -d boxquote<CR>
  endif
endif

" vim600: set foldmethod=marker foldlevel=0 :
