set nocompatible

set mouse=a

set backspace=indent,eol,start

set signcolumn=yes

filetype on

filetype plugin on

filetype indent on

syntax on

set autoindent

set smartindent

set tabstop=4

set shiftwidth=4

set expandtab

set number

set relativenumber

set cursorline

set nobackup

set nowritebackup

set ignorecase

set smartcase

set hlsearch

set incsearch

set showmatch

set showcmd

set showmode

set clipboard=unnamedplus

set updatetime=300

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

inoremap jj <esc>

let mapleader = " "
let maplocalleader = " "

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

nnoremap n nzz
nnoremap N Nzz

nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

nnoremap G Gzz

inoremap <silent><C-a> <C-o>^
inoremap <silent><C-e> <C-o>$

set scrolloff=8

" Display different types of white spaces.
" set list
" set listchars=tab:›\ ,trail:•,extends:#,nbsp:.


" Encoding
set encoding=utf-8

" Plugins

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'github/copilot.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }
Plug 'mhinz/vim-startify'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'machakann/vim-highlightedyank'
Plug 'christoomey/vim-tmux-navigator'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jasonccox/vim-wayland-clipboard'

call plug#end()

" FZF
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :GFiles<cr>
nnoremap <leader>fb :Buffers<cr>
nnoremap <leader>fh :History<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fs :Rg<cr>

" Copilot

imap <silent><script><expr> <C-Y> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
imap <C-L> <Plug>(copilot-accept-word)

" NERDTree

nnoremap <leader>ee :NERDTreeToggle<cr>

" COC

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

" VimTeX

let g:vimtex_view_method = 'zathura_simple'

" Themes
set termguicolors
set bg=dark

" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_style = 'storm' " available: night, storm
" let g:tokyonight_enable_italic = 1
" let g:tokyonight_transparent_background = 1


let g:airline_powerline_fonts = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_transparent_bg = 1
set bg=dark
colorscheme gruvbox
highlight! link SignColumn LineNr


" colorscheme tokyonight
" colorscheme habamax
" colorscheme gruvbox
" hi Normal guibg=NONE ctermbg=NONE
" autocmd VimEnter * hi Normal ctermbg=none

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set noshowmode

let g:lightline = { 'colorscheme': 'gruvbox' }


" Move selected lines down
vnoremap <silent> J :m '>+1<CR>gv=gv

" Move selected lines up
vnoremap <silent> K :m '<-2<CR>gv=gv

" Join lines
nnoremap <silent> J mzJ`z

" Split line
nnoremap <silent> K mzi<CR><ESC>`z

" Move current line down
nnoremap <silent> <M-j> :m .+1<CR>==

" Move current line up
nnoremap <silent> <M-k> :m .-2<CR>==


let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
