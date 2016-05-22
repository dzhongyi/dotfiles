" ~/.vimrc

" SECTION: Plugins {{{
" --------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'godlygeek/tabular'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jiangmiao/auto-pairs'
Plugin 'klen/python-mode'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'plasticboy/vim-markdown'
Plugin 'airblade/vim-gitgutter'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dracula/vim'

call vundle#end()
filetype plugin indent on
" }}}

" SECTION: General Options {{{
" -----------------------------
" Colors {{{
syntax enable
syntax on
color dracula
set background=dark
" }}}

" Space & Tabs {{{
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartcase       " Case insensitive searches become sensitive with capitals
set smarttab        " sw at the start of the line, sts everywhere else
" }}}

" Folding {{{
set foldmethod=marker
set foldopen+=jump
nnoremap <space> za
" }}}

" UI Layout {{{
set nu
set showcmd         " Show (partial) command in status line.
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set showmatch       " Show matching brackets.
" }}}

" Searching {{{
set ignorecase
set incsearch       " Incremental search
set hlsearch        " High light search
" }}}

" Misc {{{
set nocompatible
set autoread
set autowrite       " Automatically save before commands like :next and :make
set shiftround
set backspace=2
set cmdheight=2
set history=200
set mouse=a
set mousehide
set scrolloff=3
set sidescrolloff=5
set laststatus=2
set backspace=indent,eol,start
set ttimeout
set ttimeoutlen=50
scriptencoding utf-8
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif
" }}}

" Crontab {{{
autocmd filetype crontab setlocal nobackup nowritebackup
" }}}
" }}}

" SECTION: Commands {{{
" ----------------------
command! -bar Invert :let &background = (&background=="light"?"dark":"light")
" }}}

" SECTION: Key Mappings {{{
" --------------------------
" Misc {{{
let mapleader=","
let g:mapleader=","
map <Leader>v :so ~/.vimrc<CR>
map <silent> <Leader>tn :Invert<CR>
nmap <silent> <leader>/ :nohlsearch<CR>
nnoremap Y y$
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
" noremap j gj
" noremap k gk
vnoremap < <gv
vnoremap > >gv
map zl zL
map zh zH
" }}}

" Emacs style ctrl+[AEFB] in insert mode {{{
inoremap <C-A> <ESC>I
inoremap <C-E> <ESC>A
inoremap <C-F> <ESC>la
inoremap <C-B> <ESC>i
" }}}

" Code folding options {{{
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>
" }}}

" Some helpers to edit mode {{{
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" }}}

" Git {{{
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gw :Gwrite<CR>
" }}}

" Tagbar {{{
nmap <leader>tt :Tagbar<CR>
" }}}
" }}}

" SECTION: Plugins Options {{{
" -----------------------------
" ultisnips {{{
" Trigger configuration.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-J>"
let g:UltiSnipsJumpBackwardTrigger="<C-K>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" nerdtree {{{
map <C-E> :NERDTreeToggle<CR>
map <Leader>e :NERDTreeFind<CR>
nmap <Leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
" }}}

" ctrlp {{{
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

if executable('ag')
  let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack-grep')
  let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
elseif executable('ack')
  let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
  let s:ctrlp_fallback = 'find %s -type f'
endif
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': s:ctrlp_fallback
      \ }

let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>
" }}}

" youcompleteme {{{
nnoremap <Leader>jd :YcmCompleter GoTo<CR>
let g:acp_enableAtStartup = 0
" enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1
" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
set completeopt-=preview
" }}}

" vim-go {{{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>co <Plug>(go-coverage)
" }}}

" python-mode {{{
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Don't load pylint code plugin
let g:pymode_lint = 1

" Don't load rope plugin
let g:pymode_rope = 0

let g:pymode_lint_ignore = "E501"
" }}}

" vim-airline {{{
"let g:airline_theme = 'solarized'
let g:airline_left_sep=''
let g:airline_right_sep=''
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
" }}}

" }}}

" SECTION: Fuctions{{{
" ---------------------
" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}
