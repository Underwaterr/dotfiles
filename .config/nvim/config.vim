
" Turn on & off line numbers with Ctrl+n
nnoremap <C-n> :set relativenumber!<CR>

" Dim the 'end of buffer' tildes
highlight EndOfBuffer ctermfg=black ctermbg=black

" no more automatic comments!!
autocmd FileType * set formatoptions-=cro

" typing 'help' expands to 'tab help'
cabbrev help tab help

" Shift+Escape in Normal Mode to enter Visual Block mode
nnoremap <S-ESC> <C-v>

" leader key stuff
let g:mapleader=';'
nnoremap <Leader>h :echo 'Vim says hello!'<CR>
nnoremap <Leader>: :set cursorcolumn!<CR>

" Visual Block Mode wooooo
command! VisualBlockMode normal! <C-v>
nnoremap <Leader>; :VisualBlockMode<CR>


" Better Window Management
" From https://youtu.be/sSOfr2MtRU8
set splitright
set splitbelow
nmap ss :vnew <CR>
nmap sS :lefta vnew <CR>
nmap sv :new <CR>
nmap st :tabnew <CR>
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
nmap <S-Tab> :tabprev<CR>
nmap <Tab> :tabnext<CR>
