Prompt
  Lisp (.+)ufasoft.com (re)
  Bytes free (re)
I/O variables
  $ *print-base*
  10
  $ (let ((*print-base* 8)) (print 32766))
  77776
  32766
  $ *print-escape*
  T
  $ *print-radix*
  NIL
  $ (let ((*print-radix* t)) *print-radix*)
  T
  $ (let ((*print-radix* nil)) (format nil "~S" 14))
  "14"
  $ (let ((*print-radix* t)) (format nil "~S" 14))
  "14."
  $ (let ((*print-radix* t) (*print-base* 2)) (format nil "~S" 14))
  "#b1110"
  $ (let ((*print-radix* t) (*print-base* 8)) (format nil "~S" 14))
  "#o16"
  $ (let ((*print-radix* t) (*print-base* 16)) (format nil "~S" 14))
  "#xE"
Streams
  $ (streamp *standard-input*)
  T
  $ (streamp *standard-output*)
  T
  $ (streamp (make-string-output-stream))
  T
  $ (streamp (make-string-input-stream "a"))
  T
  $ (streamp nil)
  NIL
  $ (input-stream-p *standard-input*)
  T
  $ (input-stream-p (make-string-output-stream))
  NIL
  $ (input-stream-p (make-string-input-stream "a"))
  T
  $ (open-stream-p (make-string-input-stream "a"))
  T
Input
  $ (read (make-string-input-stream "123"))
  123
  $ (setq stm (make-string-input-stream "1 2 3 ]"))
  #<STREAM>
  $ (read-delimited-list #\] stm)
  (1 2 3)
  $ (setq stm (make-string-input-stream "123"))
  #<STREAM>
  $ (unread-char (read-char stm) stm)
  NIL
  $ (read-char stm)
  #\1
  $ (setq stm (make-string-input-stream "  123"))
  #<STREAM>
  $ (peek-char nil stm)
  #\SPACE
  $ (peek-char t stm)
  #\1
  $ (peek-char #\3 stm)
  #\3
  $ (peek-char nil stm)
  #\3
Output
  $ 'quit
  QUIT
WRITE-CHAR
  $ (write-char #\ю)
  ю
  #\ю
  $ (let ((stm (make-string-output-stream))) (write-char #\K stm) \
    (list (get-output-stream-string stm) (get-output-stream-string stm)))
  ("K" "")
WRITE
  $ (let ((*print-escape* nil)) (write "ABC"))
  ABC
  "ABC"
  $ (let ((*print-escape* nil)) (write #\b))
  b
  #\b
  $ (prin1 #\A)
  #\A
  #\A
  $ (progn (princ "A") (fresh-line) (princ "B") (fresh-line))
  A
  B
  #<STREAM>
PRINC
  $ (defun fillstm (stm) (princ "A" stm) (fresh-line stm) \
    (fresh-line stm) (princ "B" stm))
  FILLSTM 
  $ (let ((stm (make-string-output-stream))) (fillstm stm) \
    (length (get-output-stream-string stm)))
  3
PRINT
  $ (print 123)
  123
  123
  $ (let ((stm (make-string-output-stream))) (print #\A stm) \
    (length (get-output-stream-string stm)))
  5
  $ (progn (write-string "AA") (write-string "BB") )
  AABB
  "BB"
  $ (progn (write-line "AA") (write-line "BB"))
  AA
  BB
  "BB"
  $ (write-line "A\"B")
  A"B
  "A\"B"
  $ (let ((stm (make-string-output-stream))) (write-line "ABC" stm) \
    (length (get-output-stream-string stm)))
  4
  $ (let ((stm (make-string-output-stream))) (write-string "testing... " stm) \
    (prin1 1234 stm) (get-output-stream-string stm))
  "testing... 1234"
Format
  $ (format t "Hello")
  Hello
  NIL
  $ (format nil "Hello")
  "Hello"
  $ (format nil "A~~B")
  "A~B"
  $ (format nil "A~&B")
  "A
  B"
  $ (length (format nil "A~&~&B"))
  3
  $ (length (format nil "A~%~%B"))
  4
  $ (format nil "A ~A B" "CC")
  "A CC B"
  $ (format nil "A ~S B" "CC")
  "A \"CC\" B"
  $ (format nil "~C" #\Space)
  " "
  $ (format nil "Bin: ~b" 123)
  "Bin: 1111011"
  $ (format nil "Oct: ~o" 123)
  "Oct: 173"
  $ (format nil "Hex: ~x" 123)
  "Hex: 7B"
  $ (format nil "Dec: ~d" 123)
  "Dec: 123"
End

  
