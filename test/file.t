Prompt
  Lisp (.+)ufasoft.com (re)
  Bytes free (re)
OPEN
  $ (setq stm (open "list.t"))
  #<FILE-STREAM "list.t">
OPEN-STREAM-P
  $ (open-stream-p stm)
  T
FILE-POSITION
  $ (read-char stm)
  #\P
  $ (read-char stm)
  #\r
  $ (file-position stm)
  2
CLOSE
  $ (close stm)
  T
  $ (open-stream-p stm)
  NIL
LOAD
  $ (load "sum.lsp")
  T
  $ (sum 1 2)
  3
End

  