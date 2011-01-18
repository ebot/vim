set nocompatible

" Backup & File Settings
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
  set backupdir=~/.vim/backups " Where backups will go.
  set directory=~/.vim/tmp     " Where temporary files will go.
  set transparency=5           " Set transparency
  set guioptions=aAce          " Make sure experimental mode is on in the MacVim Advanced options.
elseif has("win32")
  source $VIMRUNTIME/vimrc_example.vim
  "source $VIMRUNTIME/mswin.vim
  "behave mswin
  set backupdir=~/vimfiles/backups " Where backups will go.
  set directory=~/vimfiles/tmp     " Where temporary files will go.
endif
set backup                     " Enable creation of backup files

" Supertab ruby settings
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" NERDTree Project Drawer Settings
let NERDTreeShowBookmarks=1
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Color, text, and display settings
colorscheme wombat
set guioptions-=T  "remove toolbar
set guifont=Bitstream_Vera_Sans_Mono
set wrap!
set nu
"set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
set autoindent
autocmd FileType text setlocal textwidth=78
if has("gui_running")
  set lines=40 columns=150
  :winpos 175 1
  " Load the NerdTree project drawer by default for guis only
  autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
else
  "This is console Vim.
  if exists("+lines")
    set lines=35
  endif
  if exists("+columns")
    set columns=110
  endif
endif

" NerdTree Functions from Carl and Yehuda's vim distr - https://github.com/carlhuda/janus

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . a:directory
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction
