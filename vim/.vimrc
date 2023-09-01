set encoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" list of my plugins.
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'sekel/vim-vue-syntastic'
Plug 'nvie/vim-flake8'
Plug 'tomasiser/vim-code-dark'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'iamcco/markdown-preview.vim'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'Yggdroot/indentLine'
Plug 'peitalin/vim-jsx-pretty'
" Plug 'posva/vim-vue'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
" Plug 'storyn26383/vim-vue'
" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'mxw/vim-jsx'
Plug 'wakatime/vim-wakatime'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType vue setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType sass setlocal ts=2 sts=2 sw=2
autocmd FileType python setlocal ts=4 sts=4 sw=4 tw=79 expandtab autoindent
autocmd FileType python setlocal fileformat=unix
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

set nu
set clipboard=unnamed

set shortmess+=c

"for netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
" nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
let NERDTreeCustomOpenArgs={'file':{ 'where':'t'}}

let g:NERDTreeIgnore = ['^node_modules$', '^__pycache__$', '$_env']

let g:vue_pre_processors = []

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" " Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" function! IsNERDTreeOpen()        
"     return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"   endfunction

" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == 
"primary") | q | endif 




" Use <C-l> for trigger snippet expand.
"
" " Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
"
"" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'
"
"" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
" xmap <leader>x  <Plug>(coc-convert-snippet)"
" "
" "

"color scheme
set t_Co=256
set t_ut=

if has('gui_running')
  colorscheme codedark
else
  colorscheme codedark
endif


let python_highlight_all=1
syntax on

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate')
  os.system(". " + activate_this)
EOF

" Enable folding
set foldmethod=indent
set foldlevel=99

" For Simply fold
let g:SimpylFold_docstring_preview=1

let g:NERDTreeGitStatusWithFlags = 1

" For youcomplete
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"for tagalong.
let g:tagalong_verbose = 1

"for ale.
let g:ale_completion_enabled = 1
let g:ale_fixers = {
 \ 'html': ['prettier'],
 \ 'css': ['stylelint'],
 \ 'javascript': ['prettier'],
 \ 'javascriptreact': ['eslint'],
 \}
let g:ale_linters = {
 \ 'html': ['htmlhint'],
 \ 'css': ['stylelint'],
 \ 'javascript': ['eslint'],
 \ 'javascriptreact': ['eslint'],
 \ 'python': ['flake8', 'pylint', 'bandit', 'pycodestyle'],
 \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌' " Less aggressive than the default '>>'
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

"For Emmet
let g:user_emmet_leader_key='<C-Z>'

"THIS IS FOR CLOSE TAGS
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,vue'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

if &term =~ '^xterm'
    " solid underscore
    let &t_SI .= "\<Esc>[1 q"
    "     " solid block
    let &t_EI .= "\<Esc>[6 q"
    "         " 1 or 0 -> blinking block
    "           " 3 -> blinking underscore
    "             " Recent versions of xterm (282 or above) also support
    "               " 5 -> blinking vertical bar
    "                 " 6 -> solid vertical bar
    augroup windows_term
      autocmd!
      autocmd VimEnter * silent !echo -ne "\e[1 q" 
      autocmd VimLeave * silent !echo -ne "\e[5 q" 
    augroup END
      "]"
      "]"
endif

" https://github.com/neoclide/coc.nvim/issues/856
if $NVM_BIN != ""
  let g:coc_node_path = '$NVM_BIN/node'
endif

" for coc
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
