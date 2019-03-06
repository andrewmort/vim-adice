" Vim syntax file
" Language: Adice
" Maintainer: Andrew Mort
" Latest Revision: 11/21/2018

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

syntax case ignore

" ***************** Operators *****************************
syntax match   adiceOperator "[|~><!)(*%@+/=?:;}{,.\^\-\[\]]"
" Use & as operator except at end of line
syntax match   adiceOperator "&\s*.\@="


" ***************** Todo *****************************
syntax keyword adiceTodo contained TODO FIXME XXX NOTE


" ***************** Comments *****************************
" Setup so that tpying first /* will create comment for entire remainder of
" file until */ is typed on the same line or & is used to continue the line
"syntax region adiceComment     start="\(/\*\)\@=" end="/\*\(.\|&\s*\n\)*\*/" contains=adiceTodo,adiceComment,@Spell
syntax region adiceComment     start="/\*" end="\*/" end="$" contains=adiceTodo,adiceSpecialLine,adiceComment,@Spell
syntax region adiceCommentLine start="\_^\s*\*" end="$" contains=adiceTodo,adiceSpecialLine,@Spell


" ***************** Strings *****************************
syntax region adiceString start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell

syntax match  adiceSpecialLine contained "&\s*$"
syntax region adiceSpecialFile contained start="\#" end="\<\w\+\>" end="$" contains=adiceOperator,adiceSpecialLine,adiceComment
syntax cluster adiceSpecialGroup contains=adiceSpecialLine,adiceSpecialFile


syntax keyword adiceFunction is_set is_signed is_string is_unsigned


" ***************** Commands *****************************
