" 16.11.07
" 07.03.13 modified
"
" variable to set in the customization file
" let VIMRC_PATH = "here_the_path_of_this_file" . '/.vim/'
" : execute ' source ' .  VIMRC_PATH . '.vimrc'
"
" 

" load the short-cut
execute 'source ' . VIMRC_PATH . '.vimrc.short'

map ,,v :execute 'source ' . VIMRC_PATH . '.vimrc'<CR>

execute "set runtimepath+=".VIMRC_PATH

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e  $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
"                   SETTINGS                     "
"                   --------                     "
""""""""""""""""""""""""""""""""""""""""""""""""""
set sh=/bin/bash

" wrap lines
set wrap        " wrap lines automatically (create new line)

" show title in console title bar
"set title           

" don't jump to first character when paging
set nostartofline   

" Press space to clear search highlighting and any message already displayed.
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Sets how many lines of history VIM has to remember
set history=700

" abbrev. of messages (avoids 'hit enter')
set shortmess+=a

" FOLD {{{
"
" fold method
set foldmethod=marker
"
" }}}

"--- SET VISUAL SETTINGS ---"
"
"set bg=dark
set bg=light

" color scheme
" example: slate desert 
colorscheme desert

"
" show the current row and column at the bottom right of the screen
set ruler                         " show line/character in statusbar

"set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)


" === LINE NUMBERS ===
" set number  " turn on
set nonumber  " turn off


"
"set linespace=0 " don't insert any extra pixel lines between lines
"
"set scrolloff=20 " min num of lines to keep above/below the cursor
"set sidescrolloff=10 " Keep 5 lines at the size
"
"
" show partial commands in status line and selected characters/lines in visual mode
set showcmd                       " show number of lines selected in visual

"
"set columns=80 " number of columns used on the screen
"set textwidth=19 " the text width
"
"- end SET VISUAL SETTINGS -"

"set backup " make backup files

set iskeyword+=_,@,# " none of these are word dividers 

"-----------------"
" SYNTAX SETTINGS "
"-----------------"
syntax enable

set showmatch " show matching brackets/parenthesis

" SEARCH {{{
"
set hlsearch " highlight all search matches
"set incsearch " show search results as you type
" non-case-sensitive searches
"set ignorecase " ignore case when searching
set smartcase   " ignore case if search pattern is all lowercase, case-sensitive otherwise
"
" }}}

" INDENT {{{
"
"set autoindent
"filetype indent on
set smartindent      " smart autoindenting on a new line
set copyindent       " copy the previous indentation on autoindenting
set shiftwidth=3     " number of spaces to use for autoindenting
set shiftround       " use multiple of shiftwidth when indenting with '<' and '>'
"
" }}}

" TABS {{{
" "
"set tabstop=4   " a tab is four spaces
set expandtab " no real tabs
"set ignorecase " case insensitive by default
set smarttab    " insert tabs on the start of a line according to shiftwidth, not tabstop
"
" }}}

" BELL {{{
"
set noerrorbells
"set visualbell
"
" }}}

" CURSOR {{{
"
"set cursorcolumn " highlight the current column
"set cursorline   " highlight current line
"
" }}}

" MOUSE {{{
"
"  set mouse=n
"
" }}}

"-------------------"
" FILETYPE settings "
"-------------------"

" Enable filetype plugin
filetype plugin on
filetype on " enable filetype detection

autocmd FileType c,cpp call <SID>MyC()
autocmd FileType tex   call <SID>MyTex()
autocmd FileType sh    call <SID>MySh()


au BufNewFile,BufRead *.cu set ft=cu
au BufRead,BufNewFile *.cu call <SID>MyCUDA()

au BufRead,BufNewFile *.cuf :so $VIMRUNTIME/syntax/fortran.vim
autocmd FileType fortran   call <SID>MyFortran()
au BufRead,BufNewFile *.f,*.f90,*.F,*.F90,*.cuf  call <SID>MyFortran()

au BufRead,BufNewFile *.plt     call <SID>MyGnuplot()

au BufRead,BufNewFile *.py     call <SID>MyPython()

" word completition with TAB (same as C-N, C-P)
autocmd FileType perl imap <Tab> <C-P>
"set completeopt= " don't use a pop up menu for completions

"autocmd BufRead,BufNewFile *.vim set syntax=vim

"---------------"
" COPY settings "
"---------------"
" to copy: F5 prima e dopo copy
nnoremap <F5> :set invpaste paste?<Enter>
imap <F5> <C-O><F5>
set pastetoggle=<F5>


""""""""""""""""""""""""""""""""""""""""""""""""""
"              Function Key maps                 "
"              -----------------                 "
""""""""""""""""""""""""""""""""""""""""""""""""""

" auto load map
"autocmd FileType plt :execute MySource(".vimrc.plt")
"autocmd FileType c   :execute MySource(".vimrc.c")
"autocmd FileType tex :execute MySource(".vimrc.tex")
"autocmd FileType sh  :execute MySource(".vimrc.sh")

"autocmd FileType f,f90   :execute MySource(".vimrc.f")
"au BufRead,BufNewFile *.f,*.f90 :execute MySource(".vimrc.f")

" manual load map
map ,,f     call Clean()<CR> call <SID>MySource(".vimrc.f")     <CR>
map ,,t     call Clean()<CR> call <SID>MySource(".vimrc.tex")   <CR>
map ,,b     call Clean()<CR> call <SID>MySource(".vimrc.sh")    <CR>
map ,,c     call Clean()<CR> call <SID>MySource(".vimrc.c")     <CR>
map ,,g     call Clean()<CR> call <SID>MySource(".vimrc.plt")   <CR>
map ,,cu    call Clean()<CR> call <SID>MySource(".vimrc.cu")    <CR>
map ,,spell call Clean()<CR> call <SID>MySource(".vimrc.spell") <CR>

map ,,m :execute Mouse()<CR>
"map <<m :set mouse=nv<CR>
map ,,nm :set mouse=n<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
"              Custom functions                  "
"              ----------------                  "
""""""""""""""""""""""""""""""""""""""""""""""""""

" Re-source the rc files
:function! MySource(file_name)
: let path_file_name = g:VIMRC_PATH . a:file_name
:  if filereadable(path_file_name)
:  	execute 'source ' . path_file_name
":  	echo path_file_name . " Loaded sucessfully"
:  else
:  	echo path_file_name . " does NOT exist"
:  	return 0
:  endif
:endfunction


:function! Clean()
  syntax enable
:endfunction


" function to set mouse 
:function! Mouse()
" if mouse isn't set => set mouse=a
: if &mouse==""
:  se mouse=a
: else
" else unset mouse
:  se mouse=
: endif
:endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Reverse the background color
map <F12> :execute ReverseBackground()<CR>
map <F6>  :execute ReverseBackground()<CR>
"map <C-R> :execute ReverseBackground()<CR>

" This function was created by Dillon Jones (much better than my first attempt)
" it reverses the background color for switching between vim/gvim which have
" different defaults.
" TODO The only problem with this is after you execute it it jumps to the 
" beginning of the file.  I need to figure out how to fix that.
:function! ReverseBackground()
: let Mysyn=&syntax
: if &bg=="light"
: se bg=dark
: else
: se bg=light
: endif
: syn on
: exe "set syntax=" . Mysyn
":   echo "now syntax is "&syntax
:endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""

" function to load with files *.c *.cpp 
function! <SID>MyC()
   set cindent shiftwidth=3 " set autoindent
   "imap <Tab> <C-N>
   "imap <Tab> <C-P>
   call MySource(".vimrc.c.vim")
endfunction

" function to load with files *.cu
function! <SID>MyCUDA()
   set cindent shiftwidth=3 " set autoindent
   "imap <Tab> <C-N>
   imap <Tab> <C-P>
   :set syn=c
   ": let path_file_name = g:VIMRC_PATH . 'cu.vim'
   ": execute 'source ' . path_file_name
   :execute MySource(".vimrc.c")
   :execute MySource(".vimrc.cu")
endfunction

" function to load with files *.tex
function! <SID>MyTex()
   "set cindent shiftwidth=3 " set autoindent
   "imap <Tab> <C-N>
   imap <Tab> <C-P>
   :execute MySource(".vimrc.tex")
   :execute MySource(".vimrc.spell")
endfunction

" function to load with files *.f *.f90
function! <SID>MyFortran()
   let fortran_free_source=1
   let fortran_do_enddo=1
   set cindent shiftwidth=3 " set autoindent
   set expandtab " no real tabs
   "imap <Tab> <C-N>
   imap <Tab> <C-P>
   :execute MySource(".vimrc.f")
endfunction

function! <SID>MySh()
   "imap <Tab> <C-N>
   imap <Tab> <C-P>
   set cindent shiftwidth=3 " set autoindent
   :execute MySource(".vimrc.sh")
endfunction

function! <SID>MyGnuplot()
   "imap <Tab> <C-N>
   imap <Tab> <C-P>
   :execute MySource(".vimrc.plt")
endfunction
    
function! <SID>MyPython()
   "imap <Tab> <C-N>
   imap <Tab> <C-P>
   :execute MySource(".vimrc.py")
endfunction

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
"set laststatus=2

" Format the statusline
"set statusline=\ %f\ %w\ \ WD:\ %r%{CurDir()}%h\ \ \ %l/%L:%c
"set statusline=\ %f\ %w\ \ WD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>
"
"" Map auto complete of (, ", ', [
"inoremap $1 ()<esc>i
"inoremap $2 []<esc>i
"inoremap $3 {}<esc>i
"inoremap $4 {<esc>o}<esc>O
"inoremap $q ''<esc>i
"inoremap $e ""<esc>i
"inoremap $t <><esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>



" end of .vimrc
