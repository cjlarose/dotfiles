function! s:logbook_new(name)
  let l:basename = strftime('%Y-%m-%d') . '-' . a:name . '.md'
  let l:fname = fnamemodify("~/logbook/" . l:basename, ":p")
  execute "e " . l:fname
endfunction

command! -nargs=1 LogbookNew :call s:logbook_new(<q-args>)

function! s:logbook_list()
  execute 'FzfFiles ' . fnamemodify("~/logbook/", ":p")
endfunction

command! -nargs=0 LogbookList :call s:logbook_list()
