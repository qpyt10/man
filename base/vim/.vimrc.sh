" vi map for BASH
"
" 21.11.07
" 30.06.08 modified
"
"
" use <<b to load
" use ,[name]
"
"


map! ,if if [[  ]];then<CR><CR>fi<UP><UP><RIGHT><RIGHT><RIGHT><RIGHT>

map! ,elif elif [[  ]];then<CR><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>

map! ,case case  in<CR>esac<UP><RIGHT>

:function! Clean()
: unmap! ,case
: unmap! ,elif
: unmap! ,if
:endfunction
