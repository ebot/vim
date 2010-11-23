set nocompatible

" Backup & File Settings
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
  set backupdir=~/.vim/backups " Where backups will go.
  set directory=~/.vim/tmp     " Where temporary files will go.
  set transparency=5           " Set transparency
  set guioptions=aAce          " Make sure experimental mode is on in the MacVim Advanced options.
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
let NERDTreeShowBookmarks=1

" Supertab ruby settings
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold


" Color, text, and display settings
colorscheme wombat
set guioptions-=T  "remove toolbar
set guifont=Bitstream_Vera_Sans_Mono
set wrap!
set nu