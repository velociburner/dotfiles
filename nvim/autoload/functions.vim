function functions#OpenTemplate()
    if filereadable('template')
        read template
        normal! kdd
    else
        echohl WarningMsg
        echom 'Template file does not exist in the current directory'
        echohl None
    endif
endfunction

function functions#GotoChar(num)
    "  is necessary, <CR> doesn't work here
    " also, the space at the end is important because of off-by-one errors
    execute 'normal! /\%^\_.\{' . a:num . '}/e '
endfunction
