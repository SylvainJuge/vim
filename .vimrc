
" set language for messages and gui menus
language messages en

" must be set before syntax highlight
set langmenu=en

colorscheme ir_black

" enable syntax coloring
syntax enable

" use utf8 encoding for vim files and for default file encoding
set encoding=utf-8
set fileencoding=utf-8

" auto complete on tab
set wildmenu

" disable arrow key mappings
noremap <Up> ""
noremap <Down> ""
noremap <Left> ""
noremap <Right> ""

" tab are replaced by 4 spaces
set expandtab
set tabstop=4

" << / >> right / left shift by 4 spaces
set shiftwidth=4

" copy indent from current line on <CR> 
set autoindent

" map nerdtree to F2
noremap <F2> :NERDTreeToggle<CR>

" backspace in insert mode : backspace option 
" behave like normal text editor, backspace always delete previous character 
set backspace=eol,start,indent

" GUI font
if has("gui_running")
    if has("gui_gtk2")
  " TODO find appropriate font for gtk2
        ":set guifont=Luxi\ Mono\ 12
    elseif has("gui_win32")
  " TODO : find appropriate font for windows xp
        :set guifont=Consolas 
    endif
endif


" remove gui icons bar
set guioptions-=T
" remove menus
set guioptions-=m
set guioptions-=g
" remove left scrollbar
set guioptions-=R
set guioptions-=r
set guioptions-=L
set guioptions-=l
