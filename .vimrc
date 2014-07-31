if has("win32")
	set guifont=Consolas:h10
	set backupdir=$VIM\vimfiles\backup
	set dir=$VIM\vimfiles\backup
else
	if has("unix")
		set guifont="DejaVu Sans Mono"
		set backupdir=~/.vim/backup
		set dir=~/.vim/backup
	endif
endif

set relativenumber

set lines=45
set columns=150

" Command line history
set history=500

" Tabs with width 2
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Highlight current line.
set cursorline

" Enable word wrapping
set wrap
" Wrap at whole words rather than in the middle of a word.
" This avoids splitting a single word into two lines.
set linebreak

" Copy indentation from current line when making a new line.
set autoindent

" Automatically reload vimrc when saving it.
autocmd! BufWritePost _vimrc source $MYVIMRC

" Always show tabs.
set showtabline=2

" English GUI. Deleting vim73\lang works better.
set langmenu=en_US.UTF-8

set guioptions=

" Shows current line number and the relative position in the file in the lower right corner.
set ruler

" Always show statusline, even if only 1 window
set laststatus=2

" unicode snowman: ☃
set fileencoding=utf-8
set encoding=utf-8

		
			
" Show indent guides for tabs. Note: Space at end is important.
set lcs=tab:→\ 
set lcs=tab:▸\ 

colorscheme darkspectrum
"colorscheme solarized

" Show only file name in tab label, and show a + when the file has been
" modified. Only works with gui mode (guioptions=e).
set guitablabel=%t\ %M

" Set ø to go to start of line, æ to go to end of line.
map ø ^
map æ $
" Open vimrc when pressing å!
map å :e $MYVIMRC<Return>
" On Norwegian keyboards, - is in the position / has on American keyboards.
map - /

" Unbind arrow keys
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" > and < with visual selection also reselects text, making it easy to indent
" multiple times.
vmap < <gv
vmap > >gv

" Disable search highlighting when searching with /
" doesn't work!
" set nohlsearch

" Searching with all lower case ignores case, searching with mixed case is case
" sensitive
"set ignorecase
"set smartcase

set nocompatible
let mapleader = "\<Space>"
map <Leader>n ddO
map <Leader>w :w<Return>
map <Leader>t :tabnew<Return>
map <Leader>q :q<Return>

" Yank/paste to/from system clipboard
vmap <Leader>y "+y
nmap <Leader>y "+y
nmap <Leader>p "+p
vmap <Leader>p "+p

map <Leader>snowman i☃<Esc>
map <Leader>snowmen i☃<Esc>vly100p
map <Leader>lenny i(͡° ͜ʖ ͡°)<Esc>

nnoremap + <C-a>
nnoremap - <C-x>

map <Return> o<Esc>
map <S-Return> O<Esc>

" Easy way to replace word under cursor
noremap <Leader>r :%s/<C-r><C-w>//g<Left><Left>

syntax on
source $VIMRUNTIME/mswin.vim
"behave mswin
":set selectmode=


" Use tabs like in other editors, 1 buffer per tab.
:tab sball
:se switchbuf=usetab,newtab


" From https://github.com/mkitt/tabline.vim
if !exists("*Tabline")
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
endif
:set tabline=%!Tabline()

" Adds command 'Strike' which makes current selected strikethrough
" From http://vim.wikia.com/wiki/Create_underlines,_overlines,_and_strikethroughs_using_combining_characters
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')
function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction
