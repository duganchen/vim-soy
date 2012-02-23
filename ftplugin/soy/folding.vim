setlocal foldmethod=expr
setlocal foldexpr=GetSoyFold(v:lnum)

" Main foldexpr function called for every line.
function! GetSoyFold(lnum)
  " Don't fold the namespace.
  if getline(a:lnum) =~? '^{namespace.*$'
    return '0'
  endif
  
  " Open fold level 1 for comments.
  if getline(a:lnum) =~? '\v\/\*\*.*$'
    return '>1'
  endif
  
  " Close fold level 1 for comments.
  if getline(a:lnum) =~? '\v\s\*\/$'
    return '<1'
  endif
  
  " Empty lines get the fold level of the lesser neighbor level
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif

  " Open fold level 1 for template region.
  if getline(a:lnum) =~? '^{template.*$'
    return '>1'
  endif

  " Close fold level 1 for template region.
  if getline(a:lnum) =~? '^{/template}$'
    return '<1'
  endif

  " for everything else return unknown level
  return '-1'
endfunction
