let mapleader = " "
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-gfm-syntax'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'unblevable/quick-scope'
Plug 'mbbill/undotree'
Plug 'adelarsq/vim-matchit'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'nanotech/jellybeans.vim'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'lifepillar/vim-mucomplete'
call plug#end()

set encoding=UTF-8
set linebreak
set breakindent
let &showbreak = '↪ '
set secure
set list
set wrap
set showmatch
set number
set relativenumber
set expandtab
set noerrorbells
set foldmethod=manual
set nofoldenable
set numberwidth=5
set history=1000
set tabstop=2
set hidden
set smarttab
set autoindent
set autoread
set ttyfast
set ignorecase smartcase
set magic
set lazyredraw
set hlsearch
set scrolloff=0
set tagbsearch
set wildmenu
set noerrorbells
set novisualbell

" jellybeans
colo jellybeans
set background=dark
let g:jellybeans_overrides = {
\    'Todo': { 'guifg': '000000', 'guibg': '00cc00',
\              'ctermfg': 'Black', 'ctermbg': 'Blue',
\              'attr': 'bold' },
\    'Comment': { 'guifg': '339966', 'guibg': '000000' },
\    'background': { "guibg": "000000", "ctermbg":"none"},
\    'StorageClass': {"guifg": '9966ff' },
\    'Exception': {"guifg": "99cc00"},
\    "Ignore": {"guifg": "336699"},
\    "SpecialComment": {"guifg": "009900"},
\    "Macro": {"guifg": "0099cc"}
\}
let g:jellybeans_use_term_italics = 1

let g:gfm_syntax_enable_always = 0
let g:gfm_syntax_enable_filetypes = ['markdown.gfm']
autocmd BufRead,BufNew,BufNewFile README.md setlocal ft=markdown.gfm

function! OnUIEnter(event)
  let l:ui = nvim_get_chan_info(a:event.chan)
  if has_key(l:ui, 'client') && has_key(l:ui.client, 'name')
    if l:ui.client.name ==# 'Firenvim'
      set guifont=DejaVuSansMono\ NF:h12
    endif
  endif
endfunction
" autocmd QueInit UIEnter * call OnUIEnter(deepcopy(v:event))

colo jellybeans
let g:airline_powerline_fonts = 0
try
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#formatter = 'default'
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#branch#enabled = 1
  " let g:airline#extensions#xkblayout#enabled = 1
catch
endtry
let g:airline_theme = 'jellybeans'
function! Airline_Custom()
  let l:spc = g:airline_symbols.space
  let g:airline_section_z = airline#section#create([
        \ 'windowswap',
        \ '%3p%%'.l:spc,
        \ 'linenr',
        \ ':%3v'.l:spc,
        \ '%5o',
        \ '[%b][0x%B]'
        \])
endfunction
autocmd user AirlineAfterInit call Airline_Custom()
" let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'
let g:airline_exclude_preview = 1

"camel and snake case motion
let g:camelchar = "A-Z0-9.,;:{([`'\"_"
nnoremap <silent><C-h> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-l> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-h> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-l> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-h> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-l> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o

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
map <C-e> :q<cr>
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
map <leader>w :w<CR>
nnoremap <F7> :NERDTreeToggle<CR>
nnoremap <F12> :UndotreeToggle<CR>
nnoremap <F10> :vsp<cr>
nnoremap <S-F10> :sp<cr>
nnoremap <leader>c :call clearmatches()<CR>
nnoremap <leader>t :bel term<CR>
nnoremap <leader>r :!%:p<CR>
nnoremap <leader>cd :cd %:p:h<cr>
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
nnoremap <S-Delete> :bd<CR>
map <F6> <nop>
nnoremap <leader>c :call clearmatches()<CR>
map <leader>w :w<CR>
nnoremap <leader>t :bel term<CR>
nnoremap <leader>r :!%:p<CR>

let g:qs_highlight_on_keys = ["f", "F", "t", "T"]
"
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

"vim-go
let g:go_auto_sameids = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_parameters = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1
let g:go_doc_popup_window = 1
let g:go_code_completion_enabled = 0

"quickscope
let g:qs_highlight_on_keys = ["f", "F", "t", "T"]

" undotree
set undolevels=1000
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
let g:undotree_WindowLayout = 4

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

au BufEnter github.com_*.txt set filetype=markdown
nnoremap <Esc><Esc> :call firenvim#focus_page()<CR>
nnoremap <C-z> :call firenvim#hide_frame()<CR>

"yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '|'

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O

"camel and snake case motion
let g:camelchar = "A-Z0-9.,;:{([`'\"_"
nnoremap <silent><C-h> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-l> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-h> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-l> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-h> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-l> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o

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

"copy and paste between different Vim sessions
nmap _Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

"mucomplete
set completeopt+=menuone
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1

" firenvim write changes automatically, throttle writes
let g:timer_started = v:false
function! My_Write(timer) abort
	let g:timer_started = v:false
	write
endfunction

function! Delay_My_Write() abort
	if g:timer_started
		return
	end
	let g:timer_started = v:true
	call timer_start(10000, 'My_Write')
endfunction

au TextChanged * ++nested call Delay_My_Write()
au TextChangedI * ++nested call Delay_My_Write()

let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'cmdlineTimeout': 3000,
    \ }
\ }
