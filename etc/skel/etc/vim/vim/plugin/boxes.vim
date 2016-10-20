" Name:          boxes.vim
" Last Modified: 2016-10-20 03:08:06
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
  map ;0 <ESC>:'<,'>!boxes<CR>
  map ;1 <ESC>:'<,'>!boxes -d boxquote<CR>
  map ;2 <ESC>:'<,'>!boxes -d peek -a c -s 40x5<CR>
  map ;3 <ESC>:'<,'>!boxes -d c-cmt<CR>
  map ;4 <ESC>:'<,'>!boxes -d dog -a c<CR>
  map ;5 <ESC>:'<,'>!boxes -d simple -a jr<CR>
  map ;6 <ESC>:'<,'>!boxes -d headline<CR>
  
  if (has("menu"))
    amenu <silent> Plugin.boxes.\ Blick<TAB> :'<,'>!boxes -d peek -a c -s 40x5<CR>
    amenu <silent> Plugin.boxes.\ C_Box<TAB> :'<,'>!boxes<CR>
    amenu <silent> Plugin.boxes.\ C_Kommentar<TAB> :'<,'>!boxes -d c-cmt<CR>
    amenu <silent> Plugin.boxes.\ Hund<TAB> :'<,'>!boxes -d dog -a c<CR>
    amenu <silent> Plugin.boxes.\ simple<TAB> 	:'<,'>!boxes -d simple -a jr<CR>
    amenu <silent> Plugin.boxes.\ Zitat<TAB> :'<,'>!boxes -d boxquote<CR>
  endif
endif

" vim600: set foldmethod=marker foldlevel=0 :
