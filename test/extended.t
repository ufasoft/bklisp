Prompt
  Lisp (.+)ufasoft.com (re)
  Bytes free (re)
Arrays
  $ (array-dimensions #(1 2 3))
  (3)
  $ (array-dimensions "Hello")
  (5)
  $ (array-dimension "Hello" 0)
  5
  $ (array-rank #(1 2 3))
  1
ARRAY-IN-BOUNDS-P
  $ (array-in-bounds-p ar23 0 0)
  T
  $ (array-in-bounds-p ar23 1 2)
  T
  $ (array-in-bounds-p ar23 0 -1)
  NIL
  $ (array-in-bounds-p ar23 10 12)
  NIL
AREF
  $ (setf (aref ar23 1 2) 'Z)
  Z
  $ (aref ar23 1 2)
  Z
  $ (aref #(A B C) 2)
  C
  $ (aref #(A B C) 5)
  ОШИБКА 9
ARRAY-TOTAL-SIZE
  $ (array-total-size (make-array '(2 3 5)))
  30
  $ (array-total-size #(1 2 3))
  3
ARRAY-ROW-MAJOR-INDEX
  $ (let ((a (make-array '(4 7)))) (array-row-major-index a 1 2))
  9
  $ (let ((a (make-array '(2 3 4)))) (array-row-major-index a 0 2 1))
  9
ROW-MAJOR-AREF
  $ (setf (row-major-aref ar23 4) 'B)
  B
  $ ar23
  #2A((NIL NIL NIL) (NIL B Z))
  $ (row-major-aref ar23 4)
  B
ARRAYP
  $ (arrayp nil)
  NIL
  $ (arrayp #(1 2))
  T
  $ (arrayp "aa")
  T
Array reader
  $ #0ANIL
  #0ANIL
  $ #0A123
  #0A123
  $ #1A(A B)
  #1A(A B)
  $ #2A((A NIL NIL) (B C D) (E F NIL))
  #2A((A NIL NIL) (B C D) (E F NIL))
MAKE-ARRAY
  $ (setq ar23 (make-array '(2 3)))
  #2A((NIL NIL NIL) (NIL NIL NIL))
ARRAY-RANK-LIMIT
  $ array-rank-limit
  \d+			 	(re)
ARRAY-DIMENSION-LIMIT
  $ array-dimension-limit
  \d\d\d			(re)
ARRAY-TOTAL-SIZE-LIMIT
  $ array-total-size-limit
  \d\d\d			(re)
VALUES
  $ (values)
  $ (values 1 (+ 2 3) 4)
  1 ;
  5 ;
  4
REST
  $ (rest '(1 . 2))
  2
CAADR
  $ (setq tree '(a (b x) c d e))
  (A (B X) C D E)
  $ (caadr tree)
  B
FLOAT functions
  $ (float-radix 1.2)
  2
SCALE-FLOAT
  $ (scale-float 1.0 1)
  2
  $ (scale-float 10.01 -2)
  2.5025
  $ (scale-float 23.0 0)
  23
TRACE / UNTRACE
  $ (defun fact (x) (if (<= x 1) 1 (* x (fact (1- x)))))
  FACT
  $ (trace fact sin)
  (SIN FACT)
  $ (fact 3)
   FACT <- (3)
    FACT <- (2)
     FACT <- (1)
     FACT -> 1
    FACT -> 2
   FACT -> 6
  6
  $ (untrace FACT)
  (FACT)
  $ (trace)
  (SIN)
  $ (fact 4)
  24
Extended FLOOR / TRUNCATE
  $ (multiple-value-list (floor -6.5 2))
  (-4 1.5)
  $ (multiple-value-list (truncate -6.5 2))
  (-3 -.5)
+++ *** ///
  $ (+ 0 1)
  1
  $ (- 4 2)
  2
  $ (/ 9 3)
  3
  $ (list + ++ +++)
  ((/ 9 3) (- 4 2) (+ 0 1))
  $ (+ 4 5)
  9
  $ (+ 1 2)
  3
  $ *
  3
  $ ***
  9
  $ (floor 22 7)
  3 ;
  1
  $ (+ (* (car /) 7) (cadr /))
  22
End

  
