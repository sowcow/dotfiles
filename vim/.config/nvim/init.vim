call plug#begin('~/.local/share/nvim/plugged')

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsListSnippets="<c-t>"

:nmap <F1> :w<CR>
:nmap <F2> :w<CR>
:nmap <F3> :w<CR>
:nmap <F4> :w<CR>
:nmap <F5> :w<CR>
:nmap <F6> :w<CR>
:nmap <F7> :w<CR>
:nmap <F8> :w<CR>

:nmap <F9> :wq<CR>
:nmap <F10> :wq<CR>
:nmap <F11> :wq<CR>
:nmap <F12> :wq<CR>

:imap <F1> <Esc><F1>a
:imap <F2> <Esc><F1>a
:imap <F3> <Esc><F1>a
:imap <F4> <Esc><F1>a
:imap <F5> <Esc><F1>a
:imap <F6> <Esc><F1>a
:imap <F7> <Esc><F1>a
:imap <F8> <Esc><F1>a

:imap <F9> <Esc><F9>a
:imap <F10> <Esc><F9>a
:imap <F11> <Esc><F9>a
:imap <F12> <Esc><F9>a

:imap ∇ <Esc>:w<CR>:noh<CR>
:nmap ∇ :w<CR>:noh<CR>

nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j











:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

:nmap <c-q> :q<CR>
:imap <c-q> <Esc>:q<CR>

:nmap <c-x> <Nop>
:imap <c-x> <Nop>
:nmap <c-a> <Nop>
:imap <c-a> <Nop>

" Plug 'vim-syntastic/syntastic'

Plug 'preservim/nerdtree'

Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

" trying new autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" nicety :ColorHighlight
Plug 'chrisbra/Colorizer'

" Snippets!
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<f1>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsUsePythonVersion = 3

" fmt/lint
" Plug 'w0rp/ale'
" let g:ale_fixers = {'javascript': ['prettier_standard']}
" let g:ale_linters = {'javascript': ['']}
" let g:ale_fix_on_save = 1


" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
"Plug 'Shougo/neco-syntax'

Plug 'dag/vim-fish'

" Plug 'jceb/vim-orgmode'

" Plug 'carlitux/deoplete-ternjs'
", { 'do': 'npm install -g tern' }

" Plug 'posva/vim-vue'  " trying it

Plug 'sakshamgupta05/vim-todo-highlight' " saner highliting

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'         " act - comment
Plug 'pangloss/vim-javascript'          " good looks
"Plug 'mxw/vim-jsx'                    " good looks

Plug 'jason0x43/vim-js-indent'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'Quramy/tsuquyomi'
"Plug 'MaxMEllon/vim-jsx-pretty'                    " good looks
" it fucks with typescript indenting

Plug 'vim-ruby/vim-ruby'                " good looks
"Plug 'leafgarland/typescript-vim'       " good looks
"let g:typescript_indent_disable = 1 "wtf

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
"Plug 'Galooshi/vim-import-js'
"
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}


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

let g:gruvbox_contrast_dark = 'hard'
set background=dark

autocmd BufWritePre * %s/\s\+$//e


" XXX: maybe I will undo this comment
au BufNewFile,BufRead *.js map , :A<cr>
au BufNewFile,BufRead *.css map , :A<cr>
au BufNewFile,BufRead *.hbs map , :A<cr>

au BufNewFile,BufRead *.rb map , :w<cr>:!ruby %<cr>
au BufNewFile,BufRead *.R map , :w<cr>:!Rscript %<cr>
au BufNewFile,BufRead *.ts map , :w<cr>:!ts-node -O '{"target": "es6"}' %<cr>
au BufNewFile,BufRead *.py map , :w<cr>:!python %<cr>
au BufNewFile,BufRead *.js map , :w<cr>:!node %<cr>
au BufNewFile,BufRead Rakefile map , :w<cr>:!rake<cr>
au BufNewFile,BufRead *.rs map , :w<cr>:!cargo run<cr>
au BufNewFile,BufRead *.dot map , :w<cr>:!dot -Tpng % -o %.png<cr>
au BufNewFile,BufRead *.fish map , :w<cr>:!source %<cr>
"
"
"
"

" au BufNewFile,BufRead *.ts map , :w<cr>:!swc % -C jsc.parser.syntax=typescript -C module.type=commonjs -o _build.js && node _build.js<cr>

" au BufNewFile,BufRead *.ts :set sw=4
" au BufNewFile,BufRead *.ts :set ts=4

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
"""
"""
""""au BufNewFile,BufRead *.clj map , :w<cr>:!clojure %<cr>
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

let g:js_file_import_omit_semicolon = 1

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

set wildignore=*.o,*.obj,*~
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" omg shut it down
" set indentexpr&
" set indentexpr=
" Switch off all auto-indenting
au BufNewFile,BufRead *.ts set nocindent
au BufNewFile,BufRead *.ts set nosmartindent
" set noautoindent
au BufNewFile,BufRead *.ts set indentexpr=
au BufNewFile,BufRead *.ts filetype indent off
au BufNewFile,BufRead *.ts filetype plugin indent off

"-- FOLDING --
"set foldmethod=syntax "syntax highlighting items specify folds
"set foldcolumn=1 "defines 1 col at window left, to indicate folding
"let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
" set foldlevelstart=0

"""""""""""""""""""""""""""""
" C++
"""""""""""""""""""""""""""""

" au BufNewFile,BufRead *.cpp map , :w<cr>:!make %< && ./%<<cr>
au BufNewFile,BufRead *.cpp map , :w<cr>:!make run<cr>
au BufNewFile,BufRead *.cpp set ts=4
au BufNewFile,BufRead *.cpp set sw=4
" au BufNewFile,BufRead *.cpp set cindent
" au BufNewFile,BufRead *.cpp set smartindent

" gnome desktop switching is not messing with vim
map <C-A-down> <Nop>
map <C-A-up> <Nop>
map <C-A-left> <Nop>
map <C-A-right> <Nop>
imap <C-A-down> <Nop>
imap <C-A-up> <Nop>
imap <C-A-left> <Nop>
imap <C-A-right> <Nop>

function! GetAllSnippets()
  call UltiSnips#SnippetsInCurrentScope(1)
  let list = []
  for [key, info] in items(g:current_ulti_dict_info)
    let parts = split(info.location, ':')
    call add(list, {
      \"key": key,
      \"path": parts[0],
      \"linenr": parts[1],
      \"description": info.description,
      \})
  endfor
  return list
endfunction


" let g:js_file_import_no_mappings = 1
" nmap <C-i> <Plug>(JsFileImport)
" nmap <C-u> <Plug>(PromptJsFileImport)

let g:gutentags_cache_dir = '~/tags'
let g:gutentags_project_root = ['Diagram.ts', 'package.json', 'Gemfile']








" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
