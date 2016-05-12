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
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
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
  call system("touch ~/.vim/.vimtags")
  silent !sed --in-place 452s/4/0/ ~/.vim/plugged/gruvbox/colors/gruvbox.vim
  silent !sed --in-place 89s/234/0/ ~/.vim/plugged/gruvbox/colors/gruvbox.vim
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
command!-range GSortLine <line1>,<line2>call
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

" Syntax highlighting.
highlight Comment ctermfg=156

" Variables.
let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:airline_powerline_fonts=1
let g:ctrlp_cache_dir="~/.vim/ctrlp"
let g:ctrlp_show_hidden=1
let g:ctrlp_tilde_homedir=1

let g:easytags_async=1
 let g:easytags_by_filetype=1
 let g:easytags_dynamic_files=1
let g:easytags_file="~/.vim/.vimtags"
let g:easytags_include_members=1

let g:gundo_help=0
let g:gundo_right=1
let g:gundo_width=83
let g:tagbar_autoclose=1
let g:tagbar_compact=1
let g:tagbar_indent=0
let g:winresizer_horiz_resize=1
let g:winresizer_vert_resize=1
let g:ycm_always_populate_location_list=1
let g:ycm_global_ycm_extra_conf=
    \ "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" Key mappings.
inoremap<expr><cr> pumvisible()?"<c-y>":"<cr>"
nnoremap j gj
nnoremap k gk
nnoremap<silent><f2> :call GToggleColorColumnValue()<cr>
nnoremap<silent><f3> :call GToggleCursorAccentuation()<cr>
nnoremap<silent><f4> :NERDTreeToggle<cr>
nnoremap<silent><f5> :TagbarToggle<cr>
nnoremap<silent><f6> :GundoToggle<cr>
nnoremap<silent><f7> :tab split<cr>:tabmove<cr>
nnoremap<f8> :$tabnew<cr>
nnoremap<f11> :cNext<cr>
nnoremap<f12> :cnext<cr>
nnoremap<leader><f11> :lNext<cr>
nnoremap<leader><f12> :lnext<cr>
xmap ga <plug>(EasyAlign)

" Enabled options.
set colorcolumn=81
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
" !!! ------------------------------------------------------------------
"help what os togglepaste??? - vim + terminal
"Plug 'tomtom/tcomment_vim'
"Plug 'tpope/vim-commentary'
"Plugin 'scrooloose/nerdcommenter'
"set clipboard=unnamedplus
"set formatoptions+=ntcroq21
"set showfulltag
"gq, select all =
"vim clipboards - 2
"at end: gq and all=
