" Vim configuration

set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set wrap
set linebreak
set ignorecase
set smartcase
set cursorline
set splitright
set splitbelow
set cmdheight=2
set conceallevel=0
set fileencoding=utf-8
set hlsearch
set showtabline=2
set smartindent
set undofile
set updatetime=300
set numberwidth=4
set signcolumn=no
set scrolloff=8

" Enable both relative and absolute line numbers
set number
set relativenumber

" Shortcuts
nnoremap <C-s> :w<CR>
nnoremap <C-q> :wq!<CR>
inoremap <C-s> <Esc>:w<CR>a
inoremap <C-q> <Esc>:q!<CR>a

" Remap HJKL to arrow keys in normal and insert mode
nnoremap k <Up>
nnoremap j <Down>
nnoremap h <Left>
nnoremap l <Right>
nnoremap <Esc> :nohl<CR>
nnoremap x "_x
nnoremap <Space>v <C-w>v
nnoremap <Space>h <C-w>s
nnoremap <Space>we <C-w>=
nnoremap <Space>q :close<CR>
nnoremap <Space>t :tabnew<CR>
nnoremap <tab> :tabn<CR>
nnoremap <S-tab> :tabp<CR>

" Open Netrw file explorer
nnoremap <Space>n :Lex<CR>:vertical resize 30<CR>

" Enable mouse support
set mouse=a

" Change window switching to Ctrl+arrows
map <C-Left> <C-W>h
map <C-Right> <C-W>l
map <C-Up> <C-W>k
map <C-Down> <C-W>j

" Reload the vimrc file
command! ReloadVimrc :source $MYVIMRC<CR>

" Automatically copy to the system clipboard when yanking (copying)
if has('clipboard')
  set clipboard+=unnamedplus
  augroup vim_clipboard_integration
    autocmd!
    autocmd TextYankPost * silent! call system("xclip -selection clipboard", @")
  augroup END
endif

" Terminal buffer
nnoremap <Space><CR> :term<CR>
inoremap <Space><CR> <Esc>:term<CR>a

if has('nvim')
  augroup TerminalAutoInsert
    autocmd!
    autocmd TermOpen * startinsert
  augroup END
  autocmd! TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>:bd!<CR>
endif
