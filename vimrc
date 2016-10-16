set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'
"Plugin 'MarkdownFootnotes'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'FuzzyFinder'

filetype plugin indent on

" perltidy - http://www.perlmonks.org/?node_id=540167
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

"  To save file without hitting escape key 
"
imap <c-s> <c-o><c-s><CR>

" Insert mode keys
"
imap <F2> use Data::Dumper;
imap <F4> USE dumper;'<pre>'; dumper.dump(  );'</pre>';STOP;

" KEY MAPS
nmap <leader>c :set cursorcolumn!<CR>
nmap <leader>l :set list!<CR>
nmap <leader>h :set hls!<CR>
nmap <leader>n :set nu!<CR>
nmap <leader>t :set et!<CR>
nmap <leader>p :set paste!<CR>
nmap <leader>w :set wrap!<CR>
nmap <leader>f :FufFile<CR>
nmap <leader>d :FufDir<CR>
nmap <leader>b :FufBuffer<CR>
nmap <leader>e :NERDTree<CR>

" -------------------------------------
"Following short cut keys will work with Crtl+starting alphabet of the function
"nmap <silent> <C-h> <Esc>:call ToggleHLSearch()<CR>
"nmap <silent> <C-n> <Esc>:set nu!<CR>
" press ctrl-v u00ac for knot sign
" press ctrl-v u25b8 for arrow sign
set listchars=tab:▸\ ,eol:¬ 
"
" press ctrl-v u25b8 for arrow sign only border 
"set listchars=tab:▷\ ,eol:¬ 

set autoindent
set smarttab
set nu
set expandtab
set ruler "for row/column number
set sts=2
set ts=2
set sw=2
set si
set hls

if exists('+colorcolumn')
  set colorcolumn=120
endif

syntax on
"autocmd FileType perl set smartindent

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
 
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
