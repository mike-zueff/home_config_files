" vim-plug and the related stuff.
if empty(glob("~/.vim"))
  let g:vimrc_is_bundle_installation_required=1
  silent !curl --create-dirs --output ~/.vim/autoload/plug.vim
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
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
autocmd FileType help setlocal colorcolumn&
autocmd FileType qf setlocal colorcolumn&
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
let g:airline_powerline_fonts=1

" Key mappings.
nnoremap<silent><f2> :call GToggleColorColumnValue()<cr>
nnoremap<silent><f3> :call GToggleCursorAccentuation()<cr>
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
"  let g:NERDTreeCaseSensitiveSort=1
"  let g:NERDTreeMinimalUI=1
"  let g:NERDTreeShowHidden=1
"  let g:ctrlp_cache_dir = "~/.vim/ctrlp"
"  nnoremap <silent> <F4> :NERDTreeToggle<CR>
"  nnoremap <silent> <F5> :TagbarToggle<CR>
"  nnoremap <silent> <F6> :UndotreeToggle<CR>
"------TEMPORARY----------------
"help what os togglepaste???
  "Plug 'ctrlpvim/ctrlp.vim'
  "Plug 'mileszs/ack.vim'
  "Plug 'scrooloose/nerdtree'
  "Plug 'tpope/vim-fugitive'
""tab header bgcolor
"Plugin 'majutsushi/tagbar'
"Plugin 'mbbill/undotree'
"plugin indent on"
"set textwidth=0

" silent !echo "setlocal colorcolumn&" > ~/.vim/ftplugin/tagbar.vim
" silent !echo "setlocal colorcolumn&" > ~/.vim/ftplugin/undotree.vim
" silent !echo "setlocal colorcolumn&" > ~/.vim/ftplugin/CTRLP
"  silent !echo "setlocal colorcolumn=82" > ~/.vim/ftplugin/diff.vim


"let g:tagbar_autoclose=1
"let g:tagbar_compact=1
"let g:undotree_DiffCommand="diff --unified=0"
"let g:undotree_SetFocusWhenToggle=1
"let g:undotree_SetFocusWhenToggle=1
"let g:undotree_SplitWidth=83
"let g:undotree_WindowLayout=3

" set title ??????




"EGO""""""""""""""""""""""""""""
""Plugin 'msanders/snipmate.vim'
""Plugin 'Lokaltog/vim-easymotion'
"Plugin 'mileszs/ack.vim'
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
"colorscheme desert256
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
"map <C-f>f :FufFile<CR>
"map <C-f>c :FufCoverageFile<CR>
"map <C-f>b :FufBuffer<CR>
"
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
""set noshowmode
"set sidescroll=15
"" Nice :list and :set list
"set listchars=tab:>-,trail:.,extends:+,eol:$,precedes:+
""
"set fillchars="vert: ,fold: "
"set foldmethod=syntax
""set foldnestmax=1
"set nofoldenable
""
"" Diff options
"set diffopt=filler,context:3
"set virtualedit=block
""set viminfo='100,h,%
"set sessionoptions+=winpos
""" Don't save options to session file - it's possibly buggy
"set sessionoptions-=options
"" Pretty select with mouse and shifted special keys
"behave mswin
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
"set list
"undodir
"retab, select-all + = (reformat)
"vim clipboards - 2
"easytags
"https://github.com/Valloric/YouCompleteMe
"http://www.oualline.com/vim/10/top_10.html
""AT LAST: select all + =
