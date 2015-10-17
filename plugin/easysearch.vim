if exists('g:loaded_easy_search')
  finish
endif
let g:loaded_easy_search = 1

let g:esearch_settings = esearch#opts#new(get(g:, 'esearch_settings', {}))

noremap <silent><Plug>(easysearch) :<C-u>call esearch#pre(0)<CR>
xnoremap <silent><Plug>(easysearch) :<C-u>call esearch#pre(1)<CR>

let mappings = esearch#mappings().dict()
for map in keys(mappings)
  exe 'map ' . map . ' ' . mappings[map]
endfor

command! -nargs=1 ESearch call esearch#start(<f-args>, $PWD)
