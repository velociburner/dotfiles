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
