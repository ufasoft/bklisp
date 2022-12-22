(format t "~A ~A~%" (machine-type) (machine-version))


(defvar siz 9)

(defun guess (board)
  (setq empties nil)
  (setq emplen 0)
  (dotimes (i (length board))
     (if (eql #\0 (char board i))
       (push i empties)))
  (setq emplen (length empties))
  (do ((step 0)
       (digit 9 (1- digit))
       dc
       idx)
      (nil)

    (setq dc (digit-char digit))
    (setq idx (elt empties step))

    (format t "s: ~A  d: ~A ~%" step digit)

    (cond
      ((zerop digit)
         (setf (char board idx) #\0)
         (if (minusp (decf step)) (return))
         (setq digit (- (char-code (char board (setq idx (elt empties step)))) 48)))
      ((check board dc (floor idx siz) (rem idx siz))
         (setf (char board idx) dc)
         (setq digit 10)
         (if (>= (incf step) emplen)
           (return t))))
  ))


(defun cel (board r c)
  (char board (+ (* siz r) c)))

(defun check (board dc r c)
    (dotimes (i siz t)
      (if (or (eql dc (cel board r c))
              (eql dc (cel board i c))
              (eql dc (cel board (+ (* (floor r 3) 3) (rem i 3))
                                       (+   (* (floor c 3) 3)
                                          (floor i 3)))))
        (return))))

(defun pr-line ()
  (format t "~%+---+---+---+---+---+---+---+---+---+~%"))

(defun print-board (board)
  (dotimes (r siz)
    (pr-line)
    (format t "|")
    (dotimes (c siz)
      (format t " ~A |" (cel board r c))))
  (pr-line))

(defun make-board (&rest a)
  (let ((s (make-string 81))
        (i -1))
    (dolist (x a s)
       (dotimes (j siz)
         (setf (char s (incf i)) (char x j))))))


(defvar *board* (make-board
  "060104050"
  "008305600"
  "200000001"
  "800407006"
  "006000300"
  "700901004"
  "500000002"
  "007206900"
  "040508070"))

(time (if (guess *board*) (print-board *board*) (format t "Solution not found...")))



