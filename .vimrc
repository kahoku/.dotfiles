set runtimepath+=~/.vim,~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
"Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'taglist.vim'
"Plugin 'majutsushi/tagbar'
Plugin 'junegunn/vim-easy-align'
Plugin 'valloric/youcompleteme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'honza/vim-snippets'
Plugin 'sirver/ultisnips'
call vundle#end()    
filetype plugin indent on
set nocompatible

"change <Leader>  backslash(default) -> ;
let mapleader = ";"

source ~/.vim/config/easymotion.vimrc
source ~/.vim/config/syntastic.vimrc
source ~/.vim/config/titledet.vimrc
source ~/.vim/config/airline.vimrc
source ~/.vim/config/taglist.vimrc
"source ~/.vim/config/tagbar.vimrc
source ~/.vim/config/easyalign.vimrc
source ~/.vim/config/ctrlp.vimrc
source ~/.vim/config/ctrlp-funky.vimrc
source ~/.vim/config/ycm.vimrc
source ~/.vim/config/autopairs.vimrc
source ~/.vim/config/ultisnips.vimrc
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code specification config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai
set nu
set backspace=indent,eol,start
syntax enable
syntax on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set autoindent
set smartindent
set ignorecase 
set smartcase
set incsearch
set hls
set foldmethod=marker
"========== enviroment

set path+=**
set suffixesadd=.php,.js,.json
set complete-=i

set wildmenu
set wildmode=full
set wildignore=*.o,*.obj,*.bak,*.swp
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set laststatus=2
set statusline=%n:%<%f\ %y%m%r%=%-14.(%l,%c%V%)\ %P
set ttimeoutlen=50

"set tags=~/devspace/tags,tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:netrw_keepdir   = 0
let g:netrw_preview   = 1
let g:netrw_liststyle = 1
let g:netrw_winsize   = 30
let g:netrw_list_hide = '.*\.svn,nicaifu_.*@$'
let g:netrw_menu      = 0
let g:netrw_banner    = 0
let g:netrw_localcopycmd = "cp"
autocmd FileType netrw setl bufhidden=delete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast saving
"nnoremap <silent> <leader>ww :w<cr>
"nmap <silent> <leader>wf :w!<cr>
"Fast quiting
nnoremap <silent> <leader>q :q<cr>
"buffer
map <leader>d :bd<cr>
map <C-n> :bn<CR>
map <C-p> :bp<CR>
"tab
"map <leader>tp :tabp<cr>
"map <leader>tn :tabn<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
"map <leader>te :tabe 

"Smart way to move btw. windows
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
"window resize
nnoremap <leader>z <c-w>\|<c-w>_
nmap <tab>j 5<c-w>+
nmap <tab>k 5<c-w>-
nmap <tab>h 5<c-w><
nmap <tab>l 5<c-w>>
  
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-e> <End>
inoremap <C-a> <Home>

autocmd InsertLeave * write

vnoremap <  <gv
vnoremap >  >gv

map <leader>n :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Bash like
cnoremap <C-A>    <Home>
cnoremap <C-E>    <End>
cnoremap w!! w !sudo tee % > /dev/null
command! E Explore

"reference
"http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_2)
" TMUX  http://blog.jobbole.com/87584/
if exists('$TMUX')
    set term=screen-256color
endif

if exists('$ITERM_PROFILE')
    if exists('$TMUX') 
        let &t_SI = "<Esc>[3 q"
        let &t_EI = "<Esc>[0 q"
    else
        let &t_SI = "<Esc>]50;CursorShape=1x7"
        let &t_EI = "<Esc>]50;CursorShape=0x7"
    endif
endif
