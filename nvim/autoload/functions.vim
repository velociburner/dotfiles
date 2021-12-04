function functions#OpenTemplate()
    if filereadable('template.txt')
        0read template.txt
    else
        echohl WarningMsg
        echom 'Template file does not exist in the current directory'
        echohl None
    endif
endfunction
