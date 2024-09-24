source $VIMRUNTIME/defaults.vim

set background=dark
colorscheme elflord

nnoremap <SPACE> <Nop>
let mapleader=" "

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tags=tags
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set noerrorbells                " don't beep

set tabstop=2                   " a tab is two spaces
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=2                " number of spaces to use for autoindenting
set expandtab                   " insert spaces instead of tabs
set smarttab                    " use shiftwidth, instead of tabstop, at beginning of line
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'

set relativenumber              " show relative line numbers


" CTRL-backspace delete previous word
" Note: if using putty, check Terminal->Keyborad options and make sure that
" Backspace is set to CTRL-H.
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
inoremap ^? <C-W>
nnoremap ^? a<C-W><esc>

" Search down into subfolders
" Provides tab-completion for all file-releated tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Move lines in visual
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Reselect after visual mode shift
vnoremap < <gv
vnoremap > >gv

" Write buffer on CRTL-S
nnoremap <C-s> :w<cr>

" Search and Replace word under cursor
nnoremap <leader>s :%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>

nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" Insert the current date at the top of the file
nmap <leader>N ggi# <C-R>=strftime("%Y-%m-%d - %A")<CR><CR><CR><ESC>

