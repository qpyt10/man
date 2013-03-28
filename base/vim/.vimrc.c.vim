" vi map for C
"
" 04.04.08
" 14.03.13 m
"
"
" use ,,c to load
" use ,[name]
"
"

" load MPI map "
execute 'source ' . VIMRC_PATH . '.vimrc.c.mpi.vim'

" goto the first ( in the line in normal mode
map! -nfirst( <ESC>0/(<CR>:silent noh<CR>:<CR><RIGHT>
" goto the first ( in the line in insert mode
map! -ifirst( <ESC>0/(<CR>:silent noh<CR>:<CR><RIGHT>i
" goto the first " in the line in insert mode
map! -ifirst" <ESC>0/"<CR>:silent noh<CR>:<CR><RIGHT>i

" include/define {{{

" include
map! ,inc  #include<SPACE>
map! ,io   #include <stdio.h><CR>
map! ,lib  #include <stdlib.h><CR>
map! ,mat  #include <math.h><CR>
"
" define
map! ,def  #define<SPACE>
"
" }}}

" DECLARATION {{{
map! ,c  char ;<left>
map! ,i  int ;<left>
map! ,si short int ;<left>
map! ,li long int ;<left>
map! ,f  float ;<left>
map! ,d  double ;<left>
map! ,F  FILE * ;<left>
" }}}

" CONDITIONAL {{{

" for
map! ,for  for (;;) {}<LEFT><CR><UP><UP>-ifirst(

" if
map! ,if   if () {}<left><CR><UP>-ifirst(
map! ,ife  if () {}<left><CR><right> else {}<left><CR><UP><UP>-ifirst(
map! ,ifei if () {}<left><CR><right> else if () {}<left><CR><UP><UP>-ifirst(
" while
inoremap ,wh  while ()<CR>{<CR><CR>}<UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>

map! ,re  return ;<LEFT>
map! ,co  continue;<CR>
map! ,br  break;<CR>

"}}}

" ASSERT {{{
map! ,as  assert();<Left><Left>
"}}}

" IO {{{
" print
map! -stream stream
map! ,pr   printf ("");-ifirst"
map! ,fpr fprintf (-stream, "");-nfirst(
" input/ouput
map! ,op ptrFile = fopen (filename, "mode");<ESC>^
map! ,cl close (filename);-nfirst(
map! ,fl fflush (-stream);-nfirst(
" }}}

" memory managment {{{
 
map! ,mal name = (type *) malloc(dim * sizeof(type));<ESC>^
map! ,size sizeof()<LEFT>

" }}}

"map! ,main  int main (int argc, char **argv) {<CR><CR>}<UP>
map! ,main  int main (int argc, char **argv)<CR>{<CR><CR>}<UP>

map! ,init  ,io,lib<CR>,main

map! ,sca scanf("%",);<LEFT><LEFT><LEFT><LEFT>



