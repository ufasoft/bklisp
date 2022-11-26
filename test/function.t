Prompt
  Lisp (.+)ufasoft.com (re)
  Bytes free (re)
Addition
  $ (+ 1 2 3)
  6
  $ (+)
  0
Multiplication
  $ (* 1 2 3 4)
  24
  $ (*)
  1
Environment
  $ (machine-type)
  "PDP-11"
Symbol
  $ (symbolp 'a)
  T
  $ (symbolp nil)
  T
  $ (symbolp "abc")
  NIL
  $ (eql 'b 'b)
  T
  $ (eql 'a 'b)
  NIL
  $ (symbol-value 'T)
  T
  $ (setf (symbol-value 'a) 1)
  1
  $ (let ((a 2)) a)
  2
  $ (let ((a 2)) (symbol-value 'a))
  1
  $ (set 'b 3)
  3
  $ b
  3
  $ (symbol-function 'sin)
  #<SYSTEM-FUNCTION SIN>
FDEFINITION
  $ (fdefinition 'tan)
  #<SYSTEM-FUNCTION TAN>
  $ (fdefinition '(setf car))
  #<SYSTEM-FUNCTION>
  $ (fdefinition 'if)
  #<SPECIAL-OPERATOR IF>
  $ (fdefinition 'foo)
  ОШИБКА 18 FOO
  $ (foo 1 2)
  ОШИБКА 18 FOO
  $ (psetq a 1 b 2)
  NIL
  $ (psetq a (1+ b) b (1+ a))
  NIL
  $ (list a b)
  (3 2)
  $ (find-symbol "LIST")
  LIST
  $ (find-symbol "list")
  NIL
  $ (eq 'LIST (intern "LIST"))
  T
  $ (eq (intern "ABC") (intern "ABC"))
  T
  $ (eq (intern "ABC") (intern "abc"))
  NIL
  $ (intern "abc")
  abc
  $ (setq sym 'machine-type)
  MACHINE-TYPE
  $ (unintern sym)
  T
  $ (unintern sym)
  NIL
  $ (find-symbol "MACHINE-TYPE")
  NIL
  $ (make-symbol "AbC")
  #:AbC
  $ (eq (make-symbol "A") (make-symbol "A"))
  NIL
GENSYM
  $ *gensym-counter*
  0
  $ (gensym)
  #:G0
  $ (progn (setq *gensym-counter* 10) (gensym))
  #:G10
  $ (gensym 100)
  #:G100
  $ (progn (setq *gensym-counter* 10) (gensym "PRE"))
  #:PRE10
  $ *gensym-counter*
  11
Division
  $ (/ 7 2)
  3.5
  $ (/ 10 5 6)
  .33333333333333334
  $ (/ 100 0)
  ОШИБКА 11
Character
  $ (characterp #\A)
  T
  $ (characterp "A")
  NIL
  $ (char-code #\A)
  65
  $ (char-int #\ю)
  192
  $ (char-code #\newline)
  10
  $ (char-code #\space)
  32
  $ (code-char 65)
  #\A
  $ (code-char 10)
  #\NEWLINE
  $ (code-char 300)
  NIL
  $ (digit-char 3)
  #\3
  $ (digit-char 15 16)
  #\F
  $ (digit-char 6 2)
  NIL
  $ (digit-char-p #\7)
  7
  $ (digit-char-p #\7 7)
  NIL
  $ (digit-char-p #\c 16)
  12
  $ (alpha-char-p #\K)
  T
  $ (alpha-char-p #\ц)
  T
  $ (alpha-char-p #\6)
  NIL
  $ (alpha-char-p #\")
  NIL
  $ (alphanumericp #\K)
  T
  $ (alphanumericp #\ц)
  T
  $ (alphanumericp #\6)
  T
  $ (alphanumericp #\")
  NIL
  $ (alphanumericp #\#)
  NIL
  $ (graphic-char-p #\A)
  T
  $ (graphic-char-p #\#)
  T
  $ (graphic-char-p #\Щ)
  T
  $ (graphic-char-p #\┘)
  T
  $ (graphic-char-p #\Space)
  T
  $ (graphic-char-p #\Newline)
  NIL
  $ (graphic-char-p #\TAB)
  NIL
  $ (graphic-char-p (code-char 130))
  NIL
  $ (char-upcase #\D)
  #\D
  $ (char-upcase #\щ)
  #\Щ
  $ (char-upcase #\space)
  #\SPACE
  $ (char-downcase #\D)
  #\d
  $ (char-downcase #\щ)
  #\щ
  $ (char= #\A #\A)
  T
  $ (char= #\A #\a)
  NIL
  $ (char= #\d #\d #\d)
  T
  $ (char/= #\A)
  T
  $ (char/= #\A #\B)
  T
  $ (char/= #\A #\B #\A)
  NIL
  $ (char/= #\A #\B #\C)
  T
  $ (char-equal #\A #\a #\A)
  T
  $ (char-equal #\A #\B #\A)
  NIL
  $ (char-name #\ )
  "SPACE"
  $ (char-name #\Newline)
  "NEWLINE"
  $ (char-name #\A)
  NIL
  $ (name-char "newLINE")
  #\NEWLINE
  $ (name-char "BELL")
  NIL
  $ (name-char "A")
  NIL
  $ (character #\a)
  #\a
  $ (character "a")
  #\a
  $ (character 'a)
  #\A
  $ (character 65)
  ОШИБКА 13
String
  $ (stringp "a")
  T
  $ (stringp 'a)
  NIL
  $ (stringp #\a)
  NIL
  $ (stringp nil)
  NIL
  $ (string #\d)
  "d"
  $ (string "abc")
  "abc"
  $ (string 'car)
  "CAR"
  $ (string= "abc" "abc")
  T
  $ (string= "abc" "aBc")
  NIL
  $ (string= "ab" "abc")
  NIL
  $ (string= 'abc" 'abc")
  ОШИБКА 13
  $ (string/= "abc" "abc")
  NIL
  $ (string/= "abc" "aBc")
  T
  $ (string/= "ab" "abc")
  T
  $ (string/= 'abc 'abc)
  ОШИБКА 13
  $ (string-equal "abc" "abc")
  T
  $ (string-equal "abc" "aBc")
  T
  $ (string-equal "ab" "abc")
  NIL
  $ (string-upcase "Здравствуй МИР!")
  "ЗДРАВСТВУЙ МИР!"
  $ (string-downcase "Hello World!")
  "hello world!"
  $ (setq str (copy-seq "0123ABCD890a"))
  "0123ABCD890a"
  $ (nstring-downcase str)
  "0123abcd890a"
  $ str
  "0123abcd890a"
  $ (char str 2)
  #\2
  $ (setf (char str 2) #\Z)
  #\Z
  $ (char str 2)
  #\Z
  $ (make-string 5)
  "     "
  $ (make-string 0)
  ""
Sequence
  $ (elt #(A B C) 1)
  B
  $ (elt "Hello" 0)
  #\H
  $ (elt #(A B C) 100)
  ОШИБКА 9
  $ (elt '(A B C) 5)
  ОШИБКА 9
  $ (setq seq #(A B C))
  #(A B C)
  $ (setf (elt seq 1) 'E)
  E
  $ seq
  #(A E C)
  $ (sort '(2 3 -5 4.5 0 1) #'<)
  (-5 0 1 2 3 4.5)
  $ (sort #(2 3 -5 3 4.5 0 1) #'>)
  #(4.5 3 3 2 1 0 -5)
  $ (fill #(A B C) 'Z)
  #(Z Z Z)
  $ (fill '(A B C) 'Z)
  (Z Z Z)
  $ (fill "ABC" #\Z)
  "ZZZ"
  $ (make-sequence 'string 0)
  ""
  $ (make-sequence 'string 3)
  "   "
  $ (make-sequence 'list 0)
  NIL
  $ (make-sequence 'list 2)
  (NIL NIL)
  $ (make-sequence 'vector 1)
  #(NIL)
Array
  $ (vector 1 2 'Z)
  #(1 2 Z)
  $ (vectorp #(a b c))
  T
  $ (vectorp "abc")
  T
  $ (vectorp '(a b c))
  NIL
  $ (simple-vector-p '(a b c))
  NIL
  $ (simple-vector-p #(a b c))
  T
  $ (array-dimensions #(1 2 3))
  (3)
  $ (array-dimensions "Hello")
  (5)
  $ (array-dimension "Hello" 0)
  5
  $ (array-rank #(1 2 3))
  1
  $ (arrayp nil)
  NIL
  $ (arrayp #(1 2))
  T
  $ (arrayp "aa")
  T
  $ (setq v #(1 2))
  #(1 2)
  $ (svref v 0)
  1
  $ (setf (svref v 1) 'a)
  A
  $ v
  #(1 A)
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
  $ (make-array 4)
  #(NIL NIL NIL NIL)
  $ (setq ar23 (make-array '(2 3)))
  #2A((NIL NIL NIL) (NIL NIL NIL))
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
Numbers
  $ (+)
  0
  $ (+ 1)
  1
  $ (+ 1 2 3 4)
  10
  $ (- 55.55)
  -55.55
  $ (- 0)
  0
  $ (- 10 1 2 3 4)
  0
  $ (*)
  1
  $ (* 3)
  3
  $ (* 1 0 2)
  0
  $ (* 1 -2 3 4)
  -24
  $ (/ 0.5)
  2
  $ (/ 20 5)
  4
  $ (/ 60 -2 3 5.0)
  -2
  $ (/ 1 0 3)
  ОШИБКА 11
  $ (1+ 6)
  7
  $ (1- -8.2)
  -9.2
  $ (oddp 1)
  T
  $ (oddp 124)
  NIL
  $ (evenp 1)
  NIL
  $ (evenp -2)
  T
  $ (plusp 5)
  T
  $ (plusp 0)
  NIL
  $ (minusp -5)
  T
  $ (minusp 0)
  NIL
  $ (minusp 5.2)
  NIL
  $ (zerop -0.0)
  T
  $ (zerop 0)
  T
  $ (zerop 5.2)
  NIL
  $ (signum -3.4E10)
  -1
  $ (signum 0)
  0
  $ (signum 100)
  1
ABS
  $ (abs 0)
  0
  $ (abs 1.5)
  1.5
  $ (abs -1000)
  1000
  $ pi
  3.1415926535897932
  $ (sin (/ pi 6))
  .49999999999999999
  $ (sinh 0.5)
  .52109530549374555
  $ (cosh 0.5)
  1.1276259652063799
  $ (tanh 0.5)
  .46211715726000853
EXP
  $ (exp 0)
  1
  $ (exp 3)
  20.085536923187524
EXPT
  $ (expt 3.1 0)
  1
  $ (expt 2 8)
  255.99999999999672
  $ (expt 4 0.5)
  1.9999999999999984
LOG
  $ (log 1)
  0
  $ (log 10)
  2.3025850929940457
  $ (log 100 10)
  2
  $ (sqrt 25)
  5
  $ (sqrt -10)
  ОШИБКА 5
  $ (isqrt 12)
  3
  $ (isqrt 25)
  5
  $ (isqrt 300)
  17
  $ (isqrt 325)
  18
  $ (isqrt -3)
  ОШИБКА 5
  $ (ash 3 4)
  48
  $ (ash 5 -1)
  2
  $ (floor 5.9)
  5
  $ (floor -5.9)
  -6
  $ (truncate 5.9)
  5
  $ (truncate -5.9)
  -5
  $ (rem 13 4)
  1
  $ (rem -13 4)
  -1
  $ (min 1)
  1
  $ (min 1 -3.3 2)
  -3.3
  $ (max -9)
  -9
  $ (max 1 -9.1 2)
  2
  $ (type-of (float (length #(1))))
  FLOAT
  $ (floatp 1)
  T
  $ (floatp 'A)
  NIL
  $ (floatp (length #(1 2)))
  NIL
  $ (realp (length #(1 2)))
  T
  $ (numberp 1.5)
  T
  $ (numberp (length #(1 2)))
  T
  $ (numberp nil)
  NIL
  $ (integerp 1.5)
  NIL
  $ (integerp (length #(1 2)))
  T
  $ (integerp 0)
  T
Comparison
  $ (< 1)
  T
  $ (< 2 1)
  NIL
  $ (< -5 0 6)
  T
  $ (< -5 0 0 6)
  NIL
  $ (> 1)
  T
  $ (> 2 1)
  T
  $ (> 5 0 -6)
  T
  $ (> 5 0 0 -6)
  NIL
  $ (<= 1 2 2 6)
  T
  $ (<= 5 0)
  NIL
  $ (>= 1 2 2 6)
  NIL
  $ (>= 5 5)
  T
  $ (= 2)
  T
  $ (= 0 0 4 0)
  NIL
  $ (= -0 0)
  T
  $ (/= 2)
  T
  $ (/= 2 3)
  T
  $ (/= 2 2)
  NIL
  $ (/= 2 3 2)
  NIL
  $ (/= 2 3 4)
  T
Bit operations
  $ (lognot 5)
  -6
  $ (logior 1 2 4 8)
  15
  $ (logior)
  0
  $ (logxor 1 3 7 15)
  10
  $ (logxor)
  0
  $ (logand 16 31)
  16
  $ (logand)
  -1
  $ (logandc1 8 63)
  55
  $ (logandc2 63 8)
  55
  $ (logorc1 3 0)
  -4
  $ (logorc2 65 3)
  -3
  $ (lognand 123 456)
  -73
  $ (lognor 123 456)
  -508
  $ (logeqv)
  -1
  $ (logeqv 1)
  1
  $ (logeqv 2 2)
  -1
  $ (logeqv 2 2 2)
  2
  $ (logeqv 2 2 0 0)
  -1
Function
  $ (function exp)
  #<SYSTEM-FUNCTION EXP>
  $ (function (setf elt))
  #<SYSTEM-FUNCTION>
  $ #'(lambda (x) x)
  #<FUNCTION (X) X>
  $ #'log
  #<SYSTEM-FUNCTION LOG>
  $ (functionp 'sin)
  NIL
  $ (functionp #'sin)
  T
  $ (functionp (lambda (a) a))
  T
  $ (identity 'a)
  A
  $ (reduce #'* '(1 2 3 4 5))
  120
  $ (reduce #'list '(1 2 3 4))
  (((1 2) 3) 4)
  $ (quote (+ 1 2))
  (+ 1 2)
  $ 'a
  A
  $ t
  T
  $ nil
  NIL
  $ (defun factorial (x) (if (zerop x) 1 (* x (factorial (1- x)))))
  FACTORIAL
  $ (factorial 9)
  362880
&OPTIONAL
  $ (defun foo (a &optional (b 8) c) (list a b c))
  FOO
  $ (foo 1)
  (1 8 NIL)
  $ (foo 1 2)
  (1 2 NIL)
  $ (foo 1 2 3)
  (1 2 3)
&REST
  $ (defun bar (a &rest r) (list a r))
  BAR
  $ (bar 1)
  (1 NIL)
  $ (bar 1 2)
  (1 (2))
  $ (bar 1 2 3 4)
  (1 (2 3 4))
INTERNAL-TIME-UNITS-PER-SECOND
  $ internal-time-units-per-second
  366
SLEEP
  $ (sleep 5)
  NIL
Random
  $ *random-state*
  (.94360820238906329 . 0)
  $ (setq rs (make-random-state nil))
  (.94360820238906329 . 0)
  $ (random 100.0)
  96.788540984934938
  $ (random 100.0)
  70.905566390271913
  $ (random 100.0)
  72.143579053628237
  $ (random 100.0 rs)
  96.788540984934938
  $ (random 100.0 rs)
  70.905566390271913
  $ (random 100.0 rs)
  72.143579053628237
Control
  $ (setq one 1)
  1
  $ (let ((one 2)) (eval 'one))
  1
  $ (special-operator-p 'car)
  NIL
  $ (special-operator-p 'if)
  T
  $ (special-operator-p nil)
  NIL
REPL
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
End

  
