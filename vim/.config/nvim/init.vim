call plug#begin('~/.local/share/nvim/plugged')

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsListSnippets="<c-t>"

:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

Plug 'morhetz/gruvbox'
"Plug 'dracula/vim', { 'as': 'dracula' }

" Snippets!
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3


Plug 'sakshamgupta05/vim-todo-highlight' " saner highliting

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'         " act - comment
Plug 'pangloss/vim-javascript'          " good looks
Plug 'mxw/vim-jsx'                    " good looks
Plug 'vim-ruby/vim-ruby'                " good looks
Plug 'leafgarland/typescript-vim'       " good looks
Plug 'wavded/vim-stylus'                " good looks
Plug 'mustache/vim-mustache-handlebars' " good looks
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }  " good looks
Plug 'kien/rainbow_parentheses.vim'  " good looks
Plug 'hail2u/vim-css3-syntax'  " good looks
Plug 'rust-lang/rust.vim'  " good looks
Plug 'asciidoc/vim-asciidoc'  " good looks
Plug 'cespare/vim-toml'  " good looks
Plug 'racer-rust/vim-racer'  " rust active perfomance
Plug 'tpope/vim-projectionist'          " navigate
"
"Plug 'karthikv/tradeship-vim'           " js active perfomance
Plug 'Galooshi/vim-import-js'
"
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}


call plug#end()


if &compatible
  set nocompatible
endif

set ts=2
set sw=2
set expandtab

set nu
"colorscheme flattened_dark
"colorscheme darkblue
"colorscheme dracula
colorscheme gruvbox
set background=dark

let g:gruvbox_contrast_dark = 'hard'

autocmd BufWritePre * %s/\s\+$//e


au BufNewFile,BufRead *.js map , :A<cr>
au BufNewFile,BufRead *.css map , :A<cr>
au BufNewFile,BufRead *.hbs map , :A<cr>

au BufNewFile,BufRead *.rb map , :w<cr>:!ruby %<cr>


"""filetype off
"""" append to runtime path
"""set rtp+=/usr/share/vim/vimfiles
"""" initialize dein, plugins are installed to this directory
"""call dein#begin(expand('~/.cache/dein'))
"""
"""""""""""""""""""""""""""""""""""""""""
"""call dein#add('raichoo/purescript-vim')  " good looks

"""
"""
"""
""""call dein#add('scrooloose/nerdcommenter')         " act - comment
"""
""""call dein#add('junegunn/vim-easy-align')  " nicety for my alignment
"""
"""""""""""""""""""""""""""""""""""""""""""
"""" exit dein
"""call dein#end()
"""" auto-install missing packages on startup
"""if dein#check_install()
"""  call dein#install()
"""endif
"""filetype plugin on
"""
"""
""""autocmd FileType apache setlocal commentstring=#\ %s<Paste>
"""
"""
"""
"""""au BufNewFile,BufRead *.js map , :w<cr>:!node %<cr>
"""
"""
""""au BufNewFile,BufRead *.clj map , :w<cr>:!clojure %<cr>
""""au BufNewFile,BufRead Rakefile map , :w<cr>:!rake<cr>
""""au BufNewFile,BufRead *.sh map , :w<cr>:!bash %<cr>
""""map <C-,> :A<cr>
"""""au BufNewFile,BufRead *.js map ; yawIlet <esc>A = this.get('')<esc>hhp
"""
""""au BufNewFile,BufRead *.js map <F4> :w<cr>:!node %<cr>
""""au BufNewFile,BufRead *.rb map <F4> :w<cr>:!ruby %<cr>
"""
"""
"""
"""
"""au BufNewFile,BufRead *.css abbreviate !i !important
"""
"""
"""
"""
"""" JS
"""let g:javascript_conceal_function             = "ƒ"
"""let g:javascript_conceal_null                 = "ø"
"""let g:javascript_conceal_this                 = "@"
"""" let g:javascript_conceal_return               = "⇚"
"""let g:javascript_conceal_undefined            = "¿"
"""" let g:javascript_conceal_NaN                  = "ℕ"
"""let g:javascript_conceal_prototype            = "¶"
"""let g:javascript_conceal_static               = "•"
"""let g:javascript_conceal_super                = "Ω"
"""" let g:javascript_conceal_arrow_function       = "⇒"
"""" let g:javascript_conceal_noarg_arrow_function = "🞅"
"""" let g:javascript_conceal_underscore_arrow_function = "🞅"
"""
"""
"""set conceallevel=1
"""
"""
"""set backupdir=~/.vim/backup//
"""set directory=~/.vim/swap//
"""set undodir=~/.vim/undo//
"""
"""set shell=/usr/bin/bash
"""
"""
""""nnoremap <F8> :echo shellescape(expand('<cword>'))<Cr>
"""nnoremap <F8> :execute ':!ruby ~/MY/vim-js/main.rb ' . shellescape(expand('%:p')) . ' ' . shellescape(getline('.')) . ' ' . shellescape(expand('<cword>'))<cr>
""""shellescape(expand('<cword>'))<Cr>
"""
"""
"""nnoremap <F5> :w<cr>:so %<cr>
"""
"""
""""set term=screen-256color
"""
"""
"""
"""
"""set hidden
"""let g:racer_cmd = "~/.cargo/bin/racer"
"""au FileType rust nmap gd <Plug>(rust-def)
"""au FileType rust nmap gs <Plug>(rust-def-split)
"""au FileType rust nmap gx <Plug>(rust-def-vertical)
"""au FileType rust nmap <leader>gd <Plug>(rust-doc)
"""let g:racer_experimental_completer = 1
"""
"""
""""compiler asciidoctor
"""
"""
"""xmap ga <Plug>(EasyAlign)
"""" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"""nmap ga <Plug>(EasyAlign)
"""
"""


" let g:todo_highlight_disable_default = ['TODO', 'FIXME']

let g:todo_highlight_config = {
      \   'TODO': {},
      \   'FIXME': {},
      \   'NOTE': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#ffbd2a',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '214'
      \   }
      \ }