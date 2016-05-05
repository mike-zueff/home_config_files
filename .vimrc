" vim-plug and the related stuff.
if empty(glob("~/.vim"))
  let g:vimrc_is_bundle_installation_required=1
  silent !curl --create-dirs --output ~/.vim/autoload/plug.vim
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
" Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mike-zueff/nerdtree', { 'branch': 'read-only_files_opening_fix' }
Plug 'morhetz/gruvbox'
Plug 'rking/ag.vim'
Plug 'simeji/winresizer'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

if exists("g:vimrc_is_bundle_installation_required")
  PlugUpdate
  call mkdir(expand("~/.vim/undodir"))
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

" Functions.
function!GToggleColorColumnValue()
  if&l:colorcolumn
    setlocal colorcolumn&
  else
    setlocal colorcolumn=81
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
let g:gundo_help=0
let g:gundo_right=1
let g:gundo_width=83
let g:tagbar_autoclose=1
let g:tagbar_compact=1
let g:tagbar_indent=0
let g:winresizer_horiz_resize=1
let g:winresizer_vert_resize=1

" Key mappings.
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

" Enabled options.
set colorcolumn=81
set confirm
set expandtab
set history=5000
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set pastetoggle=<f10>
set secure
set shiftwidth=2
set showcmd
set smarttab
set splitbelow
set splitright
set tabstop=2
set undodir=~/.vim/undodir
set undofile
set updatetime=1000
set wildmenu

" Disabled options.
set noexrc
set noswapfile
set nowrapscan
" !!! ------------------------------------------------------------------
"vim sort words in line!
"help what os togglepaste???
"set textwidth=0
" Maps for quickfix and location windows (leader-q and leader-l respectively)
"Plug 'tomtom/tcomment_vim'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-endwise'
"Plug 'tpope/vim-markdown'
"Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-surround'
"Plug 'vim-scripts/ingo-library'
"Plug 'vim-scripts/visualrepeat'
"Plug 'wellle/tmux-complete.vim'
"easymotion, surround, extended-ft, bracketed-paste, и vimux + vimux-paster
" set title ??????
""Plugin 'msanders/snipmate.vim'
""Plugin 'Lokaltog/vim-easymotion'
""Plugin 'geetarista/ego.vim'
""Plugin 'jimenezrick/vimerl.git'
"Plugin 'scrooloose/nerdcommenter'
""Plugin 'tpope/vim-unimpaired'
""Plugin 'godlygeek/tabular'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'FuzzyFinder'
"Plugin 'guicolorscheme.vim'
"Plugin 'xterm16.vim'
""Plugin 'SuperTab'
""Plugin 'ZoomWin'
" Bundle 'VisIncr'
" Bundle 'viewdoc'
"
"set clipboard=unnamedplus
"set showtabline=2
"map Q gq
"!!! autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"" Convenient command to see the difference between the current buffer and the
"" file it was loaded from, thus the changes you made.
"" Only define it when not defined already.
"if !exists(":DiffOrig")
"  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"		  \ | wincmd p | diffthis
"endif
"
"let maplocalleader = "_"
"function! ShadowLongLines()
"  if exists("w:m_hl_ll")
"    call matchdelete(w:m_hl_ll)
"    unlet w:m_hl_ll
"    autocmd! WinEnter * call DoHighlightLL()
"  endif
"  unlet! g:line_max_length
"endfunction
"set formatoptions+=ntcroq21
""set nostartofline
"set nojoinspaces
"set showfulltag
"set report=0
""set shortmess+=asWAI
"set showtabline=0
"set sidescroll=15
"set fillchars="vert: ,fold: "
"set foldmethod=syntax
""set foldnestmax=1
"set nofoldenable
"set diffopt=filler,context:3
"set virtualedit=block
""" ...but not reset selection with not-shifted special keys
"set keymodel-=stopsel
""set selection=inclusive
"set updatecount=0
"color peachpuff
"com SpaceIndent :set tabstop=4| set shiftwidth=4| set expandtab
""com TabIndent :set tabstop=8| set shiftwidth=8| set noexpandtab
"" 4 space indent by default
"SpaceIndent
"gq
""vim RETAB + reformat all
"match ErrorMsg /\s\+$/
"set history=4096
"create undodir
""vim list buffers
"vim move buffer to tab or window
"vim clipboards - 2
"easytags
"http://www.oualline.com/vim/10/top_10.html
"https://github.com/xolox/vim-easytags
"https://github.com/PhilRunninger/my_vim_setup/blob/master/vimrc
"https://github.com/spf13/spf13-vim/blob/master/.vimrc
"https://github.com/scrooloose/nerdcommenter
"https://github.com/rdnetto/YCM-Generator
""AT LAST: select all + =
