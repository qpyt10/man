" vi map for FORTRAN90 "
"                      "
" 16.11.07             "
" 06.05.11 m           "
"                      "
"                      "
" use <<f to load      "
" use ,[name]          "
"                      "
"                      "
""""""""""""""""""""""""
execute 'source ' . VIMRC_PATH . '.vimrc.f.mpi'

" INIT PROGRAM " 
map! ,init PROGRAM name<CR>,imp<CR><CR>END PROGRAM name<UP>
map! ,imp IMPLICIT NONE
" INDENT "
"map! ,<SPACE> <SPACE><SPACE><SPACE><SPACE><SPACE> "
map! ,ind <SPACE><SPACE><SPACE><SPACE><SPACE><SPACE><SPACE>

map! ,sub SUBROUTINE name<CR>,imp<CR>END SUBROUTINE name<UP>
map! ,int INTENT()<LEFT>
map! ,inti INTENT(IN)
map! ,into INTENT(OUT)

" DECLARATION "
map! ,i INTEGER ::<SPACE>
map! ,r REAL(KIND=8) ::<SPACE>
map! ,d DOUBLE PRECISION ::<SPACE>
map! ,l LOGICAL ::<SPACE>
map! ,c CHARACTER (LEN=) ::<LEFT><LEFT><LEFT><LEFT><LEFT>
map! ,a ALLOCATABLE
map! ,p PARAMETER
map! ,dim DIMENSION ()<LEFT>

map! ,call CALL<SPACE>


" dinamical "
map! ,all ALLOCATE ()<LEFT>
map! ,deall DEALLOCATE ()<LEFT>

" input/output "
map! ,op OPEN  ()<LEFT>
map! ,cl CLOSE ()<LEFT>
map! ,wr WRITE (*,*)
map! ,re READ (*,*)
map! ,pr PRINT *, 

map! ,( ()<LEFT>
map! ,) ()<LEFT>


" conditional "
map! ,do  DO i = 1, imax<CR>END DO<UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><ESC>
map! ,if  IF ()<LEFT>
map! ,ife  IF () THEN<CR>END IF<UP><LEFT><LEFT>
map! ,ifee  IF () THEN<CR>ELSE<CR>END IF<UP><UP><LEFT><LEFT>
map! ,sel SELECT CASE ()<CR>CASE ()<CR><CR>END SELECT<UP><UP><UP><RIGHT><RIGHT><RIGHT>



:function! Clean()
: unmap! ,a
: unmap! ,all
: unmap! ,c
: unmap! ,d
: unmap! ,do
: unmap! ,deall
: unmap! ,e
: unmap! ,i
: unmap! ,int
: unmap! ,inti
: unmap! ,into
: unmap! ,if
: unmap! ,l
: unmap! ,r
: unmap! ,sel
: unmap! ,sub
: unmap! ,w
: unmap! ,(
: unmap! ,)
:endfunction

