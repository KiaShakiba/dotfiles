" vimrc (last edited 2018)
" Kia Shakiba

execute pathogen#infect('bundle/{}')

set autoindent " copy indentation from previous line
set smartindent " auto-insert indents for some languages
set number " enable line numbers
set tabstop=4 " tabs appear as 4 spaces
set shiftwidth=4 " make an indent correspond to a single tab
set nocompatible " disable compatibility mode
set wrap! " don't wrap text
set so=999 " center cursor on screen if possible
set cursorline " highlight current cursor line
set incsearch " search as characters are entered
set noerrorbells visualbell t_vb= " disable error sounds
set completeopt-=preview

" Treat wrapped lines as unique lines when moving up or down
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

autocmd BufRead,BufNewFile *.txt,*.tex,*.bib setlocal wrap " wrap lines for certain file types
autocmd VimEnter * if !argc() | NERDTree | endif " open NERDTree if vim is run with no argument (i.e. no specific file)
autocmd BufWritePre * :%s/\s\+$//e " remove trailing spaces on save
autocmd BufRead,BufNewFile *.txt,*.tex,*.md setlocal spell spelllang=en " enable spell check for certain file types
autocmd GUIEnter * set visualbell t_vb= " disable error sounds

" Ensure the terminal supports all colours
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

let g:molokai_original=1
let g:loaded_matchparen=1
let g:ycm_use_clangd=0
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt=0
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swo$', '\.swp$', '\.aux$', '\.bbl$', '\.blg$', '\.dvi$', '\.fdb_latexmk$', '\.fls$']

colorscheme molokai
