" Name:          helpmenu.vim
" Last Modified: 2016-10-20 15:07:06
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
  if executable("boxes")
    amenu &Help.&Plugin.\ &boxes	:help boxes<CR>
  endif
  amenu &Help.&Plugin.\ &Gnupg	:help gnupg<CR>
  amenu &Help.&Plugin.\ &Kalender	:help calendar<CR>
  amenu &Help.&Plugin.\ &VBlockquote	:help VBlockquote<CR>
  an &Help.-sep4- <Nop>
  if executable("mutt")
    amenu &Help.&Programme.\ &Mutt	:help mutt<CR>
  endif
  if executable("translate")
    amenu &Help.&Programme.\ &Translate :! echo "übersetzt das Wort vom englischen ins deutsche.\nDazu muß der Curser auf dem 1. Buchstaben stehen."<CR>
  endif
endif

" vim600: set foldmethod=marker foldlevel=0 :
