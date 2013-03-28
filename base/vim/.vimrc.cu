" vi map for CUDA
"
" 12.10.11
" 11.12.12 m
"
"
" use ,,cu to load
" use ,[name]
"
"

map! -ret( <ESC>?(<CR>:silent noh<CR>:<CR><RIGHT>
map! -ret& <ESC>?&<CR>:silent noh<CR>:<CR><RIGHT>
map! -retSPACE <ESC>?\ <CR>:silent noh<CR>:<CR><RIGHT>
map! -ret0 <ESC>^

map! -dpnt d_pnt
map! -hpnt h_pnt
map! -dev dev
map! -src src
map! -dst dst
map! -num num
map! -dir dir
map! -str Stream
map! -evn Event
map! -pro prop
map! -time Etime
map! -start start
map! -end end

" index "
map! ,tix threadIdx.x
map! ,tiy threadIdx.y
map! ,bix blockIdx.x
map! ,biy blockIdx.y
map! ,bdx blockDim.x
map! ,bdy blockDim.y


" kernel launch "
map! ,ker kernel<<<numBlock, numThread, constMemory, stream>>>();-ret0

" device managment "
map! ,dcou cudaGetDeviceCount(&-dev);-ret&
map! ,dset cudaSetDevice(-dev);-ret(
map! ,dget cudaGetDevice(&-dev);-ret&
map! ,dsyn cudaDeviceSynchronize();<CR>
map! ,dpro cudaGetDeviceProperties(&-pro, -dev)-ret&

" memory managment "
map! ,cmal  cudaMalloc( (void**) &-dpnt, -num);-ret&
map! ,cmalh cudaMallocHost( (void**) &-hpnt, -num);-ret&
map! ,cfre  cudaFree(-dpnt);-ret(
map! ,cfreh cudaFreeHost(-hpnt);-ret(

" memory copy "
map! ,cp   cudaMemcpy(-dst, -src, -num, -dir);-ret
map! ,acp  cudaMemcpyAsync(-dst, -src, -num, -dir, -str);-ret

map! ,h2h  cudaMemcpyHostToHost
map! ,h2d  cudaMemcpyHostToDevice
map! ,d2h  cudaMemcpyDeviceToHost
map! ,d2d  cudaMemcpyDeviceToDevice

" strream managment "
map! ,str  cudaStream_t ;-retSPACE
map! ,scre cudaStreamCreate(&-str);-ret&
map! ,sdes cudaStreamDestroy(-str);-ret(
map! ,ssyn cudaStreamSynchronize(-str);-ret(

" event managment "
map! ,ev   cudaEvent_t ;-retSPACE
map! ,ecre cudaEventCreate(&-evn);-ret&
map! ,edes cudaEventDestroy(-evn);-ret(
map! ,esyn cudaEventSynchronize(-evn);-ret(
map! ,erec cudaEventRecord(-evn, -str);-ret(
map! ,etim cudaEventElapsedTime(&-time, -start, -end);-ret&

" peer2peer "
map! ,pcan cudaDeviceCanAccessPeer(&can, from, to);-ret&
map! ,pena cudaDeviceEnablePeerAccess(-dev, 0);-ret(
map! ,pdis cudaDeviceDisablePeerAccess(-dev);-ret(
map! ,pcp  cudaMemcpyPeer(-dst, -dst-dev, -src, -src-dev, -num);-ret(
map! ,pcpa cudaMemcpyPeerAsync(-dst, -dst-dev, -src, -src-dev, -num, -str);-ret(

:function! Clean()
: unmap! ,str
:endfunction
