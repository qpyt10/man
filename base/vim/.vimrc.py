" vi map for gnuplot
"
" 04.04.08
" 06.12.11 m
"
"
" use <<g to load
" use ,[name]
"
"
""

map! -ret <ESC>?(<CR>:silent noh<CR>:<CR><RIGHT>
map! -firstcol <ESC>^


map! -val value

map! ,inp -val = input("")-firstcol

map! ,pr print<SPACE>


:function! Clean()
unmap! ,inp
:endfunction
