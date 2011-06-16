
function! ApplySettings()
    let fileName = expand("%:p:h")
    " echo "file name : " . fileName
    " echo "file type : " . &filetype

    let pathChar = has('win32') ? '\' : '/'
    let pathParts = split( fileName , pathChar )
    let path = ''
    for part in pathParts
        let path .= part . pathChar
        let vimFile = path . '.localvimrc'
        if filereadable( vimFile )
            let cmd = 'sandbox source ' . vimFile
            execute cmd
        endif
    endfor

    " events :
    " - TODO : find how to register/unregister events
    " FileType : change file type

    " TODO : make configuration to support per file type settings
    " use variable 'filetype' to get current file type
   
    " autocmd : not allowed in sandbox !!
    " autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
    " once set, we can use retab! to reformat file

endfunction
