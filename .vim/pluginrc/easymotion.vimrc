"map <Leader> <Plug>(easymotion-prefix)
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.

nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>w <Plug>(easymotion-bd-w)
map <Leader><Leader>e <Plug>(easymotion-bd-e)
map <Leader><Leader>f <Plug>(easymotion-lineanywhere)

