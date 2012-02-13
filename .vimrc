" most intersting stuff is done through breaking things
set nocompatible

" pathogen plugin, requires filetype plugin indent
filetype plugin indent on
call pathogen#infect()
" required to get help on stuff installed through pathogen
call pathogen#helptags()

" set language for messages and gui menus
let s:langCode = has('win32') ? 'en' : 'en_US.UTF-8'

" must be set before syntax highlight
let &langmenu = s:langCode
execute 'language message '.s:langCode

colorscheme ir_black

" enable syntax coloring
syntax enable

" use utf8 encoding for vim files and for default file encoding
set encoding=utf-8
set fileencoding=utf-8

" auto complete on tab
set wildmenu

" disable arrow key mappings (normal and insert modes)
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
" move on screen lines (and not actual lines), useful for wrapped lines
nnoremap j gj
nnoremap k gk

" remove useless help, and prompt for search term instead
noremap <F1> <esc>:h 

" display a $ at end of change area (thus changed is visually between
" cursor and highlighted $.
" TODO : find how to always make it look different from text color under
" cursor
set cpoptions+=$

" when scrolling, keep a margin for readeability
set scrolloff=4

" tab are replaced by 4 spaces
set expandtab
set tabstop=4
" make deleting on spaces like its tabs
set softtabstop=4

" << / >> right / left shift by 4 spaces
set shiftwidth=4

" copy indent from current line on <CR> 
set autoindent

" backspace in insert mode : backspace option 
" behave like normal text editor, backspace always delete previous character 
set backspace=eol,start,indent

" GUI font
if has("gui_gtk2")
    " TODO find appropriate font for gtk2
    "set guifont=Luxi\ Mono\ 12
elseif has("gui_win32")
    " TODO : find appropriate font for windows xp
    set guifont=Consolas:h11
endif

" windows fullscreen toggle
if has('gui_win32')
    " note : .dll extention MUST be ommited when using an absolute path
    let g:fullscreenDllPath=expand('%:p:h').'\.vim\bundle\gvimfullscreen_win32\gvimfullscreen'
    execute "map <F11> <Esc>:call libcallnr('".g:fullscreenDllPath."', 'ToggleFullScreen', 0)<cr>"
endif

" remove gui icons bar
set guioptions-=T
" remove menus
set guioptions-=m
set guioptions-=g
" remove all scrollbars
set guioptions-=R
set guioptions-=r
set guioptions-=L
set guioptions-=l


" don't redraw while executing macros
set lazyredraw

" display current mode and current command
set showmode
set showcmd

" allow to have hidden buffers not written
set hidden

set laststatus=2
set statusline=%t\ %{fugitive#statusline()}\ [%l,%v]\ %=%{strftime(\"%H:%M\")}

" extra locations required for swap files. will use 1st usable, so win-*nix
" friendly. fixes issues with Gdiff on windows
set directory+=,~/tmp,$TMP

" comma as leader key
let mapleader = ","

" search options
set incsearch
set showmatch
set hlsearch

" search ignore case when all lowercase, case sensitive otherwise
set ignorecase
set smartcase

" hide search highlight on ,<space>
nnoremap <silent><leader><space> :nohlsearch<cr>

" fuzzy-finder mappings
noremap <silent><leader>f :FufFile<cr>
noremap <silent><leader>b :FufBuffer<cr>
noremap <silent><leader>cd :FufDir<cr>

" fuzzy-finder features to explore :
" - file coverage
" - mru file
" - mru command
" - bookmark file
" - bookmark dir
" - tag mode
" - buffer tag mode
" - tagged file 
" - jump list
" - change list 
" - quickfix 
" - line 

" fugitive mapped to ,g*
noremap <silent><leader>gs :Gstatus<cr>
noremap <silent><leader>gd :Gdiff<cr>

" closes all fugitive windows in current tab
function! GitClose()
    let sep = has('win32') ? '\' : '/'
    for buffer in tabpagebuflist()
        if 0 < bufnr(buffer) 
            let bufName = bufname(buffer)
            if bufName =~? '^fugitive:' || bufName =~? '\.git'.sep.'index$'
                let window = bufwinnr(buffer)
                if 0 < window
                    execute window."wincmd w" 
                    wincmd c
                    wincmd p
                endif
            endif
        endif
    endfor
endfunction

nnoremap <silent><leader>gc :call GitClose()<cr>

" window commands on ,w instead of Ctrl+w
nnoremap <leader>w <c-w>

" diff update on ,du
" TODO : enable it only when in diff mode
nnoremap <silent><leader>du :diffupdate<cr>

" ack integration
" TODO add suitable configuration for windows
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" localvimrc to handle per location/project settings
let g:localvimrc_ask=0
