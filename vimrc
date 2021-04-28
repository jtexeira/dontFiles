if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync 
    autocmd VimEnter * CocInstall rust-rls
    autocmd VimEnter * CocInstall coc-java
    autocmd VimEnter * CocInstall coc-clangd
    autocmd VimEnter * CocInstall coc-json
    autocmd VimEnter * CocInstall coc-vimtex
endif

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'chriskempson/base16-vim'
Plug 'lervag/vimtex'

call plug#end()

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set iskeyword-=_
retab

autocmd Filetype markdown call SetWritingOpts()
autocmd Filetype tex call SetWritingOpts()
function SetWritingOpts()
    set linebreak
    set tw=80
    inoremap `A A
    inoremap `E É
    inoremap `a à
    inoremap `e é
    inoremap `o ó
    inoremap `u ú
    iabbrev ~a ã
    iabbrev tb também
    iabbrev nao não
    iabbrev sao são
    iabbrev ja já
    iabbrev numero número
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> j gj
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$
endfunction

autocmd FileType tex call SetTexOpts()
function SetTexOpts()
    map <leader>r :silent !pdflatex --shell-escape %:p > /dev/null &<Return>
    command! Re !pdflatex --shell-escape %:p
    command! Wre w <bar> !pdflatex --shell-escape %:p

    inoremap ,tt \texttt{}<Space><++><Esc>T{i
    inoremap ,ve \verb!!<Space><++><Esc>T!i
    inoremap ,bf \textbf{}<Space><++><Esc>T{i
    inoremap ,it \textit{}<Space><++><Esc>T{i
    inoremap ,st \section{}<Return><Return><++><Esc>2kt}a
    inoremap ,sst \subsection{}<Return><Return><++><Esc>2kt}a
    inoremap ,ssst \subsubsection{}<Return><Return><++><Esc>2kt}a
    inoremap ,bit \begin{itemize}<CR><CR>\end{itemize}<Return><++><Esc>kki<Tab>\item<Space>
    inoremap ,bfi \begin{figure}[H]<CR><CR>\end{figure}<Return><++><Esc>kki<Tab>\centering<CR><Tab>\includegraphics{}<CR>\caption{<++>}<Esc>k$i
    inoremap ,beg \begin{<++>}<Esc>yyp0fbcwend<Esc>O<Tab><++><Esc>k0<Esc>/<++><Enter>"_c4l
endfunction

autocmd FileType coq inoremap ,for ∀
set scrolloff=4
set undodir=~/.cache/vimundo
set undofile
set title

command! Q qa

" Fast replace
nnoremap s :s//g<Left><Left>
nnoremap S :%s//g<Left><Left>
vnoremap s :s//g<Left><Left>
