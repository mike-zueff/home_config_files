" vim-plug and the related stuff.
if empty(glob("~/.vim"))
  let g:vimrc_is_bundle_installation_required=1
  silent !curl --create-dirs --output ~/.vim/autoload/plug.vim
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'simeji/winresizer'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
call plug#end()

if exists("g:vimrc_is_bundle_installation_required")
  PlugUpdate
  call mkdir(expand("~/.vim/undodir"))
  qall
endif

" Automatic commands.
autocmd FileType diff setlocal colorcolumn=82
autocmd FileType fugitiveblame setlocal colorcolumn&
autocmd FileType gitcommit setlocal colorcolumn&
autocmd FileType gundo setlocal colorcolumn&
autocmd FileType help setlocal colorcolumn&
autocmd FileType nerdtree setlocal colorcolumn&
autocmd FileType qf setlocal colorcolumn&
autocmd FileType tagbar setlocal colorcolumn&
autocmd FileType vim-plug setlocal colorcolumn&
autocmd VimResized * execute "normal\<c-w>="

" Color scheme and the related stuff.
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_invert_tabline=1
colorscheme gruvbox

" Commands.
command!GSortWordsInLine call
    \ setline(".",join(sort(split(getline(".")," "))," "))

" Functions.
function!GDiffOrigin()
  diffthis|vertical new|read #|0d_|diffthis|setlocal buftype=nofile
endfunction

function!GToggleColorColumnValue()
  if&l:colorcolumn
    setlocal colorcolumn&
  else
    if&l:filetype!="diff"
      setlocal colorcolumn=81
    else
      setlocal colorcolumn=82
    endif
  endif
endfunction

function!GToggleCursorAccentuation()
  if&l:cursorline
    setlocal cursorcolumn&
    setlocal cursorline&
  else
    setlocal cursorcolumn
    setlocal cursorline
  endif
endfunction

function!GTogglePythonVersion()
  if g:syntastic_python_flake8_exec!="flake8"
    let g:syntastic_python_flake8_exec="flake8"
    let g:syntastic_python_pylint_exec="pylint"
    let g:syntastic_python_python_exec="python"
    let g:ycm_python_binary_path="/usr/bin/python"
  else
    let g:syntastic_python_flake8_exec="python3 flake8"
    let g:syntastic_python_pylint_exec="python3 pylint"
    let g:syntastic_python_python_exec="python3"
    let g:ycm_python_binary_path="/usr/bin/python3"
  endif
  :SyntasticCheck
endfunction

" Syntax highlighting.
highlight Comment ctermfg=156
highlight IndentGuidesEven ctermbg=237
highlight IndentGuidesOdd ctermbg=235
highlight Normal ctermbg=0

" Global variables.
let g:NERDSpaceDelims=1
let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:airline_powerline_fonts=1
let g:ctrlp_cache_dir="~/.vim/ctrlp"
let g:ctrlp_max_depth=9999
let g:ctrlp_show_hidden=1
let g:ctrlp_tilde_homedir=1
let g:easytags_async=1
let g:easytags_auto_highlight=0
let g:easytags_by_filetype="~/.vim/easytags_by_filetype"
let g:easytags_include_members=1
let g:gundo_help=0
let g:gundo_right=1
let g:gundo_width=83
let g:syntastic_aggregate_errors=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_python_flake8_exec="python3 flake8"
let g:syntastic_python_pylint_exec="python3 pylint"
let g:syntastic_python_python_exec="python3"
let g:tagbar_autoclose=1
let g:tagbar_compact=1
let g:tagbar_indent=0
let g:winresizer_horiz_resize=1
let g:winresizer_vert_resize=1
let g:ycm_complete_in_comments=1
let g:ycm_global_ycm_extra_conf=
    \ "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_python_binary_path="/usr/bin/python3"
let g:ycm_rust_src_path="/usr/src/rust"
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_show_diagnostics_ui=0

" Key mappings.
inoremap<expr><cr> pumvisible()?"<c-y>":"<cr>"
nnoremap j gj
nnoremap k gk
nnoremap<silent><f2> :NERDTreeToggle<cr>
nnoremap<silent><f3> :TagbarToggle<cr>
nnoremap<silent><f4> :GundoToggle<cr>
nnoremap<silent><f5> :tab split<cr>:tabmove<cr>
nnoremap<silent><f6> :$tabnew<cr>
nnoremap<silent><f7> :call GToggleColorColumnValue()<cr>
nnoremap<silent><f8> :call GToggleCursorAccentuation()<cr>
nnoremap<silent><f9> :SyntasticReset<cr>
nnoremap<silent><f11> :cNext<cr>
nnoremap<silent><f12> :cnext<cr>
nnoremap<silent><leader><f1> :split <c-r>=glob("%:h")<cr><cr>
nnoremap<silent><leader><f9> :call GTogglePythonVersion()<cr>
nnoremap<silent><leader><f11> :lNext<cr>
nnoremap<silent><leader><f12> :lnext<cr>
xmap<cr> <plug>(EasyAlign)

" Enabled options.
set colorcolumn=81
set completeopt-=preview
set confirm
set expandtab
set formatoptions+=j
set history=5000
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set pastetoggle=<f10>
set report=0
set secure
set shiftwidth=2
set showcmd
set smarttab
set tabstop=2
set undodir=~/.vim/undodir
set undofile
set updatetime=1000
set wildmenu

" Disabled options.
set noexrc
set nojoinspaces
set noswapfile
set nowrapscan
