" File: strace.vim
" Maintainer:	Kai Wilke 'Kiste' <kiste@netzworkk.de>
" Version:		$Netzworkk: ~/etc/vim/vim/strace.vim,v 0.1.0 2016/10/10 10:48:25 Kiste Exp $
"
" Description: Source this file for removing some unimporting
"              lines from strace output.


:silent! execute 'g/^\(\d\+ \{1,2}\)\{0,1}brk/d'
:silent! execute 'g/^\(\d\+ \{1,2}\)\{0,1}rt_sig/d'
:silent! execute 'g/ELF/d'
:silent! execute 'g/^\(\d\+ \{1,2}\)\{0,1}time/d'
:silent! execute 'g/^\(\d\+ \{1,2}\)\{0,1}gettimeofday/d'
:silent! execute 'g/^\(\d\+ \{1,2}\)\{0,1}select/d'

" Modeline {{{
" vim:set ts=4:
" vim600:fdm=marker fdl=0 fdc=3
" }}}

