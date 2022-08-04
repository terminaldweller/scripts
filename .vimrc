let mapleader = " "
let maplocalleader = ","
set encoding=UTF-8
set nocompatible
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noselect
set showmatch
set list
set title
set listchars=eol:$,tab:>-
set hidden
set tabstop=2
set conceallevel=1
set shiftwidth=2
set shell=ksh
set directory^=$HOME/.vim/tmp//
set expandtab
set smarttab
set autoindent
set autochdir
set history=1000
set cindent
set complete=.,w,b,u,t,i
set foldmethod=manual
set nofoldenable
set autoread
set number
set showtabline=0
set numberwidth=5
set laststatus=2
set smartcase
set more
set lazyredraw
set synmaxcol=333
syntax sync minlines=64
set ttyfast
set relativenumber
set wildignorecase
set shm=a
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildmenu
set confirm
set magic
set scrolloff=0
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set ai
set si
set wrap
set linebreak
set breakindent
let &showbreak = '↪ '
set tagbsearch
set showfulltag
set diffopt=internal,algorithm:patience
set fillchars+=vert:\ " whitespace signifacant
set secure
set cursorline
autocmd InsertLeave * set cursorline
autocmd InsertEnter * set nocursorline
set tags=./tags,tags;$HOME
set spelllang=en_us,de_de
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
" set cursorcolumn
" set exrc
" set wildmode=list:longest,full
if !has('nvim')
  set viminfo='100,\"500,:50,%,n~/.viminfo
  set completeopt+=popup
endif

highlight clear Search
let g:is_posix = 1

" set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/bin/fzf
" set rtp+=/home/bloodstalker/extra/llvm-clang-4/build/bin/clangd
" set rtp+=/usr/local/bin/pyls
let g:polyglot_disabled = ['sensible', 'go.plugin', 'markdown.plugin', 'terraform.plugin', 'haproxy.plugin', 'python', 'c.plugin', 'cpp.plugin']

" call plug#begin('~/.vim/plugged')
call plug#begin('~/.vim/bundle')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'sickill/vim-pasta'
Plug 'adelarsq/vim-matchit'
Plug 'makerj/vim-pdf'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'mhinz/vim-signify'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vimwiki/vimwiki'
Plug 'flazz/vim-colorschemes'
Plug 'neomutt/neomutt.vim'
Plug 'sngn/vim-i3blocks-syntax'
Plug 'rhysd/vim-wasm'
" makes scrolling slow and doesnt work with vista popups
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'tomlion/vim-solidity'
Plug 'dense-analysis/ale'
Plug 'ekalinin/Dockerfile.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'chrisbra/NrrwRgn'
Plug 'kana/vim-arpeggio'
Plug 'easymotion/vim-easymotion'
Plug 'neovimhaskell/haskell-vim'
Plug 'majutsushi/tagbar'
Plug 'szw/vim-maximizer'
Plug 'chrisbra/csv.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
Plug 'elzr/vim-json'
Plug 'wellle/context.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'stephpy/vim-yaml'
Plug 'unblevable/quick-scope'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'chrisbra/Recover.vim'
Plug 'wellle/targets.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'mhinz/vim-grepper'
Plug 'junegunn/limelight.vim'
Plug 'valloric/MatchTagAlways', {'for':['html','xml','ejs']}
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'
Plug 'rgrinberg/vim-ocaml'
Plug 'kshenoy/vim-signature'
Plug 'Konfekt/vim-scratchpad'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-repeat'
Plug 'cespare/vim-toml'
Plug 'maralla/vim-toml-enhance'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'chiel92/vim-autoformat'
Plug 'vim-scripts/ZoomWin'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/DoxyGen-Syntax'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'raimon49/requirements.txt.vim'
Plug 'Shougo/vimproc.vim'
Plug 'rhysd/vim-llvm'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-edgemotion'
Plug 'lervag/vimtex'
Plug 'vim-utils/vim-man'
Plug 'ajh17/VimCompletesMe'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'wlemuel/vim-tldr'
Plug 'congma/vim-compiler-checkbashisms'
Plug 'hsanson/vim-openapi'
Plug 'mattn/emmet-vim', {'for': ['html','css','xml','ejs','markdown']}
Plug 'hail2u/vim-css3-syntax'
Plug 'chrisbra/unicode.vim'
Plug 'meatballs/vim-xonsh'
Plug 'junegunn/gv.vim'
Plug 'ap/vim-css-color'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shirk/vim-gas'
Plug 'roxma/vim-tmux-clipboard'
Plug 'wellle/visual-split.vim'
Plug 'zchee/vim-goasm'
Plug 'jvirtanen/vim-hcl'
Plug 'AndrewRadev/splitjoin.vim'
if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
endif
Plug 'dansomething/vim-hackernews'
Plug 'andrewstuart/vim-kubernetes'
Plug 'Joorem/vim-haproxy'
Plug 'jaxbot/semantic-highlight.vim', {'on': 'SemanticHighlightToggle'}
Plug 'liuchengxu/vista.vim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'tpope/vim-dispatch'
Plug 'kh3phr3n/python-syntax'
Plug 'zaid/vim-rec'
Plug 'calincru/flex-bison-syntax'
Plug 'tridactyl/vim-tridactyl'
Plug 'hrother/offlineimaprc.vim'
Plug 'lifepillar/pgsql.vim', {'for': ['sql','pqsl', 'pgsql']}
Plug 'HiPhish/info.vim'
Plug 'kmonad/kmonad-vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'plasticboy/vim-markdown'
" Plug 'kana/vim-operator-user'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'Konfekt/vim-office'
" Plug 'haya14busa/vim-operator-flashy'
" Plug 'terryma/vim-expand-region'
" Plug 'romainl/vim-devdocs'
" Plug 'rhysd/devdocs.vim'
" Plug 'psliwka/vim-smoothie'
" Plug 'tmux-plugins/vim-tmux'
" Plug 'rhysd/vim-gfm-syntax'
" Plug 'vim-utils/vim-troll-stopper'
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'skammer/vim-css-color'
" Plug 'jelera/vim-javascript-syntax'
" Plug 'szymonmaszke/vimpyter'
" Plug 'puremourning/vimspector'
" Plug 'kana/vim-submode'
" Plug 'tpope/vim-capslock'
" Plug 'nanotech/jellybeans.vim'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'mattn/webapi-vim'
" Plug 'Townk/vim-autoclose'
" Plug 'tpope/vim-speeddating'
" Plug 'powerman/vim-plugin-AnsiEsc'
" Plug 'xolox/vim-misc'
" Plug 'metakirby5/codi.vim'
" Plug 'vim-scripts/tagexplorer.vim'
" Plug 'severin-lemaignan/vim-minimap'
" Plug 'ervandew/supertab'
" Plug 'Valloric/ListToggle'
" Plug 'neomake/neomake'
" Plug 'scrooloose/syntastic'
" Plug 'Yggdroot/hiPairs'
" Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'gcmt/wildfire.vim'
" Plug 'luochen1990/rainbow'
" Plug 'voldikss/vim-floaterm'
call plug#end()
filetype plugin indent on

" vim-markdown
" let g:vim_markdown_math = 1
" let g:vim_markdown_strikethrough = 1

" enable 24-bit color
if exists('+termguicolors')
  " set Vim-specific sequences for RGB colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  " set termguicolors
endif
"jellybeans
silent! colo jellybeans
set background=dark
let g:jellybeans_overrides = {
\    'Todo': { 'guifg': '000000', 'guibg': '00cc00',
\              'ctermfg': 'Black', 'ctermbg': 'Blue',
\              'attr': 'bold' },
\    'Comment': { 'guifg': '339966', 'attr': 'bold'},
\    'background': { "guibg": "000000", "ctermbg":"none"},
\    'StorageClass': {"guifg": '9966ff' },
\    'PreCondit': {"guifg": '5f87ff' },
\    'Tag': {"guifg": '00af5f' },
\    'Label': {"guifg": '008787' },
\    'Exception': {"guifg": "99cc00"},
\    "Ignore": {"guifg": "336699"},
\    "SpecialComment": {"guifg": "009900"},
\    "Macro": {"guifg": "0099cc"}
\}
let g:jellybeans_use_term_italics = 1

"Disable Background Color Erase (BCE) so that color schemes
"work properly when Vim is used inside tmux and GNU screen.
if &term =~ '256color'
  set t_ut=
endif

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_posix_standard = 1
hi link cAnsiFunction Exception

hi Normal ctermbg=None

function! s:shortenPath(path)
  let l:result = []
  let l:segments = split(a:path, "/")
  if len(l:segments) - 1 > 0
    let l:last_segment = l:segments[len(l:segments)-1]
    for segment in l:segments
      if l:segment == l:last_segment
        call add(l:result, "/".l:segment)
      else
        call add(l:result, "/".l:segment[0])
      endif
    endfor
  else
    let l:result = ["none"]
  endif
  return join(l:result, "")
endfunction

"airline options
let g:airline_powerline_fonts = 1
let s:airline_custom_cwd = s:shortenPath(expand('%:p'))
try
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#formatter = 'default'
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#xkblayout#enabled = 1
catch
endtry
let g:airline_theme = 'jellybeans'
function! Airline_Custom()
  let l:spc = g:airline_symbols.space
  let g:airline_section_z = airline#section#create([
    \ 'windowswap',
    \ s:shortenPath(getcwd())."  ",
    \ '%3p%%'.l:spc,
    \ 'linenr',
    \ ':%3v'.l:spc,
    \ '%5o',
    \ '[%b][0x%B]'
  \])
endfunction
autocmd user AirlineAfterInit call Airline_Custom()
let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so'
let g:airline_exclude_preview = 1

syntax on

"n00b stuff
nmap <Backspace> <Nop>
nmap <Delete> <Nop>
nmap <Left> <Nop>
nmap <Down> <Nop>
nmap <Up> <Nop>
nmap <Right> <Nop>
nmap <PageUp> <Nop>
nmap <PageDown> <Nop>

" imap <Backspace> <Nop>
" imap <Delete> <Nop>
imap <Left> <Nop>
imap <Down> <Nop>
imap <Up> <Nop>
imap <Right> <Nop>
imap <PageUp> <Nop>
imap <PageDown> <Nop>
"end of n00b stuff

au BufEnter .i3blocks.conf setlocal filetype=i3blocks
au BufEnter *.zsh-theme setlocal filetype=zsh
au BufEnter .muttrc setlocal filetype=neomuttrc
au BufEnter .psqlrc setlocal filetype=pgsql
au BufEnter *.toml setlocal filetype=toml
au BufEnter *.s setlocal filetype=gas

au FileType cpp setlocal syntax=cpp.doxygen
au FileType c setlocal syntax=cpp.doxygen
au FileType *.wast setlocal syntax=wast
au FileType *.wat setlocal syntax=wast
au FileType *.uml setlocal syntax=plantuml

"python configs
"PEP-8
au FileType *.py setlocal tabstop=4
au FileType *.py setlocal softtabstop=4
au FileType *.py setlocal shiftwidth=4
" au BufNewFile,BufEnter *.py set textwidth=79
au FileType *.py setlocal expandtab
au FileType *.py setlocal autoindent
au FileType *.py setlocal fileformat=unix

"python syntax highlighting
"let g:python_slow_sync = 0
let python_highlight_all = 1
hi link pythonBuiltin Define
hi link pythonInclude PreCondit
hi link pythonClassParameters Constant
hi link pythonFunctionParameters Constant
hi link pythonExtraOperator Keyword
hi link pythonDoctest Tag
hi link pythonRawString Tag
hi link pythonTripleQuotes SpecialComment

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"mapping fast keycodes
"the key codes are for my build of st
set timeoutlen=500 ttimeoutlen=100
"Shift+F10
set <F13>=[21;2~
map <F13> <S-F10>
map! <F13> <S-F10>
"Shift+F9
set <F14>=[20;2~
map <F14> <S-F9>
map! <F14> <S-F9>
"Shift+F5
set <F15>=[15;2~
map <F15> <S-F5>
map! <F15> <S-F5>
"Shift+F1
set <F16>=[1;2P
map <F16> <S-F1>
map! <F16> <S-F1>
"Shift+F2
set <F17>=[1;2Q
map <F17> <S-F2>
map! <F17> <S-F2>
"Shift+F11
set <F18>=[23;2~
map <F18> <S-F11>
map! <F18> <S-F11>
"Shift+F12
set <F19>=[24;5~
map <F19> <S-F12>
map! <F19> <S-F12>
"Ctrl+Del
set <F20>=[3;5~
map <F20> <C-Delete>
map! <F20> <C-Delete>
"Ctrl+Ins
set <F21>=[2;5~
map <F21> <C-Insert>
map! <F21> <C-Insert>
"Ctrl+PageDown
set <F22>=[6;5~
map <F22> <C-PageDown>
map! <F22> <C-PageDown>
"Ctrl+PageUp
set <F23>=[5;5~
map <F23> <C-PageUp>
map! <F23> <C-PageUp>
"Shift+Del
set <F24>=[3;2~
map <F24> <S-Delete>
map! <F24> <S-Delete>

"cnoremap help vert help
" map <F1> <Plug>(expand_region_shrink)
" map <F2> <Plug>(expand_region_expand)
nnoremap <F1> :set rl!<CR>
inoremap <F1> <ESC>:set rl!<CR>i
nnoremap <F2> :set spell!<CR>
inoremap <F2> <ESC>:set spell!<CR>i
nnoremap <F3> :bp<CR>
nnoremap <F4> :bn<CR>
inoremap <F3> <ESC>:bp<CR>
inoremap <F4> <ESC>:bn<CR>
map <leader>w :w<CR>
noremap <C-e> :q<cr>
nnoremap <F7> :NERDTreeToggle<CR>
nnoremap <F12> :UndotreeToggle<CR>
nnoremap <F10> :vsp<cr>
nnoremap <S-F10> :sp<cr>
nnoremap <F5> :ContextToggle<CR>
map <F8> :Vista!!<CR>
augroup LatexAU
  autocmd!
  autocmd filetype tex map <F8> :VimtexTocToggle<CR>
augroup END
"reserved for tmux use
map <F6> <nop>
"messes up some other bindings
nmap Y y$
vmap Y y$
nnoremap <S-Delete> :bd<CR>
nnoremap <leader>c :call clearmatches()<CR>
inoremap <c-i> <esc>I
inoremap <c-e> <esc>A
nnoremap <leader>t :bel term<CR>
"execute current buffer
nnoremap <leader>r :!%:p<CR>
"execute current line in bash
nnoremap <leader>rl :.w !bash<CR>
augroup GoLangRun
  autocmd!
  autocmd FileType go nmap <leader>r <Plug>(go-run)
augroup end
augroup RustLangRun
  autocmd!
  autocmd FileType rust nmap <leader>r :Crun<CR>
augroup end
augroup CFamLangRun
  autocmd!
  autocmd FileType c,cpp nmap <leader>r :make run<CR>
augroup end
"FIXME
augroup JavaRun
  autocmd!
  autocmd FileType java nmap <leader>r :!gradle run<CR>
augroup end
augroup VimRun
  autocmd!
  autocmd FileType vim nmap <leader>r :so %<CR>
augroup end
nnoremap <leader>cd :cd %:p:h<cr>
"terminal vim wont do weird things when you paste things in
set pastetoggle=<F11>
nnoremap <leader>a :ALEToggle<CR>
nnoremap <leader>u :GutentagsUpdate<CR>
nnoremap <localleader>v :VimtexView<CR>
nnoremap <leader>nn :bn<CR>
nnoremap <leader>pp :bp<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" nnoremap k gk
" nnoremap gk k
" nnoremap j gj
" nnoremap gj j
nmap <leader>m :make<CR>
nmap <leader>sh :so $VIMRUNTIME/syntax/hitest.vim<CR>
nmap <c-q> :e #<cr>
vmap <c-q> :e #<cr>

nmap [q :col<CR>
nmap ]q :cnew<CR>
nmap [l :lol<CR>
nmap ]l :lnew<CR>
nmap ]c :cn<CR>
nmap [c :cp<CR>

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction
autocmd FileType markdown,html inoremap <C-b> <br/>

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

" nmap <silent> <M-k> :wincmd k<CR>
" nmap <silent> <M-j> :wincmd j<CR>
" nmap <silent> <M-h> :wincmd h<CR>
" nmap <silent> <M-l> :wincmd l<CR>

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 0
let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_preserve_zoom = 0
nnoremap <silent> <C-a>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-a>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-a>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-a>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w><C-w> :TmuxNavigatePrevious<cr>

"vim.session options
let g:session_directory = "~/.vim/session"
let g:session_autosave = "no"

" NERDTree
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*\.'. a:extension .'$#'
endfunction

augroup NerdTreeFileTypeHighlight
  autocmd!
  exec 'autocmd filetype nerdtree highlight csource ctermbg=none ctermfg=29'
  exec 'autocmd filetype nerdtree syn match csource #^\s\+.*\.c$#'
  exec 'autocmd filetype nerdtree highlight makef1 ctermbg=none ctermfg=98'
  exec 'autocmd filetype nerdtree syn match makef1 #^\s\+.*makefile$#'
  exec 'autocmd filetype nerdtree syn match makef1 #^\s\+.*Makefile$#'
augroup END
call NERDTreeHighlightFile('o', 146, 'none')
call NERDTreeHighlightFile('a', 146, 'none')
call NERDTreeHighlightFile('h', 29, 'none')
call NERDTreeHighlightFile('cpp', 32, 'none')
call NERDTreeHighlightFile('cc', 32, 'none')
call NERDTreeHighlightFile('hpp', 32, 'none')
call NERDTreeHighlightFile('makefile', 98, 'none')
call NERDTreeHighlightFile('Makefile', 98, 'none')
call NERDTreeHighlightFile('md', 27, 'none')
call NERDTreeHighlightFile('yml', 27, 'none')
call NERDTreeHighlightFile('config', 25, 'none')
call NERDTreeHighlightFile('conf', 25, 'none')
call NERDTreeHighlightFile('cfg', 25, 'none')
call NERDTreeHighlightFile('json', 25, 'none')
call NERDTreeHighlightFile('html', 23, 'none')
call NERDTreeHighlightFile('py', 22, 'none')
call NERDTreeHighlightFile('js', 202, 'none')
call NERDTreeHighlightFile('lua', 39, 'none')
call NERDTreeHighlightFile('sh', 63, 'none')
call NERDTreeHighlightFile('make', 29, 'none')
call NERDTreeHighlightFile('xml', 53, 'none')
call NERDTreeHighlightFile('vim', 37, 'none')
call NERDTreeHighlightFile('tex', 106, 'none')
call NERDTreeHighlightFile('pdf', 160, 'none')
call NERDTreeHighlightFile('tags', 75, 'none')
call NERDTreeHighlightFile('ahk', 89, 'none')
call NERDTreeHighlightFile('vimrc', 70, 'none')
call NERDTreeHighlightFile('hs', 63, 'none')
call NERDTreeHighlightFile('go', 33, 'none')
call NERDTreeHighlightFile('txt', 131, 'none')
call NERDTreeHighlightFile('uml', 69, 'none')
call NERDTreeHighlightFile('so', 146, 'none')
call NERDTreeHighlightFile('swp', 58, 'none')

let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1
highlight Directory ctermfg=28
highlight Title ctermfg=36
let NERDTreeShowLineNumbers = 1
autocmd Filetype nerdtree setlocal relativenumber
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsOS = 'unix'

"tagbar
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = 2
let g:tagbar_width = 50
let g:tagbar_ctags_bin = "/usr/bin/ctags-universal"
let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_show_tag_count = 1
let g:tagbar_scopestrs = {
    \    'class': "\uf0e8",
    \    'const': "\uf8ff",
    \    'constant': "\uf8ff",
    \    'enum': "\uf702",
    \    'field': "\uf30b",
    \    'func': "\uf794",
    \    'function': "\uf794",
    \    'getter': "\ufab6",
    \    'implementation': "\uf776",
    \    'interface': "\uf7fe",
    \    'map': "\ufb44",
    \    'member': "\uf02b",
    \    'method': "\uf6a6",
    \    'setter': "\uf7a9",
    \    'variable': "\uf71b",
    \ }
highlight TagbarSignature ctermfg=DarkBlue
"solidity ctags - by shuangjj
let g:tagbar_type_solidity = {
    \ 'ctagstype': 'solidity',
    \ 'kinds' : [
        \ 'c:contracts',
        \ 'e:events',
        \ 'f:functions',
        \ 'm:mappings',
        \ 'v:varialbes',
    \ ]
    \ }

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : '/home/bloodstalker/.cabal/bin/hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'i:instance:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type',
        \ 'i' : 'instance'
    \ },
    \ 'scope2kind' : {
        \ 'module'   : 'm',
        \ 'class'    : 'c',
        \ 'data'     : 'd',
        \ 'type'     : 't',
        \ 'instance' : 'i'
    \ }
    \ }

let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:arrays',
      \ 'P:properties',
      \ 'T:tags',
      \ 'O:objects',
      \ 'G:generator functions',
      \ 'F:functions',
      \ 'C:constructors/classes',
      \ 'M:methods',
      \ 'V:variables',
      \ 'I:imports',
      \ 'E:exports',
      \ 'S:styled components'
      \ ]}

let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'/home/devi/scripts/bin/vwtags.py'
          \ , 'ctagsargs': 'default'
          \ }

let g:tagbar_type_markdown = {
  \ 'ctagstype'	: 'markdown',
  \ 'kinds'		: [
    \ 'c:chapter:0:1',
    \ 's:section:0:1',
    \ 'S:subsection:0:1',
    \ 't:subsubsection:0:1',
    \ 'T:l4subsection:0:1',
    \ 'u:l5subsection:0:1',
  \ ],
  \ 'sro'			: '""',
  \ 'kind2scope'	: {
    \ 'c' : 'chapter',
    \ 's' : 'section',
    \ 'S' : 'subsection',
    \ 't' : 'subsubsection',
    \ 'T' : 'l4subsection',
  \ },
  \ 'scope2kind'	: {
    \ 'chapter' : 'c',
    \ 'section' : 's',
    \ 'subsection' : 'S',
    \ 'subsubsection' : 't',
    \ 'l4subsection' : 'T',
  \ },
\ }

let g:tagbar_type_tf = {
  \ 'ctagstype': 'tf',
  \ 'kinds': [
    \ 'r:Resource',
    \ 'R:Resource',
    \ 'd:Data',
    \ 'D:Data',
    \ 'v:Variable',
    \ 'V:Variable',
    \ 'p:Provider',
    \ 'P:Provider',
    \ 'm:Module',
    \ 'M:Module',
    \ 'o:Output',
    \ 'O:Output',
    \ 'f:TFVar',
    \ 'F:TFVar'
  \ ]
\ }

"doxygentoolkit
autocmd FileType *.sol let g:DoxygenToolkit_briefTag_pre="@dev  "
" let g:doxygen_enhanced_color = 1
let g:syntax_extra_java='doxygen'
let g:syntax_extra_solidity='doxygen'

"open-pdf conf
let g:pdf_convert_on_edit = 1
let g:pdf_convert_on_read = 1

"startify
let g:session_autoload="no"

"highlight groups
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

"Steve Losh's highlight function
function HighInterestingWord(n)
  normal! mz
  normal! "zyiw
  let mid = 88888 + a:n
  silent! call matchdelete(mid)
  let pat = '\V\<' . escape(@z, '\') . '\>'
  call matchadd("InterestingWord".a:n, pat, 1, mid)
  normal! `z
endfunction

"multiple highlights
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

"scratchpad
let g:scratchpad_path = '/home/devi/.scratchpads'
let g:scratchpad_ftype = ''
nmap <F9> <Plug>(ToggleScratchPad)

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}

let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_json = {
    \ 'ctagstype' : 'json',
    \ 'kinds' : [
      \ 'o:objects',
      \ 'a:arrays',
      \ 'n:numbers',
      \ 's:strings',
      \ 'b:booleans',
      \ 'z:nulls'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
    \ 'object': 'o',
      \ 'array': 'a',
      \ 'number': 'n',
      \ 'string': 's',
      \ 'boolean': 'b',
      \ 'null': 'z'
    \ },
    \ 'kind2scope': {
    \ 'o': 'object',
      \ 'a': 'array',
      \ 'n': 'number',
      \ 's': 'string',
      \ 'b': 'boolean',
      \ 'z': 'null'
    \ },
    \ 'sort' : 0
    \ }

let g:autofmt_autosave = 1

"undotree
"make sure to create the directory. vim wont do it itself
set undolevels=1000
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
let g:undotree_WindowLayout = 4

"narrow region
let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_resize_window = "relative"
vnoremap <S-F5> :<C-U>NR<cr>

"runs shell command, opens new buffer with syntax=nasm, prints command output
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright vnew
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  set syntax=nasm
  1
endfunction
"vmap <S-F2> call RunShellCommand

"by xolox
function! s:get_visual_selection()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
      return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction

let s:compiler_explorer_std_c_hdrs = ["#include <assert.h>\r", "#include <complex.h>\r",
      \"#include <ctype.h>\r","#include <errno.h>\r","#include <fenv.h>\r","#include <float.h>\r",
      \"#include <inttypes.h>\r","#include <iso646.h>\r","#include <limits.h>\r","#include <locale.h>\r",
      \"#include <math.h>\r","#include <setjmp.h>\r","#include <signal.h>\r","#include <stdalign.h>\r",
      \"#include <stdarg.h>\r","#include <stdbool.h>\r","#include <stddef.h>\r",
      \"#include <stdint.h>\r","#include <stdio.h>\r","#include <stdlib.h>\r","#include <stdnoreturn.h>\r",
      \"#include <string.h>\r","#include <tgmath.h>\r","#include <time.h>\r","#include <uchar.h>\r",
      \"#include <wchar.h>\r","#include <wctype.h>\r"]
let s:compiler_explorer_std_cpp_hdrs = ["#include <algorithm>\r","#include <cstdlib>\r","#include <csignal>\r","#include <csetjmp>\r",
      \"#include <cstdarg>\r","#include <typeinfo>\r","#include <typeindex>\r","#include <type_traits>\r",
      \"#include <bitset>\r","#include <functional>\r","#include <utility>\r","#include <ctime>\r",
      \"#include <chrono>\r","#include <cstddef>\r","#include <initializer_list>\r","#include <tuple>\r",
      \"#include <new>\r","#include <memory>\r","#include <scoped_allocator>\r","#include <climits>\r",
      \"#include <cfloat>\r","#include <cstdint>\r","#include <cinttypes>\r","#include <limits>\r",
      \"#include <exception>\r","#include <stdexcept>\r","#include <cassert>\r","#include <system_error>\r",
      \"#include <cerrno>\r","#include <cctype>\r","#include <cwctype>\r","#include <cstring>\r",
      \"#include <cwchar>\r","#include <cuchar>\r","#include <string>\r","#include <array>\r",
      \"#include <vector>\r","#include <deque>\r","#include <list>\r","#include <forward_list>\r",
      \"#include <set>\r","#include <map>\r","#include <unordered_set>\r","#include <unordered_map>\r",
      \"#include <stack>\r","#include <queue>\r","#include <algorithm>\r","#include <iterator>\r",
      \"#include <cmath>\r","#include <complex>\r","#include <valarray>\r","#include <random>\r",
      \"#include <numeric>\r","#include <ratio>\r","#include <cfenv>\r","#include <iosfwd>\r",
      \"#include <ios>\r","#include <istream>\r","#include <ostream>\r","#include <iostream>\r",
      \"#include <fstream>\r","#include <sstream>\r","#include <iomanip>\r",
      \"#include <streambuf>\r","#include <cstdio>\r","#include <locale>\r","#include <clocale>\r",
      \"#include <codecvt>\r","#include <regex>\r","#include <atomic>\r","#include <thread>\r",
      \"#include <mutex>\r","#include <shared_mutex>\r","#include <future>\r","#include <condition_variable>\r"]
"sends visual selection to compiler exlorer and gets the asm back

"should probably change this to be the complete path and make the variable
"glboal
let s:compiler_explorer_config="/ceconfig.json"
function! s:compiler_explorer()
  let temp_file = tempname()
  if &filetype == "c"
    call writefile(s:compiler_explorer_std_c_hdrs, temp_file, "a")
  elseif &filetype == "cpp"
    call writefile(s:compiler_explorer_std_cpp_hdrs, temp_file, "a")
  endif

  let source_code = s:get_visual_selection()
  call writefile(split(substitute(source_code, "\n", "\r", "g"), "\r"), temp_file, "a")
  let current_buf_name = bufname("%")
  botright vnew
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(3,substitute(getline(2),'.','=','g'))
  execute "$read!"."node"." "."~/scripts/compiler-explorer/main.js ".temp_file. " ". getcwd(0).s:compiler_explorer_config
  setlocal nomodifiable
  set syntax=nasm
  1
endfunction
command! CompilerExplorer call s:compiler_explorer()
vmap <S-F9> :<C-U>CompilerExplorer<cr>

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
vnoremap <leader>h :<C-U>PythonDoc<cr>

"ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_root_markers = ['.root']
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob "!node_modules"'
  let g:ctrlp_use_caching = 0
endif

"supertab
" let g:SuperTabSetDefaultCompletionType = "context"

"snippets
nnoremap ,cmain :1read $HOME/scripts/snippets/cmain.c<CR>
nnoremap ,cppmain :1read $HOME/scripts/snippets/cppmain.cpp<CR>
nnoremap ,pypy :1read $HOME/scripts/snippets/main.py<CR>
nnoremap ,sh :1read $HOME/scripts/snippets/shebang.sh<CR>

"highlights
highlight Search ctermfg=White ctermbg=28 cterm=Bold
highlight IncSearch ctermfg=White ctermbg=26 cterm=Bold
highlight WildMenu ctermfg=15 ctermbg=22 cterm=Bold
highlight CtrlSpaceStatus ctermfg=15 ctermbg=38
highlight StatusLine ctermfg=16 ctermbg=22 cterm=bold
highlight WarningMsg ctermbg=16 ctermfg=202
highlight vimWarn ctermbg=16 ctermfg=202
highlight vimBufnrWarn ctermbg=16 ctermfg=202
" highlight airline_tabtype ctermbg=15 ctermfg=34

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

"vimcompletesme
let g:vcm_default_maps = 0
autocmd FileType c,cpp let b:vcm_tab_complete = 'omni'
autocmd FileType lua let b:vcm_tab_complete = 'omni'
autocmd FileType go let b:vcm_tab_complete = 'omni'
autocmd FileType rust let b:vcm_tab_complete = 'omni'
autocmd FileType python let b:vcm_tab_complete = 'omni'
autocmd FileType javasript let b:vcm_tab_complete = 'omni'

"sets the dictionary for autocompletion with <C-n> and <C-p> for the
"filetypes
set dictionary+=/usr/share/dict/words
autocmd FileType markdown,text,vimwiki,tex setlocal complete+=k

"fzf
map <leader>f <Esc><Esc>:Files!<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"asterisk.vim, is.vim, incsearch.vim, edgemotion
map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" map <C-j> <Plug>(edgemotion-j)
" map <C-k> <Plug>(edgemotion-k)

let g:semanticTermColors = [27,33,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]

"camelcase and snakecase motions
"let g:camelchar = "A-Z"
"let g:camelchar = "A-Z0-9"
let g:camelchar = "A-Z0-9.,;:{([`'\"_"
nnoremap <silent><C-h> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-l> :<C-u>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-h> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-l> <C-o>:call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
vnoremap <silent><C-h> :<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>v`>o
vnoremap <silent><C-l> <Esc>`>:<C-U>call search('\C\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>v`<o
"auto-close these characters-wont work with paste set...obviously...
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"ultisnips
let g:UltiSnipsExpandTrigger="<c-u>"
" let g:UltiSnipsListSnippets="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"

"ycm
" let g:ycm_auto_hover = ""
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
nnoremap <leader>jj :YcmCompleter GoTo<CR>
nnoremap <leader>jt :YcmCompleter GoToType<CR>
nmap <leader>jw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>jd <Plug>(YCMFindSymbolInDocument)
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gc :YcmCompleter GoToDocumentOutline<CR>
nnoremap <leader>rr :YcmCompleter RefactorRename<space>
nmap <leader>D <plug>(YCMHover)
" nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
" nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_auto_hover = "CursorHold"

augroup YCMDocCFam
  autocmd!
  autocmd FileType c,cpp let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': &filetype
    \ }
augroup END
augroup YCMDocJS
  autocmd!
  autocmd FileType javascript let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': &filetype
    \ }
augroup END
augroup YCMDocPy
  autocmd!
  autocmd FileType python let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': &filetype
    \ }
augroup END
augroup YCMDocGo
  autocmd!
  autocmd FileType go let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': &filetype
    \ }
augroup END
augroup YCMDocRust
  autocmd!
  autocmd FileType rust let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': 'rust'
    \ }
augroup END
augroup YCMDocJava
  autocmd!
  autocmd FileType java let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': 'java'
    \ }
augroup END

let g:ycm_language_server = [
      \ {'name': 'vim',
      \     'filetypes': [ 'vim' ],
      \     'cmdline': [ 'vim-language-server', '--stdio' ]
      \   },
      \ {
      \     'name': 'bash',
      \     'cmdline': [ 'bash-language-server' , 'start' ],
      \     'filetypes': [ 'sh', 'bash' ],
      \   },
      \]

let g:qs_highlight_on_keys = ["f", "F", "t", "T"]

" git-messenger
let g:git_messenger_always_into_popup=v:true
nmap <silent><Leader>gg :call setbufvar(winbufnr(popup_atcursor(split(system("git log -n 1 -L " . line(".") . ",+1:" . expand("%:p")), "\n"), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>
function! s:setup_git_messenger_popup() abort
    nmap <buffer><C-o> o
    nmap <buffer><C-i> O
endfunction
autocmd FileType gitmessengerpopup call <SID>setup_git_messenger_popup()

"vim-haskell
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1
let g:haskell_disable_TH = 0

"keeps track of the cursor in insert mode, pull it back by one so it appears
"not to move when exiting insert
let CursorColumnI = 0
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

"window resizing
if bufwinnr(1)
  nnoremap <right> <c-w>>
  nnoremap <left> <c-w><
  nnoremap <up> <c-w>-
  nnoremap <down> <c-w>+
endif

"Tab navigation
nnoremap <C-PageDown> :tabprevious<CR>
nnoremap <C-PageUp>   :tabnext<CR>
nnoremap <C-Insert> :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>
inoremap <C-PageDown> <Esc>:tabprevious<CR>
inoremap <C-PageUp>   <Esc>:tabnext<CR>
inoremap <C-Insert> <Esc>:tabnew<CR>
inoremap <C-Delete> <Esc>:tabclose<CR>

"copy and paste between different Vim instances
nmap _Y :!echo ""> ~/.vi_tmp<CR><CR>:w! ~/.vi_tmp<CR>
vmap _Y :w! ~/.vi_tmp<CR>
nmap _P :r ~/.vi_tmp<CR>

"gutentags
let g:gutentags_generate_on_empty_buffer = 1
let g:gutentags_plus_nomap = 1

"run Vman for the word under the cursor
map <leader>v <Plug>(Vman)
autocmd Filetype man setlocal relativenumber
autocmd Filetype man setlocal number
let g:vim_man_cmd = 'man -O width=200'
" let g:vim_man_cmd = 'xman'

"context
let g:context_enabled = 0
let g:context_add_mappings = 0
let g:context_presenter = 'vim-popup'

augroup AUSpell
  autocmd!
  autocmd FileType markdown,txt,vimwiki,tex setlocal spell
augroup END

augroup MDInsert
  autocmd!
  autocmd FileType markdown,vimwiki,pandoc imap <C-b> </br>
augroup END

nnoremap <leader>b :Make<CR>
command -nargs=* Make call s:make(<q-args>)

let s:making = 0
function s:make(args) abort
  if s:making
    if bufwinid(s:make_buf) == -1
      "show making buffer
      exe 'sbuffer' s:make_buf
      wincmd p
    else
      "hide making buffer
      exe printf('%d wincmd q', bufwinnr(s:make_buf))
    endif
    return
  endif

  "delete last result
  if exists('s:make_buf') && bufexists(s:make_buf)
    silent! exe 'bdelete' s:make_buf
  endif

  "spawn new make
  let cmd = 'make'
  if !empty(a:args)
    let cmd.= ' ' . a:args
  endif

  let options = {'close_cb': function('s:make_callback'), 'term_rows': 10}
    let s:make_buf = term_start(cmd, options)
    let s:making = 1
    wincmd p
endfunction

function s:make_callback(channel)
  "look, you can not get buffer content directly here.
  call timer_start(10, function('s:make_callback_impl'))
endfunction

function s:make_callback_impl(timer) abort
  exe 'cgetbuffer' s:make_buf
  "consider entry with num zero bufnr and lnum an error or warning
  let qfl = filter(getqflist(), {k,v -> v.bufnr != 0 && v.lnum != 0})
  if empty(qfl)
    echo "make successful"
  else
    echohl WarningMsg
    echom printf('found %d qf entries', len(qfl))
    echohl None
  endif
  let s:making = 0
endfunction

"arpeggio mappings
try
  call arpeggio#map('i', '', 0, 'jk', '<Esc>')
catch
endtry

let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1

let g:goyo_width = 120
let g:goyo_height = 85

nnoremap <leader>ss :SignifyToggleHighligh<CR>
let g:startify_files_number = 20
let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

"ale
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_disable_lsp = 1
let g:ale_change_sign_column_color = 1
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight AleWarning ctermbg=25
highlight AleWarningSign ctermbg=25
augroup ALEJS
  autocmd!
  autocmd FileType javascript let b:ale_linters = {'javascript': ['eslint']}
  autocmd FileType javascript let b:ale_fixers = {'javascript': ['prettier']}
augroup END
let g:ale_python_black_options = "--line-length 79"
let b:ale_python_flake8_options = "--ignore=E203,W503"
let b:ale_python_isort_options = "--multiline 3 --profile black"
augroup ALEPY
  autocmd!
  autocmd FileType python let b:ale_linters = {'python': ['flake8','mypy', 'pylint', 'bandit']}
  autocmd FileType python let b:ale_fixers = {'python': ['black', 'isort']}
augroup END
augroup ALERUBY
  autocmd!
  autocmd FileType ruby let b:ale_linters = {'ruby': ['rubocop']}
  autocmd FileType ruby let b:ale_fixers = {'ruby': ['rubocop']}
augroup END
augroup ALEMARKDOWN
  autocmd!
  autocmd FileType markdown let b:ale_linters = {'markdown': ['markdownlint']}
augroup END
let b:ale_c_flawfinder_executable= "/home/devi/devi/flawfinder/flawfinder-2.0.19/flawfinder.py"
augroup ALEC
  autocmd!
  autocmd FileType c let b:ale_linters = {'c': ['clang-tidy', 'flawfinder']}
  autocmd FileType c let b:ale_fixers = {'c': ['clang-format']}
augroup END
let b:ale_cpp_flawfinder_executable= "/home/devi/devi/flawfinder/flawfinder-2.0.19/flawfinder.py"
augroup ALECPP
  autocmd!
  autocmd FileType cpp let b:ale_linters = {'cpp': ['clang-tidy', 'flawfinder']}
  autocmd FileType cpp let b:ale_fixers = {'cpp': ['clang-format']}
augroup END
augroup ALEHTML
  autocmd!
  autocmd FileType html let b:ale_linters = {'html': ['htmlhint']}
  autocmd FileType html let b:ale_fixers = {'html': ['prettier']}
augroup END
" let g:ale_java_google_java_format_options="-i"
augroup ALEJAVA
  autocmd!
  autocmd FileType java let b:ale_linters = {'java': ['checkstyle']}
  autocmd FileType java let b:ale_fixers = {'java': ['google_java_format']}
augroup END
augroup ALELUA
  autocmd!
  autocmd FileType lua let b:ale_linters = {'lua': ['luacheck']}
  autocmd FileType lua let b:ale_fixers = {'lua': ['lua-format']}
augroup END
augroup ALEDOCKER
  autocmd!
  autocmd FileType Dockerfile let b:ale_linters = {'Dockerfile': ['hadolint']}
augroup END
" let b:ale_sh_shfmt_options = '-w -p -i=2 -bn -ci -sr -kp'
let b:ale_sh_shfmt_options = "-w -"
let b:ale_sh_shellcheck_options = '-x'
augroup ALESH
  autocmd!
  autocmd FileType sh,bash let b:ale_linters = {'sh': ['shellcheck']}
  autocmd FileType sh,bash let b:ale_fixers = {'sh': ['shfmt']}
augroup END
augroup ALECSS
  autocmd!
  autocmd FileType css let b:ale_fixers = {'css': ['prettier']}
augroup END

" we can edit gzip files because of this
augroup gzip
 autocmd!
 autocmd BufReadPre,FileReadPre *.gz set bin
 autocmd BufReadPost,FileReadPost   *.gz '[,']!gunzip
 autocmd BufReadPost,FileReadPost   *.gz set nobin
 autocmd BufReadPost,FileReadPost   *.gz execute ":doautocmd BufReadPost " . expand("%:r")
 autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
 autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r
 autocmd FileAppendPre      *.gz !gunzip <afile>
 autocmd FileAppendPre      *.gz !mv <afile>:r <afile>
 autocmd FileAppendPost     *.gz !mv <afile> <afile>:r
 autocmd FileAppendPost     *.gz !gzip <afile>:r
augroup END

"latex
let g:tex_flavor = 'latex'
let g:vimtex_matchparen_enabled = 0
let g:vimtex_view_method = 'zathura'

"indent guide
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_tab_guides = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'man', 'vimwiki', 'go', 'markdown', 'vista', 'floaterm', 'popup']
let g:indent_guides_default_mapping = 0

"ctrlspace
if executable("rg")
  let g:CtrlSpaceGlobCommand = 'rg -l --color never -g ""'
endif
hi CtrlSpaceNormal ctermfg=36 ctermbg=NONE
hi CtrlSpaceSelected ctermbg=27 ctermfg=15
hi CtrlSpaceSearch ctermfg=25 ctermbg=NONE
hi CtrlSpaceStatusLine ctermfg=99 ctermbg=NONE cterm=bold
let g:CtrlSpaceSetDefaultMapping = 1

"vim-go
let g:go_auto_sameids = 0
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_parameters = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1
let g:go_doc_popup_window = 1
let g:go_code_completion_enabled = 0

"easymotion
hi EasyMotionTarget ctermbg=none ctermfg=22 cterm=bold
hi EasyMotionShade  ctermbg=none ctermfg=darkgrey
hi EasyMotionTarget2First ctermbg=none ctermfg=33 cterm=bold
hi EasyMotionTarget2Second ctermbg=none ctermfg=39 cterm=bold
hi EasyMotionMoveHL ctermbg=green ctermfg=black
hi EasyMotionIncSearch ctermbg=green ctermfg=black

"maximizer
let g:maximizer_set_default_mapping = 0
nnoremap <silent><leader>z :MaximizerToggle!<CR>
vnoremap <silent><leader>z :MaximizerToggle!<CR>gv
inoremap <silent><leader>z <C-o>:MaximizerToggle!<CR>

"pgsql
let g:sql_type_default = 'pgsql'
augroup PGSQL
  autocmd!
  autocmd FileType sql let b:sql_type_override='pgsql' | set ft=sql
augroup END
let g:pgsql_pl = ['python']

" uses " register to keep last cursor position in buffers
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

"checkbashism
if executable("checkbashisms")
    autocmd FileType sh compiler checkbashisms
endif
let g:checkbashisms_cwindow = 1
let g:checkbashisms_onwrite = 1

"css
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

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

if has("gui")
  " set guifont=DejaVu_Sans_Mono_for_Powerline:h10
  set guioptions-=m
  set guioptions-=T
  set guioptions-=L
  set guioptions-=r
endif

"vimwiki
let wiki = {}
let wiki.path = '~/wikis/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c':'c', 'go':'go', 'javascript':'javascript', 'sh':'sh', 'yaml':'yaml', 'Dockerfile':'Dockerfile'}
let g:vimwiki_list = [wiki]
let g:vimwiki_global_ext = 0
" let g:vimwiki_list = [{'path': '~/devi/devi/work/vimwiki.git/master', 'syntax': 'markdown', 'ext': '.wiki'}]

" tldr
let g:tldr_enabled_categories = ["linux", "common", "windows"]
function! s:tldrdoc()
  let l:vword = expand("<cword>")
  call tldr#run(l:vword)
endfunction
" command! -complete=shellcmd -nargs=0 TLDRDoc call s:tldrdoc()
nnoremap <leader>tt :<C-U>TLDRDoc<cr>
vnoremap <leader>tt :<C-U>TLDRDoc<cr>

" cheat.sh
let g:CheatSheetDefaultMode = 0
let g:CheatSheetDefaultSelection="word"
let g:CheatSheetReaderCmd='vert new'
let g:CheatPager='less --RAW-CONTROL-CHARS --ignore-case --status-column --LONG-PROMPT --HILITE-UNREAD --tabs=2'
let g:CheatSheetPagerStyle="native"

" vista
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
let g:vista_sidebar_width = 50
let g:vista_echo_cursor_strategy = "both"
let g:vista_executive_for = {
    \ 'vimwiki': 'markdown',
    \ 'pandoc': 'markdown',
    \ 'markdown': 'toc',
    \ }
let g:vista_stay_on_open = 0
" let g:vista_no_mappings = 1
autocmd FileType vista,vista_kind nnoremap <buffer> <silent> :<c-u>call vista#finder#fzf#Run()<CR>

" recutils
let g:recutils_no_maps = 1

" info
augroup VIMINFO
  autocmd!
  autocmd FileType info set number
  autocmd FileType info nmap <buffer> gu <Plug>(InfoUp)
  autocmd FileType info nmap <buffer> gn <Plug>(InfoNext)
  autocmd FileType info nmap <buffer> gp <Plug>(InfoPrev)
  autocmd FileType info nmap <buffer> gm <Plug>(InfoMenu)
  autocmd FileType info nmap <buffer> gf <Plug>(InfoFollow)
augroup END
function! s:infovim()
  let l:vword = expand("<cword>")
  execute 'vert Info' l:vword
endfunction
command! InfoVimF1 call s:infovim()
nnoremap <leader>i :<C-U>InfoVimF1<cr>
vnoremap <leader>i :<C-U>InfoVimF1<cr>
function! s:vvman(one, two)
  execute 'Vman' a:one a:two
endfunction
let g:Infofallback = function("s:vvman")

" fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

" vim-bookmarks
let g:bookmark_no_default_key_mappings=1
nmap <Leader>mm <Plug>BookmarkToggle
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>ma <Plug>BookmarkShowAll
nmap <Leader>mj <Plug>BookmarkNext
nmap <Leader>mk <Plug>BookmarkPrev
nmap <Leader>mc <Plug>BookmarkClear
nmap <Leader>mx <Plug>BookmarkClearAll
nmap <Leader>mkk <Plug>BookmarkMoveUp
nmap <Leader>mjj <Plug>BookmarkMoveDown
nmap <Leader>mg <Plug>BookmarkMoveToLine
" let g:bookmark_save_per_working_dir=1
let g:bookmark_auto_save=1
let g:bookmark_location_list=1
let g:bookmark_manage_per_buffer=1
highlight BookmarkLine ctermbg=23 ctermfg=0 cterm=bold
highlight BookmarkAnnotationLine ctermbg=23 ctermfg=0 cterm=bold
let g:bookmark_highlight_lines=1
" Finds the Git super-project directory based on the file passed as an argument.
function! g:BMBufferFileLocation(file)
    let filename = 'vim-bookmarks'
    let location = ''
    if isdirectory(fnamemodify(a:file, ":p:h").'/.git')
        " Current work dir is git's work tree
        let location = fnamemodify(a:file, ":p:h").'/.git'
    else
        " Look upwards (at parents) for a directory named '.git'
        let location = finddir('.git', fnamemodify(a:file, ":p:h").'/.;')
    endif
    if len(location) > 0
        return simplify(location.'/.'.filename)
    else
        return simplify(fnamemodify(a:file, ":p:h").'/.'.filename)
    endif
endfunction

"this should be here at the end so nothing else could override it
hi SpecialKey ctermbg=16
hi Pmenu ctermbg=233
hi SignColumn ctermbg=16
hi Exception ctermbg=None ctermfg=61
hi ALEInfoSign ctermbg=97
hi ALEWarningSign ctermbg=203
hi ALEStyleWarning ctermbg=203
hi ALEStyleWarningSign ctermbg=203
