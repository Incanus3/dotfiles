set hlsearch
set incsearch
set ignorecase
set smartcase

set number
set mouse=a
set grepprg=ack
set scrolloff=3
set clipboard=unnamed
set background=dark
set laststatus=2
set textwidth=100
set updatetime=100
set signcolumn=yes
set backupcopy=no
set sidescrolloff=3
set display+=lastline
set formatoptions=tcrqj " see :h fo-table
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

set undodir=~/.vim/undodir
set undofile

set foldenable
set foldopen-=block
set foldmethod=syntax
set foldlevelstart=3

set splitbelow
set splitright

set completeopt=menu,longest,preview

set wildmode=longest,list:longest
set wildignore+=.git/**,coverage/**,tmp/**,**~

set nobackup
set nowritebackup

set winheight=3
set winwidth=65
set winminheight=3
set winminwidth=65

if $TERM != "linux"
  set noshowmode
  set cursorline
  set listchars=tab:▸\ ,eol:¬

  colorscheme palenight
  " colorscheme atelier-forest
  " colorscheme eighties
  " colorscheme material-darker
  " colorscheme onedark
  " colorscheme spacemacs
  " colorscheme summerfruit
endif

" set t_Co=256
" enable true color support - v terminalu vypada hrozne
" set termguicolors
" Set floating window to be slightly transparent, funguje jenom s termguicolors
" set winbl=10

" set tags+=gems.tags
