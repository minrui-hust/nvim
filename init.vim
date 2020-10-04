"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" Plugin manager put plugins between plug#begin and plug#end
source $HOME/.config/nvim/config/plug/vim-plug.vim
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'mg979/vim-xtabline'
Plug 'voldikss/vim-floaterm'
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
Plug 'vim-scripts/DrawIt'
Plug 'haya14busa/vim-asterisk'
Plug 'easymotion/vim-easymotion'
Plug 'puremourning/vimspector'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
call plug#end()


" Global settings
source $HOME/.config/nvim/config/common/settings.vim
source $HOME/.config/nvim/config/common/mappings.vim
source $HOME/.config/nvim/config/common/functions.vim
source $HOME/.config/nvim/config/common/themes.vim


" Plugin specific settings
source $HOME/.config/nvim/config/plug/coc.vim
source $HOME/.config/nvim/config/plug/which-key.vim
source $HOME/.config/nvim/config/plug/xtabline.vim
source $HOME/.config/nvim/config/plug/start-screen.vim
source $HOME/.config/nvim/config/plug/floaterm.vim
source $HOME/.config/nvim/config/plug/fzf.vim
source $HOME/.config/nvim/config/plug/gitgutter.vim
source $HOME/.config/nvim/config/plug/markdown-preview.vim
source $HOME/.config/nvim/config/plug/vimspector.vim
source $HOME/.config/nvim/config/plug/vim-asterisk.vim
source $HOME/.config/nvim/config/plug/easymotion.vim
source $HOME/.config/nvim/config/plug/nvim-colorizer.vim

