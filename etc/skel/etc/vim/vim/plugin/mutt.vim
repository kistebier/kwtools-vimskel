" Name:          mutt.vim
" Last Modified: 2016-10-26 06:33:25
" Author:        Kai Wilke <kiste@netzworkk.de>
" Summary:       Vim plugin for mutt - text-based Mail User Agent
"                into German or viceversa
" URL:           http://www.netzworkk.de
" License:       GNU GPL3
" 
" ____________________________________________________________

" Please don't hesitate to correct my english :)

" check mutt command to install{{{
if executable("mutt")
  " Aufruf von mutt innerhalb vim
  noremap ;m :!mutt<CR>
  
  if (has("menu"))
    amenu <silent> Programme.Mutt\ (mail) :! xterm -T gvim-mutt -geometry ${COLUMNS}x${LINES} -e mutt &<CR>
  endif
endif

" vim600: set foldmethod=marker foldlevel=0 :
