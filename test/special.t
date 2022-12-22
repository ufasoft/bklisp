Prompt
  Lisp (re)
  Bytes free (re)
Control Flow
  $ (funcall '+ 1 2 3)
  6
  $ (apply '+ 1 2 '(3 4))
  10
  $ (eval '(* 3 (+ 2 3)))
  15
  $ (prog1 'A 'B (prin1 1) 'D)
  1
  A
  $ (prog2 'A 'B (prin1 1) 'D)
  1
  B
  $ (progn (error 'test-error) 2)
  ОШИБКА TEST-ERROR
BLOCK
  $ (block nil (return) 1)
  NIL
  $ (block nil (return 1) 2)
  1
  $ (block nil (block alpha (return 1) 2))
  1
  $ (block alpha (block nil (return 1)) 2)
  2
  $ (block nil (block nil (return 1) 2))
  1
  $ (block early (return-from early 1) 2)
  1
PROGV
  $ (setq *x* 1)
  1
  $ (progv '(*x*) '(2) *x*)
  2
  $ (let ((*x* 3)) (progv '(*x*) '(4) (list *x* (symbol-value '*x*))))
  (3 4)
LET
  $ (setq a 'top)
  TOP
  $ (defun dummy-function () a)
  DUMMY-FUNCTION
  $ (let ((a 'inside) (b a)) (format nil "~S ~S ~S" a b (dummy-function)))
  "INSIDE TOP TOP" 
  $ (let* ((a 'inside) (b a)) (format nil "~S ~S ~S" a b (dummy-function)))
  "INSIDE INSIDE TOP" 
DOLIST
  $ (let (r) (dolist (a '(1 2 3) r) (push a r)))
  (3 2 1)
  $ (dolist (e '(1 2 3) (+ 5 5)) (print e))
  1
  2
  3
  10
DOTIMES
  $ (dotimes (n 3 n) (print n))
  0
  1
  2
  3
DO
  $ (do ((temp-one 1 (1+ temp-one)) (temp-two 0 (1- temp-two))) \
    ((> (- temp-one temp-two) 5) temp-one))
  4
  $ (do ((temp-one 1 (1+ temp-one)) (temp-two 0 (1+ temp-one))) \
    ((= 3 temp-two) temp-one))
  3
DO*
  $ (do* ((temp-one 1 (1+ temp-one)) (temp-two 0 (1+ temp-one))) \
    ((= 3 temp-two) temp-one))
  2
SETQ
  $ (setq x (cons 'a 'b) y (list 1 2 3))
  (1 2 3) 
SETF
  $ (setf (car x) 'x (nth 1 y) (car x))
  X
  $ x
  (X . B) 
  $ y
  (1 X 3)
PUSH, POP
  $ (setq lst '(1))
  (1)
  $ (push 'a lst)
  (A 1)
  $ lst
  (A 1)
  $ (pop lst)
  A
  $ lst
  (1)
  $ (progn (pop lst) (pop lst))
  NIL
  $ lst
  NIL
INCF, DECF
  $ (progn (setq n 0) (incf n))
  1
  $ n
  1
  $ (list (decf n 3) n)
  (-2 -2)
  $ (list (decf n -5) (decf n))
  (3 2)
  $ (list (incf n 0.5) (decf n) n)
  (2.5 1.5 1.5)
ROTATEF
  $ (setq a 1 b 2 c 3)
  3
  $ (rotatef a b c)
  NIL
  $ (list a b c)
  (2 3 1)
Variable
  $ (boundp 'abc)
  NIL
  $ (boundp 'pi)
  T
  $ (setf (symbol-value 'abc) 1)
  1
  $ (boundp 'abc)
  T
  $ (let ((def 1)) (boundp 'def))
  NIL
  $ (makunbound 'abc)
  ABC
  $ (boundp 'abc)
  NIL
  $ (fboundp 'asin)
  #<SYSTEM-FUNCTION ASIN>
  $ (fmakunbound 'asin)
  ASIN
  $ (fboundp 'asin)
  NIL
DEFVAR
  $ (defvar avar (+ 2 3))
  AVAR
  $ avar
  5
  $ (defvar avar 10)
  AVAR
  $ avar
  5
  $ (defvar bvar)
  BVAR
  $ (boundp 'bvar)
  NIL
DEFPARAMETER
  $ (defparameter pvar (+ 2 3))
  PVAR
  $ pvar
  5
  $ (defparameter pvar 10)
  PVAR
  $ pvar
  10
Branching
  $ (if t 1)
  1
  $ (if (null 1) 1 2)
  2
  $ (if nil 1)
  NIL
  $ (when t)
  NIL
  $ (when t (prin1 1) (prin1 2) (prin1 3))
  123
  3
  $ (when nil (prin1 1) (prin1 2) (prin1 3))
  NIL
  $ (unless t)
  NIL
  $ (unless t (prin1 1) (prin1 2) (prin1 3))
  NIL
  $ (unless nil (prin1 1) (prin1 2) (prin1 3))
  123
  3
  $ (cond (nil 1) (nil 2))
  NIL
  $ (defun select-options () (cond ((= a 1) (setq a 2)) \
    ((= a 2) (setq a 3)) ((and (= a 3) (+ a 10))) (t (+ a 20))))
  SELECT-OPTIONS
  $ (setq a 1)
  1
  $ (select-options)
  2
  $ a
  2
  $ (select-options)
  3
  $ a
  3
  $ (select-options)
  13
  $ (progn (setq a 5) (select-options))
  25
  $ (funcall (lambda (x) (+ x 3)) 4)
  7
  $ (defun adder (n) (lambda (x) (+ x n)))
  ADDER
  $ (setq add (adder  5))
  #<FUNCTION (X) (+ X N)>
  $ (funcall add 7)
  12
Logic
  $ (and)
  T
  $ (and 'a 'b 'c)
  C
  $ (and (prin1 1) (prin1 2) (prin1 3) NIL (prin1 4))
  123
  NIL
  $ (or)
  NIL
  $ (or nil (+ 2 2) nil 5)
  4
TIME
  $ (time (+ 1 2))
  \d+ ms  (re)
  3
End

  
