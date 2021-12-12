function functions#OpenTemplate()
    if filereadable('template')
        0read template
    else
        echohl WarningMsg
        echom 'Template file does not exist in the current directory'
        echohl None
    endif
endfunction
