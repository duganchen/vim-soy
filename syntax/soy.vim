" Google Closure templates synatx file.
" Language: Soy
" Maintainer: Dugan Chen (https://github.com/duganchen)
"
if exists("b:current_syntax")
	finish
endif

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax clear
syntax case match

syntax keyword soyKeyword contained namespace
syntax keyword soyKeyword contained template
syntax keyword soyKeyword contained literal
syntax keyword soyKeyword contained print
syntax keyword soyKeyword contained msg
syntax keyword soyKeyword contained if
syntax keyword soyKeyword contained elseif
syntax keyword soyKeyword contained else
syntax keyword soyKeyword contained switch
syntax keyword soyKeyword contained case
syntax keyword soyKeyword contained default
syntax keyword soyKeyword contained foreach
syntax keyword soyKeyword contained ifempty
syntax keyword soyKeyword contained for
syntax keyword soyKeyword contained in
syntax keyword soyKeyword contained range
syntax keyword soyKeyword contained call
syntax keyword soyKeyword contained param
syntax keyword soyKeyword contained nil
syntax keyword soyKeyword contained r
syntax keyword soyKeyword contained n
syntax keyword soyKeyword contained t
syntax keyword soyKeyword contained lb
syntax keyword soyKeyword contained rb

syntax keyword soyDirective contained private
syntax keyword soyDirective contained autoescape
syntax keyword soyDirective contained noAutoescape
syntax keyword soyDirective contained id
syntax keyword soyDirective contained escapeHtml
syntax keyword soyDirective contained escapeUri
syntax keyword soyDirective contained escapeJs
syntax keyword soyDirective contained insertWordBreaks
syntax keyword soyDirective contained desc
syntax keyword soyDirective contained meaning
syntax keyword soyDirective contained data

syntax region soyCommand start="{" end="}" contains=soyKeyword, soyDirective, soyIdentifier, soyString
syntax region soyString contained start="\"" end="\""

syntax match soyIdentifier /\$\w\+/

syntax region soyComment start=/\/\*/ end='\\*\/'
syntax match soyComment /\/\/.*$/

highlight def link soyKeyword Statement
highlight def link soyDirective Type
highlight def link soyIdentifier Identifier
highlight def link soyString String
highlight def link soyComment Comment
