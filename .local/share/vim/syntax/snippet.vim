" Vim syntax file
" Language:         Generic snippet files
" Maintainer:       Natanael Rabello
" Latest Revision:  2021-21-25
" Changes:          2021-21-25 Initial version

if exists("b:current_syntax")
  finish
endif

syn match title '>>>.*'
syn match number '0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'
syn match comment '#.*'

let b:current_syntax = "snippet"
