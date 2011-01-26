set t_Co=256
set nocompatible
"set mouse=a
syntax on
filetype on
filetype plugin on

set autowrite
set autoread
set number
set showcmd
"set lcs=tab:>-,trail:-
"set list
set showmode
set showmatch
set title
set tabstop=4
set ruler
set encoding=utf-8
set fileencoding=utf-8
set nobackup
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set smarttab
set fdm=marker
"set fdc=4
set nowrap
set hlsearch
set incsearch
set tags=./tags
colo default


" bufexplorer
let g:bufExplorerDefaultHelp=1
let g:bufExplorerDetailedHelp=0
let g:bufExplorerSortBy='mru'

nmap <C-X> :BufExplorer<CR>

if has("win32")
  set guifont=Courier_New:h16:cANSI
  au GUIEnter * simalt ~x
  colorscheme  oceandeep 
elseif has("mac") || has("macunix")
  set guifont=Monaco:h16
  set guifontwide=STXihei:h16
  colorscheme wombat
else
  set guifont=Monaco:h16
  set guifontwide=STXihei:h16
  colorscheme ir_black
endif

let g:NeoComplCache_DisableAutoComplete = 1
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'

" fn maping
map <F1> :wqall<CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeMirror<CR>
map <F4> :wall<CR>

" TagList plugin
map <F5> :TlistToggle<CR>
let Tlist_WinWidth = 30
let Tlist_Use_Right_Window=1
let Tlist_Use_SingleClick=1
map <F8> :! ctags -R .<CR>

" vim menu
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F6> :emenu <C-Z>

map <F7> :w<CR>

map <C-c> "*y
map <C-m> :e!<CR>

" tab config
map tn :tabnext<CR>
map tp :tabprev<CR>
map te :tabnew
map tc :tabclose<CR>

" clever tab completion
fun! KeywordComplete()
    let left = strpart(getline('.'), col('.') - 2, 1)
    if left =~ "^$"
        return "\<Tab>"
    elseif left =~ ' $'
        return "\<Tab>"
    else
        return "\<C-N>"
endfun
inoremap <silent> <Tab> <C-R>=KeywordComplete()<CR>

fun! OmniComplete()
    let left = strpart(getline('.'), col('.') - 2, 1)
    if left =~ "^$"
        return ""
    elseif left =~ ' $'
        return ""
    else
        return "\<C-x>\<C-o>"
endfun
inoremap <silent> <S-Tab> <C-R>=OmniComplete()<CR>

" turn on Omni completion
autocmd FileType c set ofu=ccomplete#Complete
autocmd FileType php set ofu=phpcomplete#CompletePHP
autocmd FileType python set ofu=pythoncomplete#Complete
autocmd FileType ruby set ofu=rubycomplete#Complete
autocmd FileType java set ofu=javacomplete#Complete
autocmd FileType javascript set ofu=javascriptcomplete#CompleteJS
autocmd FileType html set ofu=htmlcomplete#CompleteTags
autocmd FileType css set ofu=csscomplete#CompleteCSS
autocmd FileType xml set ofu=xmlcomplete#CompleteTags

" turn on syntax highlighting on scala file
autocmd FileType scala colo scala


" 保存 _vimrc 时自动载入，避免重启 vim
autocmd! bufwritepost _vimrc source %
"
" vim: set et sw=4 ts=4 sts=4 fdm=marker ff=unix fenc=utf8

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [PWD]\ %r%{CurrectDir()}%h\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=
set laststatus=2 " always show the status line

function! CurrectDir()
    let curdir = substitute(getcwd(), "", "", "g")
        return curdir
    endfunction

" Set leader to comma
let mapleader = ","
"
map <leader>t :CommandT<CR>

" Make editing .vimrc easier
map <leader>v :sp ~/.vimrc<CR>
