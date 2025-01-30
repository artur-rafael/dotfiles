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
" Vim is annoying when jumping in and out of unsaved buffers.
set hidden
" Set the commands to save in history.
set history=1000

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
" Use better colors.
set termguicolors

" Sets the colorscheme.
colorscheme molokai
" Let the terminal define the background.
highlight Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
highlight LineNr ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" Override the vim FIXME, TODO and XXX highlighting.
"highlight Todo term=standout term=bold ctermfg=160 ctermbg=NONE gui=bold guifg=#ff0000 guibg=NONE

" -----------------------------
" ------ Mouse Highlight ------
" -----------------------------

" Highlight cursor line underneath the cursor horizontally and vertically.
set cursorline cursorcolumn
" Set colorscheme for the cursor highlights.
highlight CursorLine   term=underline ctermbg=234 guibg=#202020
highlight CursorColumn term=underline ctermbg=234 guibg=#202020

" ----------------------------
" ---- Editing Experience ----
" ----------------------------

" Set a maximum column, guide to not exceed that column.
set colorcolumn=80,120
" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10
" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are on the last line.
set showmode
" Show matching bracket during a search.
set showmatch

" number:         Add numbers to each line on the left-hand side.
" relativenumber: Add relative numbering for to ease line hoping.
"set number relativenumber

" expandtab:   Use space characters instead of tabs.
" tabstop:     Sets the width of a tab.
" softtabstop: Sets the number of spaces to insert when you press the <Tab> key.
" shiftwidth:  Sets the number of spaces used for each step of (auto)indent.
set expandtab tabstop=3 softtabstop=3 shiftwidth=3

" nofoldenable: Starts editor with all folds open.
" foldmethod:   Defines the folding method syntax or indent.
" foldnestmax:  Defines the maximum fold nest value.
" foldlevel:    Defines fold level, high value prevent folding on 1st usage.
set nofoldenable foldmethod=syntax foldnestmax=10 foldlevel=10

" hlsearch:   Use highlighting when doing a search.
" incsearch:  Use incremental search instead of having to type all word.
" ignorecase: Ignore capital letters during search.
" smartcase:  Override the ignorecase option if searching for capital letters.
set hlsearch incsearch ignorecase smartcase

" Align case labels with the switch statement.
autocmd FileType c setlocal cinoptions+=:0

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
" --- Netrw Builtin Plugin ---
" ----------------------------

" Disabels header (use I to toggle between on and off).
let g:netrw_banner = 0

" ----------------------------
" -------- FZF Plugin --------
" ----------------------------

" The fzf repository is a git submodule in the home directory
set rtp+=~/.fzf

" Jump to a filename.
nnoremap <C-p> :Files<CR>

" ----------------------------
" ------ Airline Plugin ------
" ----------------------------

" Sets the airline theme.
let g:airline_theme='minimalist'

" ----------------------------
" ---- WhiteSpaces Plugin ----
" ----------------------------

" Sets the unrequired backspaces to a darkred color.
let g:better_whitespace_ctermcolor='052'

" ----------------------------
" ---- CPP-Modern Plugin -----
" ----------------------------

" Enable highlighting of C++11 attributes.
let g:cpp_attributes_highlight = 1
" Highlight struct/class member variables (affects both C and C++ files).
let g:cpp_member_highlight = 1

" ----------------------------
" ----- GitGutter Plugin -----
" ----------------------------

" The diff markers should appear after this delay (default value is 4000, 4s).
set updatetime=100

" Turn off plugin on startup.
"let g:gitgutter_enabled = 0

" Disable plugin keybinds, to not interfere with the ones set.
let g:gitgutter_map_keys = 0

" Customization tweaks.
highlight SignColumn      guibg=NONE    ctermbg=NONE
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Toggle on/off plugin.
nnoremap <C-g> :GitGutterToggle<CR>

" Jump between hunks.
nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)

" Undo/Preview hunks.
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" ----------------------------
" ----- Keybinding Maps ------
" ----------------------------

" Set leader key to <Space>.
let mapleader = "\<Space>"

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

" Jump between functions but keep it in center.
noremap [[ [[zz
noremap ]] ]]zz

" Toggle on/off vim numbering.
nnoremap <C-n> :set nu! rnu!<CR>

" Open netrw keybind (e=Explorer).
nnoremap <leader>e :Ex<CR>

" Lists all buffers.
nnoremap <Leader>b :buffers<CR>

" Removes current buffer.
nnoremap <Leader>d :bdelete<CR>

" <Ctrl-o> <Ctrl-i> default bindings to jump back to previous buffer.

" Jump to a buffer by filename.
" nnoremap <Leader>f :buffers<CR>:buffer<Space>
"
" Jump to a buffer by filename (handled by fzf)
nnoremap <Leader>f :Buffers<CR>

" Jump to a buffer by home row keys.
nnoremap <Leader>h :bprevious<CR>
nnoremap <Leader>j :blast<CR>
nnoremap <Leader>k :bfirst<CR>
nnoremap <Leader>l :bnext<CR>

" Jump to a buffer by number.
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
