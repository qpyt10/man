map! -err  err
map! -sta  status
map! -rnk  rank
map! -pro  procs
map! -com  MPI_COMM_WORLD

map! -buf  Buffer
map! -src  Source
map! -dest Destination
map! -tag  tag
map! -typ  MPI_type
map! -num  Count
map! -root Root
map! -op   MPI_op
map! -req  Request
map! -flag Flag


map! -Sbuf Send-buf
map! -Rbuf Rec-buf

map! -inc  #include "mpi.h"
map! -def  int -rnk, -pro, -err, -tag;<CR>MPI_Status -sta;<CR>
map! -init  -err = MPI_Init (&argc, &argv);<CR>
map! -rank  -err = MPI_Comm_rank (-com, &-rnk);<CR>
map! -size  -err = MPI_Comm_size (-com, &-pro);<CR>
map! -fin   -err = MPI_Finalize ();<CR>

map! -Sbuf Send-buf
map! -Rbuf Rec-buf

map! -ret <ESC>?(<CR>:silent noh<CR>:<CR><RIGHT>

map! -get  -err = MPI_Get_count (&-sta, -typ, &-num);-ret

" point-to-point
map! -send  -err = MPI_Send (-buf, -num, -typ, -dest, -tag, -com);-ret
map! -recv  -err = MPI_Recv (-buf, -num, -typ, -src, -tag, -com, &-sta);-ret

map! -srec  -err = MPI_Sendrecv (-Sbuf, -num, -typ, -dest, -tag, -Rbuf, -num, -typ, -src, -tag, -com, &-sta);-ret

" collective
map! -scat  -err = MPI_Scatter (-Sbuf, -num, -typ, -Rbuf, -num, -typ, -root, -com);-ret
map! -bcast -err = MPI_Bcast (-buf, -num, -typ, -root, -com);-ret
map! -gath  -err = MPI_Gather (-Sbuf, -num, -typ, -Rbuf, -num, -typ, -root, -com);-ret
