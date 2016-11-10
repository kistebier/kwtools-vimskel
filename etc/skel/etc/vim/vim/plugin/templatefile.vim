"=============================================================================
" Vim global plugin for autoload template files
" File:			 templatefile.vim
" Last Modified: 2016-11-10 23:20:06
" Maintainer:	 Kai Wilke 'kiste' <kiste@netzworkk.de>
"
" Thanks:
" 	Scott Urban:	First version of templatefile.vim
" 		        	http://vim.sourceforge.net/scripts/script.php?script_id=198
"	Roland Lezuo:	<roland.lezuo AT chello.at> 
"	             	some suggestions	
"	Hojin Choi:		<pynoos AT naver.com>
"            		function TryLoadTemplateInUpperDir()
"	Lubomir Host:	Last Maintainer
"					rajo <rajo AT platon.sk>
" 
" Description: 
" 		Plugin load template file for new files
" 		Templates for new files aren't loaded, if g:load_templates == "no"
" 		if g:load_templates == "ask" you are asked before loading template
" 		If exists enviroment variable $VIMTEMPLATE, templates are loaded from
" 		this directory.

augroup TemplateSystem
	autocmd!
	au BufNewFile * call LoadTemplateFile()
augroup END

command! -nargs=0 LoadTemplateFile call LoadTemplateFile()
command! -nargs=1 LoadFile call LoadFile(<args>)

" escape special characters
function! Escape(str)
	return escape(a:str, '/\\')
endfunction

" Function LoadTemplateFile() {{{
function! LoadTemplateFile()
	if exists("g:load_templates")
		if g:load_templates == "no"
			return
		endif
	endif
	let extension = expand ("%:e")
	if extension == ""
		let template_file = "/templates/" . expand("%:t")
		let template_func = "TemplateFileFunc_noext_" . expand("%:t")
	else
		let template_file = "/templates/skel." . extension
		let template_func = "TemplateFileFunc_" . extension
	endif
	if filereadable(expand($VIMTEMPLATE . template_file))
		call LoadTemplateFileConfirm($VIMTEMPLATE . template_file)
	elseif TryLoadTemplateInUpperDir("skel." . extension)
		" I found a template file in an upper directory!
		pwd
	elseif filereadable(expand($HOME . "/.vim" . template_file))
		call LoadTemplateFileConfirm($HOME . "/.vim" . template_file)
	elseif filereadable(expand($VIM . template_file))
		call LoadTemplateFileConfirm($VIM . template_file)
	elseif filereadable(expand($VIMRUNTIME . template_file))
		call LoadTemplateFileConfirm($VIMRUNTIME . template_file)
	else
		" Template not found
	endif

	let date       = Escape(strftime("%Y-%m-%d"))
	let year       = Escape(strftime("%Y"))
	let cwd        = Escape(getcwd())
	let lastdir    = Escape(substitute(cwd, ".*/", "", "g"))
	let myfile     = Escape(expand("%:t:r"))
	let myfile_ext = Escape(expand("%"))
	let inc_gaurd  = Escape(substitute(myfile, "\\.", "_", "g"))
	let inc_gaurd  = Escape(toupper(inc_gaurd))
	if exists("g:author")
		let Author = Escape(g:author)
	else
		let Author = Escape("UNKNOWN AUTHOR")
	endif
	if exists("g:email")
		let Email  = Escape(g:email)
	else
		let Email  = Escape("UNKNOWN@undefined.net")
	endif
	if exists("g:company")
		let Company  = Escape(g:company)
	else
		let Company  = Escape("UNKNOWN Company")
	endif
	if exists("g:homepage")
		let Homepage  = Escape(g:homepage)
	else
		let Homepage  = Escape("UNKNOWN Homepage")
	endif

	silent! execute "%s/@DATE@/"          . date       . "/g"
	silent! execute "%s/@YEAR@/"          . year       . "/g"
	silent! execute "%s/@LASTDIR@/"       . lastdir    . "/g"
	silent! execute "%s/@FILE@/"          . myfile     . "/g"
	silent! execute "%s/@FILE_EXT@/"      . myfile_ext . "/g"
	silent! execute "%s/@PATH_SEP@/"      . path_sep   . "/g"
	silent! execute "%s/@INCLUDE_GAURD@/" . inc_gaurd  . "/g"
	silent! execute "%s/@AUTHOR@/"        . Author     . "/g"
	silent! execute "%s/@EMAIL@/"         . Email      . "/g"
	silent! execute "%s/@COMPANY@/"       . Company    . "/g"
	silent! execute "%s/@HOMEPAGE@/"      . Homepage   . "/g"
	if exists ("*" . template_func)
		if exists("g:load_templates")
			if g:load_templates == "ask"
				let choice = confirm("Call function " . template_func . "() ?:", 
							\ "&yes\n" .
							\ "&no\n")
				if choice == 1
					silent! execute ":call " . template_func . "()"
				endif
			elseif g:load_templates == "yes"
				silent! execute ":call " . template_func . "()"
			endif
		else
			silent! execute ":call " . template_func . "()"
		endif
	endif
	" delete last line - don't save deleted line into register
	" (use blackhole register '_')
	silent! execute 'normal G"_dd'
	" go to first line
	silent! execute "normal gg"
endfunction
" }}}

" Function <SID>_LoadFile(question, filename) {{{
function! <SID>_LoadFile(question, filename)
	if filereadable(expand(a:filename))
		if exists("g:load_templates")
			if g:load_templates == "ask"
				let choice = confirm(a:question .
							\ expand(a:filename) . " ?:", 
							\ "&yes\n" .
							\ "&no\n")
				if choice == 1
					silent execute "0r "  . a:filename
					setlocal modified
				endif
			elseif g:load_templates == "yes"
				silent execute "0r "  . a:filename
				setlocal modified
			endif
		else
			silent execute "0r "  . a:filename
			setlocal modified
		endif
	else
		echo "File " . expand(a:filename) . " not found!"
	endif
endfunction
" }}}

function! LoadTemplateFileConfirm(filename)
	call <SID>_LoadFile("NEW FILE! Load template file ", a:filename)
endfunction

function! LoadFile(filename)
	call <SID>_LoadFile("Load file ", a:filename)
endfunction

" function from Hojin Choi <pynoos AT naver.com>
" Function TryLoadTemplateInUpperDir(skelfile) {{{
fun! TryLoadTemplateInUpperDir(skelfile)
	let savewd = getcwd()
	while (getcwd() != "/")
		if filereadable(a:skelfile)
			call LoadTemplateFileConfirm(a:skelfile)
			execute "cd " . savewd
			return 1
		endif
		if filereadable("templates/" . a:skelfile)
			call LoadTemplateFileConfirm( "templates/" . a:skelfile)
			execute "cd " . savewd
			return 1
		endif
		cd ..
	endwhile
	execute "cd " . savewd
	return 0
endfun
" }}}

" example for no-extension file specific template processing
function! TemplateFileFunc_noext_makefile()
	let save_r = @r
	let @r = "all:\n\techo your template files need work"
	normal G
	put r
	let @r = save_r
endfunction

" Modeline {{{
" vim:set ts=4:
" vim600:fdm=marker fdl=0 fdc=3
" }}}

