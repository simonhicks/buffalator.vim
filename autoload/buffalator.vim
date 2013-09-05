if (exists('g:did_autoload_buffalator'))
  exit
endif
let g:did_autoload_buffalator = 1

function! s:BufferMatches(bufNum, pattern)
  return match(bufname(a:bufNum), a:pattern) != -1 || a:pattern == ''
endfunction

function! s:ValidBuffer(bufNum)
  return bufexists(a:bufNum) && buflisted(a:bufNum)
endfunction

function! s:BufferList(pattern)
  let currentBuffer = 1
  let maxBuffer = bufnr('$')
  let activeBuffers = []
  while currentBuffer <= maxBuffer
    if s:ValidBuffer(currentBuffer) && s:BufferMatches(currentBuffer, a:pattern)
      call add(activeBuffers, currentBuffer)
    endif
    let currentBuffer += 1
  endwhile
  return activeBuffers
endfunction

function! s:BufferModified(bufNum)
  return getbufvar(a:bufNum, "&modified")
endfunction

function! s:EchoBuffer(bufNum)
  let name = bufname(a:bufNum)
  let status = s:BufferModified(a:bufNum) ? "+" : " "
  echom a:bufNum . ". " . status . " " . (name != '' ? name : '[No Name]')
endfunction

function! s:EchoBuffers(pattern)
  let bufNums = s:BufferList(a:pattern)
  for bufNum in bufNums
    call s:EchoBuffer(bufNum)
  endfor
endfunction

function! s:BufferMenu(pattern)
  call s:EchoBuffers(a:pattern)
  return input(':')
endfunction

function! buffalator#Buffalate(...)
  let pattern = a:0 ? a:1 : ''
  while 1
    let cmd = s:BufferMenu(pattern)
    if cmd == ''
      return 0
    elseif match(cmd, '^[[:space:]]*\d\d*[[:space:]]*$') != -1
      execute "buffer" . cmd
      redraw
      return 0
    else
      execute cmd
      redraw
    endif
  endwhile
endfunction
