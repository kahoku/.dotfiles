let g:ctrlp_map = '<Leader>s'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = {
    \ 'dir' : '\v[\/](test(s*)|themes|vendor|cache|fedev|language|deploy|log(s*)|project|third(_party)*|lib[\/]|Smarty|font|img|default\/module|assets)|core\/data|(elasticsearch|majia|aliyun)|(\.(swp|git|hg|svn))$',
    \ 'file' : '\v\.(exe|so|dll|pem|css|png|gif|jpg|ico|sh|prj|txt|prj|html|htm|js)$',                                                      
    \ 'link' : 'SOME_BAD_SYMBOLIC_LINKS',
    \ }


