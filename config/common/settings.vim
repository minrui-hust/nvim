syntax enable

set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set ruler            			              " Show the cursor position all the time
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set nobackup                            " This is recommended by coc.
set nowritebackup                       " This is recommended by coc.
set termguicolors                       " Use gui color even in terminal

set mouse=a                             " Enable your mouse
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set laststatus=2                        " Always display the status line
set background=dark                     " Set background dark, seems only needed for vim

if $TMUX != ""                          " Show tabline only not in tmux
  set showtabline=0                       
else
  set showtabline=2
endif

set shortmess+=c                        " This is recommended by coc. Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " This is recommended by coc. Always show the signcolumn, or it will blink.
set updatetime=500                     " This is recommended by coc. Faster completion.
set timeoutlen=500                      " After how long which key menu will appear.
set clipboard=unnamedplus               " Copy paste between vim and everything else.
set jumpoptions=stack                   " Stack like but list like jump history

