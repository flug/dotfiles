"autoload plugin
call pathogen#infect()

" don't try to be compatible with old specs of vi
set nocompatible

" add some color
syntax on

set modelines=0
set encoding=utf-8
set scrolloff=3
set showmode

set hidden
set visualbell
set cursorline
set ttyfast

" display line numbers relative to the current line
set relativenumber

" save undo history to a file
set undofile

colorscheme solarized
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

set background=dark
filetype on
filetype plugin on

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.git|\.hg|\.svn|\.settings|\.sass-cache|cache|.rsync_cache)$',
  \ 'file': '.un\~$\|.project$\|.buildpath$\|composer.phar$',
  \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_extensions = ['tag']

set tags+=.git/tags

" remove trailing spaces
autocmd FileType less,sass,yml,css,html,php,twig,xml,yaml,sh autocmd BufWritePre <buffer> :call setline(1, map(getline(1,'$'), 'substitute(v:val,"\\s\\+$","","")'))
autocmd BufRead,BufNewFile /etc/nginx/* setf nginx

set grepprg=ack-grep\ --ignore-dir\ cache\ --ignore-dir\ .rsync_cache\ --ignore-dir\ web/bundles\ --follow\ --smart-case

set keywordprg=pman

" php related stuff
set makeprg=php\ -ln\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

cabbr <expr> %% expand('%:p:h')
set incsearch
set gdefault

"clear the highlighting
nnoremap <leader><space> :noh<cr>
set cc=80

" Vim UI {
    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter
    " show commands at the bottom right
    set showcmd
    set ruler
    set laststatus=2

    let g:airline_powerline_fonts = 1
    let g:airline_theme='solarized'
    set backspace=indent,eol,start
    set ignorecase
    set smartcase
    set wildmode=longest,list,full
    set wildmenu
    :highlight ExtraWhitespace ctermbg=red guibg=red
    :autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
" }

let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 0

let g:php_cs_fixer_path = "~/bin/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "all"                " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
let g:php_cs_fixer_fixers_list = ""             " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                  " Return the output of command if 1, else an inline information.

let g:gitgutter_eager = 0 " Avoid gitgutter lag

inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

:command! -bang -range -nargs=1 -complete=file MoveWrite  <line1>,<line2>write<bang> <args> | <line1>,<line2>delete _
:command! -bang -range -nargs=1 -complete=file MoveAppend <line1>,<line2>write<bang> >> <args> | <line1>,<line2>delete _

" Key (re)Mappings {
  " disable noob keys
  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  inoremap <up> <nop>
  inoremap <down> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>

  " @see http://stackoverflow.com/questions/80677/what-is-the-difference-between-c-c-and-c-in-vim
  inoremap <C-c> <Esc><Esc>

  "Make moving around windows faster
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
" }
