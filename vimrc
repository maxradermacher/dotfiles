" This file is placed in the public domain.

" Set the leader to <space>
let mapleader = " "

set rtp+=/opt/homebrew/opt/fzf

" Highlight colors
syntax on

" Show line numbers in files
set number
set relativenumber

" Use one space after periods.
set nojoinspaces

" Characters to show when checking whitespace.
" These can be shown/hidden with `:set list`/`:set nolist`.
set listchars=tab:>-,space:∙

" Indent using tabs.
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Skip extensions when sorting
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'

" Highlight search results while typing
set incsearch
set hlsearch

" Show/hide whitespace
nnoremap <leader>l :set list!<CR>

" Show/hide spelling
nnoremap <leader>s :set spell!<CR>

" Open fuzzy find
nnoremap <leader>o :FZF<CR>

" Allow /// comments
set comments=s1:/*,mb:*,ex:*/,b:///,b://,b:#,:%,:XCOMM,n:>,fb:-

" Magical 72-character indentation
function IndentComment() range
	let old = &l:textwidth
	normal! ^t ll
	let &l:textwidth = virtcol('.') + 71
	normal! gvgq
	let &l:textwidth = old
endfunction
vnoremap <leader>q :call IndentComment()<CR>

" 'git show' the word under the cursor
nnoremap S "*yiw:!git show $(pbpaste)<CR>

" Indent using 4 spaces
nnoremap <leader>w :setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab<CR>

" File-specific options.
autocmd FileType crontab setlocal tabstop=8 shiftwidth=8 softtabstop=8 cc=
autocmd FileType gitcommit setlocal tw=72 cc=50,72
autocmd FileType markdown setlocal linebreak tw=72 cc=72
autocmd FileType python autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab cc=88
autocmd FileType rust setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType text setlocal linebreak
autocmd FileType yaml setlocal expandtab
