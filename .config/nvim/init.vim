" use `=` to set indentation of a selection!

" Install Vim Plug if it's not there already!
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Highlight matching brace
set showmatch

" Show current motion
set showcmd

" Don't highlight searches,
set nohlsearch
" case-insensitive search, unless it contains uppercase
set smartcase

" Ask to save changes on quit
set confirm

" Automatically change working directory to current buffer
set autochdir

" Word Wrap
set wrap
set linebreak
set nolist
set breakindent
set whichwrap+=<,>,h,l

" Tabs
set autoindent
set expandtab
set shiftwidth=2
set list
set listchars=tab:␉·,trail:·

" Show (relative) line numbers
" https://codeyarns.com/2015/03/24/absolute-relative-and-hybrid-line-numbers-in-vim/
set number relativenumber
highlight LineNr ctermfg=8

" Turn on & off line numbers with Ctrl+n
nnoremap <C-n> :set relativenumber!<CR>

" This feature was less useful than annoying
nnoremap q: <Nop>

" Nicer Split Bar
"set fillchars-=vert:\| | set fillchars+=vert:\
"autocmd colorscheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=black

" Dim 'end of buffer' tildes
highlight EndOfBuffer ctermfg=black ctermbg=black

" Enable mouse
set mouse=a

" Use shift with arrow keys to scroll
map <S-Down> <C-E>
map <S-Up> <C-Y>

" How many lines you see above and below cursor
set scrolloff=8

" typing 'help' expands to 'tab help'
cabbrev help tab help

" code folding!
" don't show dots on code fold line
set fillchars=fold:\
" toggle folds with zz
nnoremap zz za
" turn on code folding
set foldmethod=syntax
" don't start w/ anything folded tho
set foldlevelstart=99

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
nmap sN :NERDTreeFind<CR>

" Motions for Telescope
nmap sf :Telescope live_grep<CR>
nmap sn :Telescope find_files<CR>
nmap sF :Telescope<CR>

" Using vim-plug (https://github.com/junegunn/vim-plug)
" Installed at `~/.vim/autoload/plug.vim`
" Remember to run :PlugInstall 😇
let g:plug_window = 'enew' " https://github.com/junegunn/vim-plug/issues/651

nnoremap <C-o> o0<C-D>
nnoremap <C-O> O0<C-D>

call plug#begin()

  " NERD Tree
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Dev Iconz for NERD Tree
  Plug 'ryanoasis/vim-devicons'


  " C++
  Plug 'octol/vim-cpp-enhanced-highlight'

  " HTML5
  Plug 'othree/html5.vim'

  " JavaScript
  Plug 'pangloss/vim-javascript'  " This kind indents JS inside HTML correctly
  "Plug 'yuezk/vim-js'            " This one does not!
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'posva/vim-vue'
  Plug 'digitaltoad/vim-pug'
  " Plug 'prettier/prettier'
  Plug 'prettier/vim-prettier'

  " Python
  Plug 'vim-python/python-syntax'
  Plug 'nvie/vim-flake8'
  Plug 'ambv/black'

  " Markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

  " nginx
  Plug 'chr4/nginx.vim'

  " Lightline
   Plug 'itchyny/lightline.vim'

  " Highlight the cursor
  Plug 'miyakogi/conoline.vim'

  " Vimwiki
  Plug 'vimwiki/vimwiki'

  " Kitty Terminal
  Plug 'fladson/vim-kitty'

  " Rust
  Plug 'rust-lang/rust.vim'

  " autocomplete
  " Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  " Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  " Plug 'natebosch/vim-lsc'

  " File Search
  Plug 'nvim-lua/plenary.nvim'
  "Plug 'nvim-telescope/telescope.nvim'
  "Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  " Debugging
  Plug 'puremourning/vimspector'

  " Floaterm (Floating Terminal Window)
  Plug 'voldikss/vim-floaterm'

  " Goyo (for focused writing)
  Plug 'junegunn/goyo.vim'

  " Calendar b/c why not let's go crazy
  " Plug 'itchyny/calendar.vim'
  Plug 'mattn/calendar-vim'

call plug#end()

  " hmm
  syntax enable
  filetype plugin indent on

  " Less uggo highlight warning
  hi QuickFixLine ctermbg=234

" JavaScript
  "let g:javascript_conceal_function = "ƒ"
  "let g:javascript_conceal_null = "Ø"
  "let g:javascript_conceal_undefined = "¿"
  "let g:javascript_conceal_return = "↩"
  " Only if using 'vim-javascript' plugin
  let g:vim_jsx_pretty_colorful_config = 1
  " No semicolons on Prettier!
  let g:prettier#config#semi = 'false'

" Markdown
  " Disable folding
  let g:vim_markdown_folding_disabled = 1
  set conceallevel=2
  " Fix indentation problem
  let g:vim_markdown_new_list_item_indent = 0
  let g:vim_markdown_auto_insert_bullets = 0
  " Enable ~~strikethrough~~
  let g:vim_markdown_strikethrough = 1

" Python
  " Fix syntax highlighting
  let g:python_highlight_all = 1

" Rust
  " Automatically run `rustfmt` on file save
  let g:rustfmt_autosave = 1
  " Allow for code folding
  let g:rust_fold = 1
  let g:rust_recommended_style = 1
  " Indent 4 spaces if Rust
  autocmd FileType rust setlocal shiftwidth=4

" Autocomplete
  let g:lsc_server_commands = {'rust': 'rust-analyzer-linux', 'python': 'pyls'}
  let g:lsc_auto_map = {'defaults': v:true, 'GoToDefinition': '<CR>' }
  nnoremap <S-CR> <C-O>

" Lightline
" For Vim's statusline stuff: https://kadekillary.work/post/statusline-vim/
  let g:lightline = { 'colorscheme': 'darcula' }
  let g:lightline.component = {
    \ 'hex': '0x%-02B',
    \ 'hexline': '0x%04-2O' }
  let g:lightline.active = {
    \ 'left': [
      \ ['mode', 'paste'],
      \ ['readonly', 'filename', 'modified'] ],
    \ 'right': [
      \ ['fileformat', 'fileencoding', 'hex', 'filetype'] ] }
  let g:lightline.mode_map = {
    \ 'n' : '🌙',
    \ 'i' : '🧚',
    \ 'R' : '💁',
    \ 'v' : '👓',
    \ 'V' : '🕶',
    \ "\<C-v>": '🥽',
    \ 'c' : '✨',
    \ 's' : 'SELECT',
    \ 'S' : 'S-LINE',
    \ "\<C-s>": 'S-BLOCK',
    \ 't': '🧠',
    \ }

" Don't show `-- INSERT --` now that we use lightline
  set noshowmode

" Conoline
  let g:conoline_auto_enable = 1

" NERDTree Config
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"

" Turn off automatic comments
autocmd FileType * setlocal formatoptions-=cro

" Preview in NERDTree
let NERDTreeMapPreview = 'p'

" Use <Esc> to escape terminal mode
tnoremap <Esc> <C-\><C-n>

" change highlighting for vimdiff
" from https://stackoverflow.com/a/17183382
highlight DiffAdd    ctermbg=8
highlight DiffDelete ctermbg=8
highlight DiffChange ctermbg=8
highlight DiffText   ctermbg=8

" change highlighting for popup menus
highlight Pmenu ctermbg=black
highlight Pmenu ctermfg=white

" Finally getting around to the leader key
let g:mapleader=';'
nnoremap <Leader>; :echo 'Vim says hello!'<CR>

" change highlighting for code fold
highlight Folded ctermbg=black

" Custom foldtext
function! CustomFoldText()
  let line = getline(v:foldstart)
  return line . '...}'
endfunction
set foldtext=CustomFoldText()

" Debugger (Vimspector)
map K <Nop>
nmap <c-K> <Plug>VimspectorStart
nmap <c-k> <Plug>VimspectorToggleBreakpoint
nmap Kc <Plug>VimspectorContinue
nmap Kr <Plug>VimspectorRestart
nmap Kr <Plug>VimspectorRunToCursor
nmap Ki <Plug>VimspectorBalloonEval
nmap Kn <Plug>VimspectorStepInto
nmap Ko <Plug>VimspectorStepOut

" Enter Visual Block Mode cuz 'C-v' is used for 'paste'
command! VisualBlockMode normal! <C-v>

" trim whitespace at the end of a line
command! TrimWhitespace :%s/\s\+$//e

" Floating Terminal (Floaterm)
nmap S :FloatermNew<CR>
let g:floaterm_title = '$1/$2'
let g:floaterm_width = 0.8
let g:floaterm_position = 'bottom'
let g:floaterm_borderchars=["═", "║", "═", "║", "╔", "╗", "╝", "╚"]

" Fancy TXT stuff
autocmd Filetype text setlocal textwidth=60 colorcolumn=61 wrap
autocmd Filetype text highlight ColorColumn ctermbg=0

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

augroup Tegra
  au!
  au BufReadPre  *.tga let &bin=1
  au BufReadPost *.tga if &bin | %!xxd
  au BufReadPost *.tga set ft=xxd | endif
  au BufWritePre *.tga if &bin | %!xxd -r
  au BufWritePre *.tga endif
  au BufWritePost *.tga if &bin | %!xxd
  au BufWritePost *.tga set nomod | endif
augroup END


" vimwiki
autocmd FileType vimwiki nnoremap <buffer> j gj
autocmd FileType vimwiki nnoremap <buffer> k gk
autocmd FileType vimwiki setlocal noexpandtab tabstop=4 shiftwidth=4 listchars=tab:\ \ 
autocmd FileType vimwiki setlocal nobreakindent noautoindent textwidth=0
autocmd FileType vimwiki Goyo 45x100%
autocmd FileType vimwiki cnoreabbrev q qa
autocmd FileType vimwiki cnoreabbrev center center 45
let g:vimwiki_global_ext = 0
let philly_wiki = {}
let philly_wiki.path = '~/wikis/philly/'
let book_wiki = {}
let book_wiki.path = '~/wikis/book/'
let g:vimwiki_list = [philly_wiki, book_wiki]

" Get the wordcount!
command! WordCount !wc %

" Copy buffer to clipboard
" previously used `cat` instead of `:w !tee`, which read from saved file, not buffer
command! Yank :w !tee | xclip -selection clipboard & echo "Copied buffer to clipboard"
