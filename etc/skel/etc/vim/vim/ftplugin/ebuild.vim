" Vim filetype plugin file
" Language:      Ebuild (Gentoo Linux)
" Maintainer:    Kai Wilke <kiste@netzworkk.de>
" Last Modified: 2016-10-18 20:44:06 CET
" License:       GNU GPL3


" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

" input_method is UTF-8
let b:input_method = "utf-8"

" Official Gentoo Linux Developers HOWTO is by
" http://devmanual.gentoo.org/

setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

" Modeline {{{
" vim:set ts=4:
" vim600:fdm=marker fdl=0 fdc=3
" }}}

