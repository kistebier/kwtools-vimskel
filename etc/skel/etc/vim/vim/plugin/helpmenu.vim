" Name:          helpmenu.vim
" Last Modified: 2016-10-24 05:58:06
" Author:        Kai Wilke <kiste@netzworkk.de>
" Summary:       Gvim additional menu configuration file
" URL:           http://www.netzworkk.de
" License:       GNU GPL3
" 
" ____________________________________________________________

" Please don't hesitate to correct my english :)

" Section: Menu {{{

if exists("loaded_helpmenu")
  aunmenu Hilfe
endif

" Hilfe Menue
if (has("menu"))
  an &Help.-sep3- <Nop>
  amenu &Help.&Plugin.\ &Gnupg	:help gnupg<CR>
  amenu &Help.&Plugin.\ &Kalender	:help calendar<CR>
  amenu &Help.&Plugin.\ &VBlockquote	:help VBlockquote<CR>
  an &Help.-sep4- <Nop>
  if executable("boxes")
    amenu &Help.&Programme.&boxes	:help boxes<CR>
  endif
  if executable("mutt")
    amenu &Help.&Programme.&Mutt	:help mutt<CR>
  endif
  if executable("translate")
    amenu &Help.&Programme.&Translate :help translate<CR>
  endif
endif

" vim600: set foldmethod=marker foldlevel=0 :
