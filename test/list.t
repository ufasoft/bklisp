Prompt
  Lisp (re)
  Bytes free (re)
List
  $ (null nil)
  T
  $ (null 'a)
  NIL
  $ (atom nil)
  T
  $ (atom '(a a))
  NIL
  $ (listp nil)
  T
  $ (listp (cons 1 2))
  T
  $ (listp #(1 2))
  NIL
  $ (listp t)
  NIL
  $ (rest '(1 . 2))
  2
  $ (make-list 0)
  NIL
  $ (make-list 3)
  (NIL NIL NIL)
  $ (list* 1 2 3 4)
  (1 2 3 . 4)
  $ (setq lst (list 1 2 4))
  (1 2 4)
  $ (tailp (cdr lst) lst)
  T
  $ (tailp (copy-list (cdr lst)) lst)
  NIL
  $ (tailp nil lst)
  T
  $ (ldiff lst (cddr lst))
  (1 2)
  $ (ldiff lst 6)
  (1 2 4)
  $ (length '(a b c))
  3
  $ (nth 2 '(A B C D))
  C
  $ (nth 10 '(A B C D))
  NIL
  $ (setq lst '(A B C D))
  (A B C D)
  $ (setf (nth 2 lst) 'Z)
  Z
  $ lst
  (A B Z D)
  $ (setf (nth 10 lst) 'Z)
  ОШИБКА 9
  $ (nthcdr 2 '(A B C D))
  (C D)
  $ (nthcdr 5 '(A B C D))
  NIL
  $ (nthcdr 0 'A)
  A
  $ (setq lst '(1 2 3))
  (1 2 3)
  $ (first lst)
  1
  $ (second lst)
  2
  $ (third lst)
  3
  $ (second '(1))
  NIL
  $ (setf (second lst) "two")
  "two"
  $ lst
  (1 "two" 3)
  $ (setq cycle '(a b))
  (A B)
  $ (list-length cycle)
  2
  $ (progn (nconc cycle cycle) nil)
  NIL
  $ (list-length cycle)
  NIL
  $ (member 'b '(a b c))
  (B C)
MEMBER
  $ (member 'z '(a b c))
  NIL
REMOVE
  $ (remove 'b '(a b c))
  (A C)
  $ (remove 'b #(a b c))
  #(A C)
COERCE
  $ (coerce #(a b c) 'list)
  (A B C)
ADJOIN
  $ (adjoin 2 '(3 4 5))
  (2 3 4 5)
  $ (adjoin 4 '(3 4 5))
  (3 4 5)
  $ (last '(a b c))
  (C)
  $ (last '(a b c) 2)
  (B C)
  $ (last '(a b c . d) 0)
  D
  $ (last '(a b c) 4)
  (A B C)
  $ (setq lst '(1 2 3 4 5 6 7 8 9))
  (1 2 3 4 5 6 7 8 9)
  $ (butlast lst)
  (1 2 3 4 5 6 7 8)
  $ (butlast lst 5)
  (1 2 3 4)
  $ (butlast lst (+ 5 5))
  NIL
  $ lst
  (1 2 3 4 5 6 7 8 9)
  $ (nconc '(a b) '(c d))
  (A B C D)
  $ (append '(a b) nil '(c d))
  (A B C D)
  $ (setq str "a string")
  "a string"
  $ (equalp str (copy-seq str))
  T
  $ (eql str (copy-seq str))
  NIL
  $ (equal (cons 'a 'b) (cons 'a 'b))
  T
  $ (equal (cons 'a 'b) (cons 'a 'c))
  NIL
  $ (equalp #\A #\a)
  T
  $ (equalp #\A #\B)
  NIL
  $ (equal "Foo" "Foo")
  T
  $ (equal "FOO" "foo")
  NIL
  $ (reverse NIL)
  NIL
  $ (reverse '(1 2 3))
  (3 2 1)
  $ (reverse #())
  #()
  $ (reverse #(1 2 3))
  #(3 2 1)
  $ (reverse "")
  ""
  $ (reverse "ABC")
  "CBA"
LISTIFY
  $ (listify 1)
  (1)
  $ (listify '(1))
  (1)
  $ (listify nil)
  NIL
MAPCAR
  $ (mapcar #'car '((1 a) (2 b) (3 c)))
  (1 2 3)
  $ (mapcar #'abs '(3 -4 2 -5 -6))
  (3 4 2 5 6)
  $ (mapcar #'cons '(a b c) '(1 2 3 4))
  ((A . 1) (B . 2) (C . 3))
MAPC
  $ (let (dummy) (list (mapc #'(lambda (&rest x) (setq dummy (append dummy x))) \
    '(1 2 3 4) '(a b c d e) '(x y z)) dummy))
  ((1 2 3 4) (1 A X 2 B Y 3 C Z))
A-List
  $ (acons 1 "one" nil)
  ((1 . "one"))
  $ (setq values '((x . 100) (y . 200) (z . 50)))
  ((X . 100) (Y . 200) (Z . 50))
  $ (assoc 'y values)
  (Y . 200)
  $ (setq alist '((1 . "one") (2 . "two") (3 . 3)))
  ((1 . "one") (2 . "two") (3 . 3))
  $ (rassoc 3 alist)
  (3 . 3)
  $ (setq *alist* (acons 1 "one" (acons 2 "two" '())))
  ((1 . "one") (2 . "two"))
  $ (setq *list-copy* (copy-list *alist*))
  ((1 . "one") (2 . "two"))
  $ (setq *alist-copy* (copy-alist *alist*))
  ((1 . "one") (2 . "two"))
  $ (rplacd (assoc 2 *alist-copy*) "deux")
  (2 . "deux")
  $ *alist-copy*
  ((1 . "one") (2 . "deux"))
  $ *alist*
  ((1 . "one") (2 . "two"))
  $ (rplacd (assoc 1 *list-copy*) "uno")
  (1 . "uno")
  $ *list-copy*
  ((1 . "uno") (2 . "two"))
  $ *alist*
  ((1 . "uno") (2 . "two"))
  $ (setq object (list (cons 1 "one") (cons 2 (list 'a 'b 'c))))
  ((1 . "one") (2 A B C))
  $ (setq object-too object)
  ((1 . "one") (2 A B C))
  $ (psetq copy-as-list (copy-list object) copy-as-alist (copy-alist object) \
    copy-as-tree (copy-tree object))
  NIL
  $ (eq object object-too)
  T
  $ (eq copy-as-tree object)
  NIL
  $ (eql copy-as-tree object)
  NIL
  $ (equal copy-as-tree object)
  T
  $ (setf (nth 0 (cdr (nth 1 object))) "a")
  "a"
  $ (setf (car (nth 1 object)) "two")
  "two"
  $ (setf (car object) '(one . 1))
  (ONE . 1)
  $ object
  ((ONE . 1) ("two" "a" B C))
  $ object-too
  ((ONE . 1) ("two" "a" B C))
  $ copy-as-list
  ((1 . "one") ("two" "a" B C))
  $ copy-as-alist
  ((1 . "one") (2 "a" B C))
  $ copy-as-tree
  ((1 . "one") (2 A B C)) 
  $ (psetq keys '(1 2 3) data '("one" "two" "three") alist '((4 . "four")))
  NIL
  $ (pairlis keys data)
  ((3 . "three") (2 . "two") (1 . "one"))
  $ (pairlis keys data alist)
  ((3 . "three") (2 . "two") (1 . "one") (4 . "four"))
SUBST
  $ (setq tree1 '(1 (1 2) (1 2 3) (1 2 3 4)))
  (1 (1 2) (1 2 3) (1 2 3 4))
  $ (subst "two" 2 tree1)
  (1 (1 "two") (1 "two" 3) (1 "two" 3 4))
  $ (subst "five" 5 tree1)
  (1 (1 2) (1 2 3) (1 2 3 4))
  $ (subst 'tempest 'hurricane '(shakespeare wrote (the hurricane)))
  (SHAKESPEARE WROTE (THE TEMPEST))
  $ (subst 'foo 'nil '(shakespeare wrote (twelfth night)))
  (SHAKESPEARE WROTE (TWELFTH NIGHT . FOO) . FOO)
Set
  $ (union '(a b c) '(f a d))
  (C B F A D)
  $ (intersection '(a b c f) '(f a d))
  (F A)
  $ (set-difference '(a b c f) '(f a d))
  (C B)
  $ (subsetp '(a b c f) '(f a d))
  NIL
  $ (subsetp '(a b) '(f a d b))
  T
  $ (subsetp NIL '(f a d b))
  T
Property List
  $ (setf (get 'a 'prop) 1)
  1
  $ (get 'a 'prop)
  1
  $ (remprop 'a 'prop)
  T
  $ (remprop 'a 'prop)
  NIL
  $ (get 'a 'prop)
  NIL
  $ (getf '(a 1 b 2 c 3) 'b)
  2
  $ (getf '(a 1 b 2 c 3) 'd)
  NIL
  $ (getf '(a 1 b 2 c 3) 'd 5)
  5
End

  
