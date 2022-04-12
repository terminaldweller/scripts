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
set secure
set hlsearch
set incsearch
set ignorecase
set smartcase
set noerrorbells
set novisualbell
set backspace=indent,eol,start
set pastetoggle=<F11>
nnoremap <leader>nn :bn<CR>
nnoremap <leader>pp :bp<CR>
map <C-e> :q<cr>
nnoremap <F10> :vsp<cr>
nnoremap <S-F10> :sp<cr>
map <leader>w :w<CR>

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
