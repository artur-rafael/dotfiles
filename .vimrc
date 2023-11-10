"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" -----------------------------
" ------------ Vim ------------
" -----------------------------

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on

" -----------------------------
" ----- Temporary Files -------
" -----------------------------

" Specifies the backup(~) files directory.
" The double tailing slash (//) will store files using full paths.
set backupdir=~/.vim/backup//
" Specifies the swap(.swp) files directory.
set directory=~/.vim/swp//
" Specifies the undo(.un~) files directory.
set undodir=~/.vim/undo//

" -----------------------------
" ------- Theme Related -------
" -----------------------------

" Turn syntax highlighting on.
syntax on

"Sets the colorscheme.
colorscheme molokai
" Let the terminal define the background color.
highlight Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
highlight LineNr term=underline ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
" Change visual mode highlight
highlight Visual term=reverse ctermbg=0 guibg=#000000

" Use better colors.
"set termguicolors

" Set a maximum column, guide to not exceed that column.
set colorcolumn=100
" Set the column color.
highlight ColorColumn term=reverse ctermbg=0 guibg=#000000

" Override the vim TODO, FIXME and XXX highlighting.
highlight Todo term=standout cterm=bold ctermfg=160 ctermbg=NONE gui=bold guifg=#ff0000 guibg=NONE

" -----------------------------
" ------ Mouse Highlight ------
" -----------------------------

" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
set cursorcolumn
" Set colorscheme for the cursor highlights.
highlight CursorLine term=underline ctermbg=234 guibg=#293739
highlight CursorColumn term=underline ctermbg=234 guibg=#293739

" ----------------------------
" ---- Editing Experience ----
" ----------------------------

" Add numbers to each line on the left-hand side.
set number
" Add relative numbering for to ease line hoping.
set relativenumber

" Set shift width to 3 spaces.
set shiftwidth=3
" Set tab width to 3 columns.
set tabstop=3
" Set soft tab stop.
set softtabstop=3
" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
" set nobackup
" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
"set hlsearch
" Use incremental search instead of having to type all word.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Set the commands to save in history default number is 20.
set history=1000
" Defines the folding method syntax or indent.
set foldmethod=syntax
" Defines the maximum fold nest value.
set foldnestmax=10
" Defines fold level, high value prevent folding on 1st usage.
set foldlevel=10
" Starts editor with all folds open.
set nofoldenable

" ----------------------------
" ----- Wildmenu Feature -----
" ----------------------------

" Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" ----------------------------
" ----- NERDTree Plugin ------
" ----------------------------

" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ----------------------------
" ------ Airline Plugin ------
" ----------------------------

" Sets the airline theme.
let g:airline_theme='minimalist'

" ----------------------------
" ---- WhiteSpaces Plugin ----
" ----------------------------

" Sets the unrequired backspaces to a darkred color
let g:better_whitespace_ctermcolor='052'

" ----------------------------
" ---- CPP-Modern Plugin -----
" ----------------------------

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1
" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
"let g:cpp_simple_highlight = 1

" ----------------------------
" ----- Keybinding Maps ------
" ----------------------------

" Get rid of bad habits.
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" Move page up/down but keep it in center.
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz
" Search next/previous but keep it in center.
noremap n nzzzv
noremap N Nzzzv
