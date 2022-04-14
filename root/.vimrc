let mapleader = " "
syntax on
colo elflord
set nocompatible
set number
set relativenumber
set magic
set wildmenu
set list
set title
set showmatch
set hidden
set expandtab
set smarttab
set autoindent
set wildignorecase
set hlsearch
set incsearch
set ignorecase
set smartcase
set noerrorbells
set novisualbell
set dictionary+=/usr/share/dict/words
set backspace=indent,eol,start
set pastetoggle=<F11>
nnoremap <F7> :Vexplore<CR>
nnoremap <leader>nn :bn<CR>
nnoremap <leader>pp :bp<CR>
map <C-e> :q<cr>
nnoremap <F10> :vsp<cr>
nnoremap <S-F10> :sp<cr>
map <leader>w :w<CR>
nmap Y y$
vmap Y y$
nnoremap <S-Delete> :bd<CR>
nnoremap <leader>c :call clearmatches()<CR>
inoremap <c-i> <esc>I
inoremap <c-e> <esc>A
nnoremap <leader>t :bel term<CR>
nnoremap <leader>r :!%:p<CR>
nnoremap <leader>rl :.w !bash<CR>
set pastetoggle=<F11>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
nmap <leader>m :make<CR>

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
hi def InterestingWord9 ctermfg=16 ctermbg=57 guifg=#000000 guibg=#5f00ff
hi def InterestingWord0 ctermfg=16 ctermbg=39 guifg=#000000 guibg=#00afff
"
"typos
iab adn and
iab teh the
iab strign string
iab pritn print
iab retrun return
iab fucntion function
iab funciton function
iab tehn then
iab coutn count
iab accoutn account
iab applciation application
iab cosnt const
iab ehco echo

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

inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

let g:camelchar = "A-Z0-9.,;:{([`'\"_"
nnoremap <silent><C-h> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-l> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-h> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-l> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-h> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-l> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o

if bufwinnr(1)
  nnoremap <right> <c-w>>
  nnoremap <left> <c-w><
  nnoremap <up> <c-w>-
  nnoremap <down> <c-w>+
endif

"copy and paste between different Vim instances
nmap _Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

if has("gui")
  " set guifont=DejaVu_Sans_Mono_for_Powerline:h10
  set guioptions-=m
  set guioptions-=T
  set guioptions-=L
  set guioptions-=r
endif
set secure
