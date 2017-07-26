
source $VIMRUNTIME/defaults.vim
source $HOME/vimfiles/restore_window.vim


set background=dark
colorscheme elflord

set guifont=consolas:h11
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set guioptions-=L " Removes left hand scroll bar
set guicursor+=n-v-c:blinkon0

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set noerrorbells                " don't beep
set mouse=a

"set expandtab                   " expand tabs by default (overloadable per file type later)
"set timeout timeoutlen=200 ttimeoutlen=100
"set autowrite			" Save on buffer switch
"set visualbell                  " don't beep

"set sessionoptions+=resize,winpos
"autocmd VIMEnter * :source $HOME/vimfiles/session.vim
"autocmd VIMLeave * :mksession! $HOME/vimfiles/session.vim
"set lines=60 columns=120


" Insert the current date at the top of the file
nmap <leader>N ggi# <C-R>=strftime("%Y-%m-%d - %A")<CR><CR><CR><ESC>


