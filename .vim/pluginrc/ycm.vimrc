let g:ycm_add_preview_to_completeopt = 1 "预览开启
let g:ycm_autoclose_preview_window_after_insertion = 1 "完成后关闭预览窗口
let g:ycm_seed_identifiers_with_syntax = 1 "通过语法查找关键词
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
    \   'c' : ['->', '.'],
    \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
    \             're!\[.*\]\s'],
    \   'ocaml' : ['.', '#'],
    \   'cpp,objcpp' : ['->', '.', '::'],
    \   'perl' : ['->'],
    \   'php' : ['->', '::'],
    \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
    \   'ruby' : ['.', '::'],
    \   'lua' : ['.', ':'],
    \   'erlang' : [':'],
    \ }
"let g:ycm_key_list_previous_completion=['<Up>']
"nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
