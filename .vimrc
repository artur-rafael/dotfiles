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
" Sets the colorscheme.
set background=dark
colorscheme molokai
" Add numbers to each line on the left-hand side.
set number

" Override the vim TODO, FIXME and XXX highlighting.
" Refer to (https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f)
" if there are issues.
highlight Todo term=standout cterm=bold ctermfg=160 ctermbg=bg gui=bold guifg=#FFFFFF guibg=bg
" TODO: Example
" FIXME: Example
" NOTE: Example
" XXX: Example

" -----------------------------
" ------ Mouse Highlight ------
" -----------------------------

" Highlight cursor line underneath the cursor horizontally.
set cursorline
" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" ----------------------------
" ---- Editing Experience ----
" ----------------------------

" Set shift width to 4 spaces.
set shiftwidth=3
" Set tab width to 4 columns.
set tabstop=3
" Use space characters instead of tabs.
set expandtab
" Do not save backup files.
" set nobackup
" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
" While searching though a file incrementally highlight matching characters as you type.
set incsearch
" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlighting when doing a search.
set hlsearch
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
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ----------------------------
" ---- WhiteSpaces Plugin ----
" ----------------------------

" Sets the unrequired backspaces to a lightgray color
let g:better_whitespace_ctermcolor='236'

" ----------------------------
" ----- Keybinding Maps ------
" ----------------------------

noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop
