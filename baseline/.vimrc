set encoding=UTF-8
let mapleader = " "
set nocompatible
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noselect
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'sheerun/vim-polyglot'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'chrisbra/Recover.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'unblevable/quick-scope'
Plugin 'tpope/vim-repeat'
Plugin 'adelarsq/vim-matchit'
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-commentary'
Plugin 'wellle/context.vim'
Plugin 'roxma/vim-tmux-clipboard'
Plugin 'lifepillar/vim-mucomplete'
call vundle#end()
filetype plugin indent on

" jellybeans
colo jellybeans
set background=dark
let g:jellybeans_overrides = {
\    'Todo': { 'guifg': '000000', 'guibg': '00cc00',
\              'ctermfg': 'Black', 'ctermbg': 'Blue',
\              'attr': 'bold' },
\    'Comment': { 'guibg': '339966', 'guifg': '000000' },
\    'background': { "guibg": "000000", "ctermbg":"none"},
\    'StorageClass': {"guifg": '9966ff' },
\    'Exception': {"guifg": "99cc00"},
\    "Ignore": {"guifg": "336699"},
\    "SpecialComment": {"guifg": "009900"},
\    "Macro": {"guifg": "0099cc"}
\}
let g:jellybeans_use_term_italics = 1

"set exrc
set encoding=UTF-8
set linebreak
set breakindent
set wrap
set tagbsearch
set secure
set list
set showmatch
set number
set relativenumber
set noerrorbells
set hidden
set novisualbell
set expandtab
set smarttab
set autoindent
set shell=ksh
set autoread
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set lazyredraw
set ttyfast
set scrolloff=0
set tagbsearch
set wildmenu
set diffopt=internal,algorithm:patience
set tags=./tags,tags;$HOME
syntax on
set directory^=$HOME/.vim/tmp//
nmap <Backspace> <Nop>
nmap <Delete> <Nop>
nmap <Left> <Nop>
nmap <Down> <Nop>
nmap <Up> <Nop>
nmap <Right> <Nop>
nmap <PageUp> <Nop>
nmap <PageDown> <Nop>
imap <PageUp> <Nop>
imap <PageDown> <Nop>
map <F3> :bp<CR>
map <F4> :bn<CR>
nnoremap <F7> :Vexplore<CR>
map <F8> :TagbarToggle<CR>
nnoremap <F12> :UndotreeToggle<cr>
map <C-e> :q<cr>
set timeoutlen=1000 ttimeoutlen=100
set <F13>=^[[21;2~
map <F13> <S-F10>
map! <F13> <S-F10>
nnoremap <F10> :vsp<cr>
nnoremap <S-F10> :sp<cr>
nnoremap <F5> :ContextToggle<CR>
set pastetoggle=<F11>
nnoremap <leader>cd :cd %:p:h<cr>
nmap ]c :cn<CR>
nmap [c :cp<CR>
nnoremap <leader>nn :bn<CR>
nnoremap <leader>pp :bp<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" nnoremap k gk
" nnoremap gk k
" nnoremap j gj
" nnoremap gj j
nmap <leader>m :make<CR>

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>

set laststatus=2
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline ctermfg=22 ctermbg=15 guibg=#005f00 guifg=#ffffff
  elseif a:mode == 'r'
    hi statusline ctermfg=52 ctermbg=15 guibg=#5f0000 guifg=#ffffff
  else
    hi statusline ctermfg=25 ctermbg=63 guibg=#005faf guifg=#5f5fff
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermfg=24 ctermbg=15 guibg=#005f87 guifg=#ffffff
hi statusline ctermfg=24 ctermbg=15 guibg=#005f87 guifg=#ffffff
hi statuslineNC ctermfg=0 ctermbg=24 term=bold guifg=#000000 guibg=#005f87
set statusline=[%f]                             "file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

set fillchars+=vert:\ " whitespace signifacant
hi VertSplit ctermbg=0 ctermfg=0 guibg=#000000 guifg=#000000

" highlight groups
hi def InterestingWord1 ctermfg=16 ctermbg=214 guifg=#000000 guibg=#ffaf00
hi def InterestingWord2 ctermfg=16 ctermbg=154 guifg=#000000 guibg=#afff00
hi def InterestingWord3 ctermfg=16 ctermbg=121 guifg=#000000 guibg=#87ffaf
hi def InterestingWord4 ctermfg=16 ctermbg=137 guifg=#000000 guibg=#af875f
hi def InterestingWord5 ctermfg=16 ctermbg=211 guifg=#000000 guibg=#ff87af
hi def InterestingWord6 ctermfg=16 ctermbg=195 guifg=#000000 guibg=#d7ffff
hi def InterestingWord7 ctermfg=16 ctermbg=99 guifg=#000000 guibg=#875fff
hi def InterestingWord8 ctermfg=16 ctermbg=35 guifg=#000000 guibg=#00af5f
hi def InterestingWord9 ctermfg=16 ctermbg=209 guifg=#000000 guibg=#ff875f
hi def InterestingWord0 ctermfg=16 ctermbg=39 guifg=#000000 guibg=#00afff

" Steve Losh's highlight function
function HighInterestingWord(n)
  normal! mz
  normal! "zyiw
  let mid = 88888 + a:n
  silent! call matchdelete(mid)
  let pat = '\V\<' . escape(@z, '\') . '\>'
  call matchadd("InterestingWord".a:n, pat, 1, mid)
  normal! `z
endfunction

" multiple highlights
nnoremap <silent> <leader>1 :call HighInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HighInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HighInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HighInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HighInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HighInterestingWord(6)<cr>
nnoremap <silent> <leader>7 :call HighInterestingWord(7)<cr>
nnoremap <silent> <leader>8 :call HighInterestingWord(8)<cr>
nnoremap <silent> <leader>9 :call HighInterestingWord(9)<cr>
nnoremap <silent> <leader>0 :call HighInterestingWord(0)<cr>

au BufNewFile,BufEnter *.s set ft=nasm

"copy and paste between different Vim sessions
nmap _Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

iab pritn print
iab retrun return
iab fucntion function
iab funciton function

nnoremap <S-Delete> :bd<CR>
map <F6> <nop>
nnoremap <leader>c :call clearmatches()<CR>
map <leader>w :w<CR>
nnoremap <leader>t :bel term<CR>
nnoremap <leader>r :!%:p<CR>

let g:qs_highlight_on_keys = ["f", "F", "t", "T"]

" undotree
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
let g:undotree_WindowLayout = 4

"highlight search
highlight Search ctermfg=White ctermbg=DarkGreen cterm=Bold
highlight IncSearch ctermfg=White ctermbg=DarkBlue cterm=Bold
highlight WildMenu ctermfg=DarkBlue ctermbg=DarkGreen cterm=Bold

"netrw
let g:netrw_sort_by = 'date'
let g:netrw_sort_direction = 'reverse'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 1
let g:netrw_winsize = 15
let g:netrw_fastbrowse = 1
let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'

"tagbar
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = 2
let g:tagbar_width = 50
highlight TagbarSignature ctermfg=DarkBlue

"view the python docs for the word under cursor in a split window
function! s:pythondoc()
  let l:vword = expand("<cword>")
  botright vnew
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  execute ".!pydoc3 " . l:vword
  setlocal nomodifiable
  set syntax=man
  1
endfunction
command! PythonDoc call s:pythondoc()
nnoremap <leader>h :<C-U>PythonDoc<cr>

"camel and snake case motion
let g:camelchar = "A-Z0-9.,;:{([`'\"_"
nnoremap <silent><C-h> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-l> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-h> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-l> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-h> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-l> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

"window resizing
if bufwinnr(1)
  nnoremap <right> <c-w>>
  nnoremap <left> <c-w><
  nnoremap <up> <c-w>-
  nnoremap <down> <c-w>+
endif

if has('cscope')
    set cscopetag cscopeverbose

    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif

    cnoreabbrev <expr> csa ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs add'  : 'csa')
    cnoreabbrev <expr> csf ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find' : 'csf')
    cnoreabbrev <expr> csk ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs kill' : 'csk')
    cnoreabbrev <expr> csr ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs reset' : 'csr')
    cnoreabbrev <expr> css ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs show' : 'css')
    cnoreabbrev <expr> csh ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs help' : 'csh')

    command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1

if has("gui")
  set guifont=DejaVu_Sans_Mono_for_Powerline:h10
  set guioptions-=m
  set guioptions-=T
  set guioptions-=L
  set guioptions-=r
endif
