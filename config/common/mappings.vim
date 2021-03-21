" Basic Key Mappings

" global Leader
let mapleader=' '

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" <TAB>: completion.
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l


" Terminal window navigation
" tnoremap <C-S-h> <C-\><C-N><C-w>h
" tnoremap <C-S-j> <C-\><C-N><C-w>j
" tnoremap <C-S-k> <C-\><C-N><C-w>k
" tnoremap <C-S-l> <C-\><C-N><C-w>l
" inoremap <C-S-h> <C-\><C-N><C-w>h
" inoremap <C-S-j> <C-\><C-N><C-w>j
" inoremap <C-S-k> <C-\><C-N><C-w>k
" inoremap <C-S-l> <C-\><C-N><C-w>l
" tnoremap <C-S-n> <C-\><C-n>

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -5<CR>
nnoremap <silent> <M-k>    :resize +5<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" shift + y, shift + p operate on system clipboard
nnoremap Y "+y
nnoremap P "+p

" Disable ZZ to quit, easy mixture with zz
nnoremap ZZ <NOP>

" This is reduandent to what is in which-key.
" However, without this, the popup menu of which-key 
"   would popup immediately without delay.
" Which-key may need at least one raw mapping defined other where?
nnoremap <leader>. :<C-U>e $MYVIMRC<CR>

