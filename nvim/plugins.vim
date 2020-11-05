call plug#begin('~/.local/nvim/bundle')

Plug 'airblade/vim-gitgutter'
Plug 'AndrewRadev/switch.vim'
Plug 'benmills/vimux'
Plug 'christoomey/vim-sort-motion'
Plug 'easymotion/vim-easymotion'
Plug 'frazrepo/vim-rainbow'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'machakann/vim-highlightedyank'
Plug 'mileszs/ack.vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/zim-syntax'
Plug 'wellle/targets.vim'
" Plug 'xolox/vim-easytags'

if $TERM != "linux"
  Plug 'itchyny/lightline.vim'
  Plug 'drewtempelmeyer/palenight.vim'
endif

" Plug 'chriskempson/base16-vim'
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

call plug#end()
