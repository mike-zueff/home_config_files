set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
if !isdirectory(expand("~/.vim/bundle"))
  let g:bundle_installation_is_required=1
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on
if exists("g:bundle_installation_is_required")
  :PluginUpdate
  :qall
endif

function! ToggleColorColumnValue()
  if &l:colorcolumn
    setlocal colorcolumn&
  else
    setlocal colorcolumn=81
  endif
endfunction

function! ToggleCursorAccentuation()
  if &l:cursorline
    setlocal cursorcolumn&
    setlocal cursorline&
  else
    setlocal cursorcolumn
    setlocal cursorline
  endif
endfunction

if !isdirectory(expand("~/.vim/undodir"))
  :call mkdir(expand("~/.vim/undodir"))
endif

colorscheme slate

highlight ColorColumn cterm=bold ctermbg=209 ctermfg=0
highlight CursorColumn cterm=bold ctermbg=239 ctermfg=15
highlight CursorLine cterm=bold ctermbg=239 ctermfg=15
highlight SignColumn ctermbg=236

let dotree_SetFocusWhenToggle=1
let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:airline_powerline_fonts=1
let g:gitgutter_override_sign_column_highlight=0
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:undotree_SetFocusWhenToggle=1
let g:undotree_WindowLayout=3

nnoremap <silent> <F2> :call ToggleColorColumnValue()<CR>
nnoremap <silent> <F3> :call ToggleCursorAccentuation()<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :TagbarToggle<CR>
nnoremap <silent> <F6> :UndotreeToggle<CR>
nnoremap <silent> <F7> :tab split<CR>:tabmove<CR>
nnoremap <F8> :$tabnew<CR>
nnoremap <F11> :cNext<CR>
nnoremap <F12> :cnext<CR>

set colorcolumn=81
set confirm
set expandtab
set history=5000
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set noswapfile
set nowrapscan
set secure
set shiftwidth=2
set showcmd
set smarttab
set tabstop=2
set undodir=~/.vim/undodir
set undofile
set updatetime=1000
set wildmenu
"""""""""""""""""""""""""""""
""Plugin 'msanders/snipmate.vim'
""Plugin 'Lokaltog/vim-easymotion'
"Plugin 'mileszs/ack.vim'
""Plugin 'geetarista/ego.vim'
""Plugin 'jimenezrick/vimerl.git'
"Plugin 'scrooloose/nerdcommenter'
""Plugin 'tpope/vim-unimpaired'
""Plugin 'godlygeek/tabular'
""Plugin 'tpope/vim-surround'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'FuzzyFinder'
"Plugin 'xoria256.vim'
"Plugin 'guicolorscheme.vim'
"Plugin 'desert256.vim'
"Plugin 'xterm16.vim'
""Plugin 'Gundo'
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
"function! ChangeSpacesMatching(new_pat)
"  if exists("w:m_unwanted_spaces")
"    call matchdelete(w:m_unwanted_spaces)
"  endif
"  let w:m_unwanted_spaces=matchadd('ExtraWhitespace', a:new_pat)
"endfunction
"
"function! ShowUnwantedSpaces()
"  highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"  let w:m_unwanted_spaces=matchadd('ExtraWhitespace','\s\+$')
"  autocmd WinEnter    * call ChangeSpacesMatching('\s\+$')
"  autocmd InsertEnter * call ChangeSpacesMatching('\s\+\%#\@<!$')
"  autocmd InsertLeave * call ChangeSpacesMatching('\s\+$')
"endfunction
"
"function! HideUnwantedSpaces()
"  call matchdelete(w:m_unwanted_spaces)
"  autocmd! WinEnter    * call ChangeSpacesMatching('\s\+$')
"  autocmd! InsertEnter * call ChangeSpacesMatching('\s\+\%#\@<!$')
"  autocmd! InsertLeave * call ChangeSpacesMatching('\s\+$')
"  highlight clear ExtraWhitespace
"endfunction
"
"function! DoHighlightLL()
"  if exists("g:line_max_length")
"    if exists("w:m_hl_ll")
"      call matchdelete(w:m_hl_ll)
"    endif
"    let w:m_hl_ll=matchadd('ErrorMsg', '\%>'. g:line_max_length . 'v.\+', -1)
"  endif
"endfunction
"
"function! HighlightLongLines(max_length)
"  call ShadowLongLines()
"  let g:line_max_length = a:max_length
"  call DoHighlightLL()
"  autocmd WinEnter * call DoHighlightLL()
"endfunction
"
"function! ShadowLongLines()
"  if exists("w:m_hl_ll")
"    call matchdelete(w:m_hl_ll)
"    unlet w:m_hl_ll
"    autocmd! WinEnter * call DoHighlightLL()
"  endif
"  unlet! g:line_max_length
"endfunction
"" TODO vim highlight tab chars!!!


"set formatoptions+=ntcroq21
""" Some automatic cursor moving
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
