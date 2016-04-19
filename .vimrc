" ~/.vimrc

set bg=dark
set expandtab
set ignorecase
set noai
set nocompatible
set noerrorbells visualbell
set nomodeline
set nowrap
set ruler
set shiftwidth=4
set softtabstop=4
set tabstop=8
set textwidth=0

syntax on

noremap <F1> zz
noremap <F2> :set hls! \| echo "hls = ".&hls<CR>
noremap <F3> :set ignorecase! \| echo "ignorecase = ".&ignorecase<CR>
noremap <F4> :set wrap! \| echo "wrap = ".&wrap<CR>
noremap <F5> :%s/\s\+$//<CR>

augroup buffer-cd
    autocmd!
    autocmd BufEnter * if "" != bufname("%") && isdirectory(expand("%:p:h"))|cd %:p:h|endif
augroup END

