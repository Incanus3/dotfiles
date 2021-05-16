call plug#begin('~/.local/nvim/bundle')

" editing
Plug 'AndrewRadev/switch.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" display goodies
Plug 'airblade/vim-gitgutter'
Plug 'folke/todo-comments.nvim'
Plug 'folke/trouble.nvim'
Plug 'frazrepo/vim-rainbow'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'machakann/vim-highlightedyank'
Plug 'ryanoasis/vim-devicons'

if $TERM != "linux"
  " Plug 'itchyny/lightline.vim'
  Plug 'vim-airline/vim-airline'
endif

" language & framework support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/zim-syntax'

" files, windows, buffers, commands
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryvnf/readline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-eunuch'

" external integration
Plug 'benmills/vimux'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'

" colorschemes
" Plug 'chriskempson/base16-vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'drewtempelmeyer/palenight.vim'
Plug 'ghifarit53/tokyonight-vim'
" Plug 'gosukiwi/vim-atom-dark'
" Plug 'jacoborus/tender.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'kyoz/purify', { 'rtp': 'vim' }
" Plug 'rakr/vim-one'
Plug 'sainnhe/sonokai'
" Plug 'sonph/onehalf', {'rtp': 'vim/'}

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

call plug#end()
