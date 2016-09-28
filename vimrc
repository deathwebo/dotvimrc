" .vimrc File

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)

Plugin 'scrooloose/nerdtree'
Plugin 'chriskempson/base16-vim'
Plugin 'ack.vim'
Plugin 'ctrlp.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'docteurklein/vim-symfony'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


syntax on

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner.
set ruler

"Want a different map leader than \
let mapleader = ","

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

"Set the color scheme. Change this to your preference. 
"Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
"set t_Cp=256
"colorscheme xoria256

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

let base16colorspace=256
set background=dark
set t_Co=16
colorscheme base16-monokai

"set guifont=Menlo\ for\ powerline:h20
set showmode

"Set font type and size. Depends on the resolution. Larger screens, prefer h20
set guifont=Hack:h15

"Tab stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set nonumber

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=15

"Better line wrapping 
set wrap
set textwidth=79
set formatoptions=qrn1

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

"Hide MacVim toolbar by default
set go-=T

"Hard-wrap paragraphs of text
nnoremap <leader>q gqip

"Enable code folding
set foldenable

"Hide mouse when typing
set mousehide

"Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf

" Create dictionary for custom expansions
set dictionary+=/Users/jeff_way/.vim/dict.txt

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Split windows below the current window.
set splitbelow              

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Load the current buffer in Firefox - Mac specific.
abbrev ff :! open -a firefox.app %:p<cr>

"Map a change directory to the desktop - Mac specific
nmap <leader>d :cd ~/Desktop<cr>:e.<cr>

"Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

"Change zen coding plugin expansion key to shift + e
let g:user_zen_expandabbr_key = '<C-e>'

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

"Saves time; maps the spacebar to colon
nmap <space> :

"Automatically change current directory to that of the file in the buffer
autocmd BufEnter * cd %:p:h

"Map code completion to , + tab
imap <leader><tab> <C-x><C-o>

" More useful command-line completion
set wildmenu

"Auto-completion menu
set wildmode=list:longest

"Map escape key to jj -- much faster
imap jj <esc>

"Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"------------------------"
"NERDTREE PLUGIN SETTINGS
"------------------------"
"Shortcut for NERDTreeToggle
nmap <leader>nt :NERDTreeToggle <CR>

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

"Helpeful abbreviations
iab lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
iab llorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

"Spelling corrects. Just for example. Add yours below.
iab teh the
iab Teh The

" Get to home dir easier
" <leader>hm is easier to type than :cd ~
nmap <leader>hm :cd ~/ <CR>

" Alphabetically sort CSS properties in file with :SortCSS
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

" Shortcut to opening a virtual split to right of current pane
" Makes more sense than opening to the left
nmap <leader>bv :bel vsp

" Saves file when Vim window loses focus
au FocusLost * :wa

" Easier file navigation
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

nnoremap B ^
nnoremap E $

set showmatch " show matching brackets

" print empty <a> tag
map! ;h <a href=""></a><ESC>5hi

set runtimepath^=~/.vim/bundle/ctrlp.vim
set mouse=a

"Silver Searcher integration
let g:ackprg = 'ag --nogroup --nocolor --column'

if executable('ag')
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command =
       \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
     let g:ctrlp_use_caching = 0
endif

"swp directory
set directory=/tmp

" CtrlP Settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
