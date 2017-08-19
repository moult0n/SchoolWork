(write "Problem A")
(newline)

(+ (+ 3 5) (- 7))

(- (* 2 (+ 8 5 4)) 25)

(- 10 (+ (* 3 5) (+ 2 (* 5 0))))

(* 5 (+ 4 (/ (+ (+ 10 10) (* 5 8)) (+ 10 2))))

(+ (/ (- (/ (/ (* (+ 3 5) (+ 6 4)) 2) 2) 5) 3) (+ (/ (+ (* 2 10) (* 5 4)) 2) (* 4 5)))

(newline)
(newline)
(write "Problem B")
(newline)
(define zero 0)
(define two 2)
(define three 3)
(define four 4)
(define five 5)
(define six 6)
(define seven 7)
(define eight 8)
(define ten 10)
(define twentyfive 25)

(+ (+ three five) (- seven))

(- (* two (+ eight five four)) twentyfive)

(- ten (+ (* three five) (+ two (* five zero))))

(* five (+ four (/ (+ (+ ten ten) (* five eight)) (+ ten two))))

(+ (/ (- (/ (/ (* (+ three five) (+ six four)) two) two) five) three) (+ (/ (+ (* two ten) (* five four)) two) (* four five)))

(newline)
(newline)
(write "Problem C")
(newline)

(define Subtract
  (lambda (x y)
    (- x y)
))

(Subtract 120 50)

(newline)
(newline)
(write "Problem D")
(newline)

(define IntDivide
  (lambda (x y)
    (if (< (abs x) y)
        x
        (IntDivide (Subtract x y) y)
)))

(IntDivide 7 3)
(IntDivide 8 3)
(IntDivide 9 3)

(newline)
(newline)
(write "Problem E")
(newline)

(define ReadForIntDivide
  (lambda ()
      (let ((x (read)))
        (let ((y (read)))
          (IntDivide x y)
))))

(ReadForIntDivide)

(newline)
(newline)
(write "Problem F")
(newline)

(define Multiply
  (lambda (x y)
    (if (= y 1)
        x
        (+ x (Multiply x (- y 1)))
)))

(Multiply 8 3)

(newline)
(newline)
(write "Problem G")
(newline)

(define DiffDivide
  (lambda (x y)
    (Subtract x (Multiply (IntDivide x y) y))
))

(DiffDivide 8 3)

(newline)
(newline)
(write "Problem H")
(newline)

(define DiffDivideLet
  (lambda (x y)
  (let* ((id (IntDivide x y))
         (m (Multiply id y))
        (s (Subtract x m)))
    s
)))

(DiffDivideLet 8 3)