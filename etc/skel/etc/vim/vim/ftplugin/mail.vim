" Vim filetype plugin file
" Language:      Plain text
" Maintainer:    Kai Wilke <kiste@netzworkk.de>
" Last Modified: 2016-10-18 19:48:06 CET
" License:       GNU GPL3


" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Don't use modelines in e-mail messages, avoid trojan horses
setlocal nomodeline

" many people recommend keeping e-mail messages 72 chars wide
setlocal textwidth=72

" Set 'formatoptions' to break text lines and keep the comment leader ">".
setlocal formatoptions=crqt12

setlocal autoindent

" Replace <Tab> with 4 spaces
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

" input_method is UTF-8
let b:input_method = "utf-8"

" Modeline {{{
" vim:set ts=4:
" vim600: fdm=marker fdl=0 fdc=3
" }}}

