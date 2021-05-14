set tabstop=2
"set softtabstop=4
set shiftwidth=2
set noexpandtab
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

set tags=./tags
