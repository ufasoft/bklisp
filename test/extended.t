Prompt
  Lisp (.+)ufasoft.com (re)
  Bytes free (re)
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
  
End

  
