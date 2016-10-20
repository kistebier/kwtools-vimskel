" Name:          progmenu.vim
" Last Modified: 2016-10-20 03:31:06
" Author:        Kai Wilke <kiste@netzworkk.de>
" Summary:       Gvim additional menu configuration file
" URL:           http://www.netzworkk.de
" License:       GNU GPL3
" 
" ____________________________________________________________

" Please don't hesitate to correct my english :)

" Section: Menu {{{

if (has("menu"))
  amenu <silent> Plugin.Kalender.\ vertikal	:Calendar<CR>
  amenu <silent> Plugin.Kalender.\ horizental	:CalendarH<CR>
  amenu <silent> Plugin.VBlockquote.\ Title<TAB> :'<,'>:call VBlockquote("")<CR>
  amenu <silent> Plugin.VBlockquote.\ Zitat<TAB> :'<,'>:call VBlockquote()<CR>
endif

" Programm Menue
if exists("loaded_progmenu")
  aunmenu Programme
endif
" einzelne Programme
"
if (has("menu"))
  if executable("mutt")
    amenu &Programme.\ &Mutt\ (mail) :! xterm -T gvim-mutt -geometry ${COLUMNS}x${LINES} -e mutt &<CR>
  endif
  if executable("translate")
    amenu &Programme.\ &Translate.\ de-en yiw:!translate -l de-en -w <C-R>"<CR>
    amenu &Programme.\ &Translate.\ en-de yiw:!translate -l de-en -i -w <C-R>"<CR>
  endif
endif


" Tools.Spelling Menu
if has("spell")
  an 40.335.151 &Tools.&Spelling.Wort\ hinzufügen<Tab>zg zg
  an 40.335.152 &Tools.&Spelling.Wort\ intern\ hinzufügen<Tab>zG zG
  an 40.335.153 &Tools.&Spelling.Wort\ entfernen<Tab>zw zw
  an 40.335.154 &Tools.&Spelling.Wort\ intern\ entfernen<Tab>zW zW
  an 40.335.201 &Tools.&Spelling.Set\ language\ to\ "de"    :set spl=de spell<CR>
endif

" vim600: set foldmethod=marker foldlevel=0 :
