set nocompatible

" Backup & File Settings
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
  set backupdir=~/.vim/backups " Where backups will go.
  set directory=~/.vim/tmp     " Where temporary files will go.
else
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin
  set backupdir=~/vimfiles/backups " Where backups will go.
  set directory=~/vimfiles/tmp     " Where temporary files will go.
endif
set backup                     " Enable creation of backup files

" Load the NerdTree project drawer by default
autocmd VimEnter * exe 'NERDTree'
autocmd VimEnter * wincmd p

" Color, text, and display settings
colorscheme wombat
set guioptions-=T  "remove toolbar
set guifont=Bitstream_Vera_Sans_Mono
set wrap!
set nu
set expandtab
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
else
  "This is console Vim.
  if exists("+lines")
    set lines=35
  endif
  if exists("+columns")
    set columns=110
  endif
endif

" Set the diff expression
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
