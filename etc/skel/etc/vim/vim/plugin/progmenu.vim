" Name:          progmenu.vim
" Last Modified: 2016-10-26 06:32:06
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
  amenu <silent> Plugin.VBlockquote.\ normal<TAB> :'<,'>:call VBlockquote()<CR>
  amenu <silent> Plugin.VBlockquote.\ Titel<TAB> :'<,'>:call VBlockquote("")<CR>
endif

" Programm Menue
if exists("loaded_progmenu")
  aunmenu Programme
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
