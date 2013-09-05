if (exists('g:did_load_buffalator'))
  exit
endif
let g:did_load_buffalator = 1

command! -nargs=* Buffalate call buffalator#Buffalate(<f-args>)
