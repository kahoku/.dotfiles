"https://blog.csdn.net/smstong/article/details/20775695
"函数定义
"添加或更新头
map <F6> :call TitleDet()<CR>4GA
function! AddTitle()
    call append(0,"<?php")
    call append(1,"/**")
    call append(2," * Filename  : ".expand("%:t"))
    call append(3," * Describe  : ")
    call append(4," * Author    : lixiaoxing")
    call append(5," * Since     : ".strftime("%Y-%m-%d %H:%M"))
    call append(6," * $Id$")
    call append(7," */")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

"更新最近修改时间和文件名
function! UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function! TitleDet()
    call AddTitle()
endfunction


vnoremap <S-t> :call Translate()<cr>
nnoremap <leader>t :let a=expand("<cword>")<Bar> execute "!tr.py " .a<cr>


function! Translate() range
    let b=Get_visual_selection()
    "替换不了 \[\t这些字符，还不知道原因
    let bb = substitute(b,"[^a-zA-z0-9.,']", " ", "g")
    "let bb = substitute(b,"[\"\(\)\'\#\:]", " ", "g")
    "echo bb
    execute "!tr.py " .bb
endfunction    

function! Get_visual_selection() range
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, " ")
endfunction
