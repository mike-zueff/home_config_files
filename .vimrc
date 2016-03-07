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

colorscheme slate

highlight ColorColumn cterm=bold ctermbg=209 ctermfg=0
highlight CursorColumn cterm=bold ctermbg=239 ctermfg=15
highlight CursorLine cterm=bold ctermbg=239 ctermfg=15
highlight SignColumn ctermbg=236

let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1
let g:airline_powerline_fonts=1
let g:gitgutter_override_sign_column_highlight=0
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_compact=1

nnoremap <silent> <F2> :call ToggleColorColumnValue()<CR>
nnoremap <silent> <F3> :call ToggleCursorAccentuation()<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>
nnoremap <silent> <F5> :TagbarToggle<CR>
nnoremap <silent> <F6> :tab split<CR>:tabmove<CR>
nnoremap <F7> :$tabnew<CR>
nnoremap <F11> :cNext<CR>
nnoremap <F12> :cnext<CR>

set colorcolumn=81
set confirm
set expandtab
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set noswapfile
set nowrapscan
set shiftwidth=2
set showcmd
set smarttab
set tabstop=2
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
"" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
"" so that you can undo CTRL-U after inserting a line break.
"inoremap <C-U> <C-G>u<C-U>
"colorscheme desert256
"
"if &term =~ "xterm*"
"  " use an orange cursor in insert mode
"  let &t_SI = "\<Esc>]12;orange\x7"
"  " use a red cursor otherwise
"  let &t_EI = "\<Esc>]12;blue\x7"
"  silent !echo -ne "\033]12;blue\007"
"  " reset cursor when vim exits
"  autocmd VimLeave * silent !echo -ne "\033]12;black\007"
"endif
"set tags=tags,.tags,../tags
"" Switch syntax highlighting on, when the terminal has colors
"" Also switch on highlighting the last used search pattern.
"" Only do this part when compiled with support for autocommands.
"if has("autocmd")
"
"  " Enable file type detection.
"  " Use the default filetype settings, so that mail gets 'tw' set to 72,
"  " 'cindent' is on in C files, etc.
"  " Also load indent files, to automatically do language-dependent indenting.
"  filetype plugin indent on
"
"  " Put these in an autocmd group, so that we can delete them easily.
"  augroup vimrcEx
"  au!
"
"  " For all text files set 'textwidth' to 78 characters.
"  autocmd FileType text setlocal textwidth=78
"
"  " When editing a file, always jump to the last known cursor position.
"  " Don't do it when the position is invalid or when inside an event handler
"  " (happens when dropping a file on gvim).
"  " Also don't do it when the mark is in the first line, that is the default
"  " position when opening a file.
"  autocmd BufReadPost *
"    \ if line("'\"") > 1 && line("'\"") <= line("$") |
"    \   exe "normal! g`\"" |
"    \ endif
"
"  autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"
"  augroup END
"
"else
"
"  set autoindent		" always set autoindenting on
"
"endif " has("autocmd")
"
"" Convenient command to see the difference between the current buffer and the
"" file it was loaded from, thus the changes you made.
"" Only define it when not defined already.
"if !exists(":DiffOrig")
"  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"		  \ | wincmd p | diffthis
"endif
"
"function! RenameTestFunctions(test_name)
"	execute ',$s/'. a:test_name . '_\(\_d\+\)/\="' . a:test_name .'_" . (submatch(1)+1)/'
"endfunction
"
"" Want to use <LocalReader> symbol for mappings
"" let maplocalleader = "_"
"au BufEnter *.hs compiler ghc
""configure browser for haskell_doc.vim
"let g:haddock_browser = "/usr/bin/google-chrome"
""update tags file in current directory
""map <C-L> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
""Call NERDTree window
"map <Leader>n :NERDTreeToggle<CR>
""Search for files and buffers
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


"ANOTHER
"    "" Automatically insert comment character if we need to
"set formatoptions+=ntcroq21
""
""" Some automatic cursor moving
""set nostartofline
"
""" Don't make chaos on my display
"set nowrap
""set backspace=indent,eol,start
"set nojoinspaces
""
"" Some information is always good...
"set showfulltag
"set wildmode=list:longest
"set report=0
""set shortmess+=asWAI
"set showtabline=0
""set noshowmode
"
""set helpheight=12
"set winminheight=0
""
"set sidescroll=15
""
"" Nice :list and :set list
"set listchars=tab:>-,trail:.,extends:+,eol:$,precedes:+
""
"set fillchars="vert: ,fold: "
""
"" Fold options
"set foldmethod=syntax
""set foldnestmax=1
"set nofoldenable
""
"" Diff options
"set diffopt=filler,context:3
""
"set virtualedit=block
""
"" Always save some info for next time
"set history=100
""set viminfo='100,h,%
"set sessionoptions+=winpos
""" Don't save options to session file - it's possibly buggy
"set sessionoptions-=options
""
"" Pretty select with mouse and shifted special keys
"behave mswin
""" ...but not reset selection with not-shifted special keys
"set keymodel-=stopsel
""set selection=inclusive
"
"set wildignore=*.swp,*.swo,*.beam,*.pyc,*.*~
""
"set updatecount=0
""
"set secure
""
"color peachpuff
""
"" Highlight syntax
"syntax enable
""
"filetype plugin indent on
""
"" Indent commands
"com SpaceIndent :set tabstop=4| set shiftwidth=4| set expandtab
""com TabIndent :set tabstop=8| set shiftwidth=8| set noexpandtab
"" 4 space indent by default
"SpaceIndent
""
""    vsplit
" gq
"
""vim RETAB + reformat all
"
"match ErrorMsg /\s\+$/
"set history=4096
"create undodir
""vim list buffers
"vim move buffer to tab or window
"set list
