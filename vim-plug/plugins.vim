" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'vim-airline/vim-airline'
    Plug 'mg979/vim-xtabline'
    Plug 'kevinhwang91/rnvimr'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'psliwka/vim-smoothie'
    Plug 'mhinz/vim-startify'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'joshdick/onedark.vim'
    Plug 'tomasr/molokai'
    Plug 'sainnhe/sonokai'
    Plug 'morhetz/gruvbox'
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

