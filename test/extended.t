Prompt
  Lisp (.+)ufasoft.com (re)
  Bytes free (re)
ARRAY-RANK-LIMIT
  $ array-RANK-limit
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
TIME
  $ (get-universal-time)
  38\d{8}			(re)
  $ (encode-universal-time 1 2 3 14 8 2022)
  3869434921
  $ (multiple-value-list (decode-universal-time 3869434921))
  (1 2 3 14 8 2022 6 NIL 0)
  $ (multiple-value-list (get-decoded-time))
  (\d\d? \d\d? \d\d? \d\d? \d\d? 20\d\d \d NIL 0)						(re)
End

  
