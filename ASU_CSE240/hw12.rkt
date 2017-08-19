(write "Problem 1")
(define AND
  (lambda (a b)
    (if (= a b 1)
        1
        0
)))
(write "AND Gate")
(newline)
(AND 1 1)
(AND 0 1)
(AND 0 0)
(AND 1 0)

(define OR
  (lambda (a b)
    (if (= a 0)
        (if (= b 0)
            0
            1)
        1
)))
(write "OR Gate")
(newline)
(OR 0 0)
(OR 0 1)
(OR 1 0)
(OR 1 1)

(define XOR
  (lambda (a b)
    (if (= a b)
        0
        1
)))
(write "XOR Gate")
(newline)
(XOR 0 0)
(XOR 1 0)
(XOR 0 1)
(XOR 1 1)

(write "Problem 2")
(newline)
(define sum-bit
  (lambda (x a b)
    (XOR (XOR a b) x)
))
(define carry-out
  (lambda (x a b)
    (OR (AND x (OR a b)) (AND a b))
))
(define bitAdder
  (lambda (x a b)
    (let* ((s (sum-bit x a b))
           (c (carry-out x a b)))
      (cons s c)
)))

(bitAdder 0 0 0)
(bitAdder 0 0 1)
(bitAdder 0 1 0)
(bitAdder 0 1 1)
(bitAdder 1 0 0)
(bitAdder 1 0 1)
(bitAdder 1 1 0)
(bitAdder 1 1 1)

;(0 . 0)
;(1 . 0)
;(1 . 0)
;(0 . 1)
;(1 . 0)
;(0 . 1)
;(0 . 1)
;(1 . 1)

(write "Problem 3")
(newline)
(define tail
  (lambda (lst)
  (cond ((null? (cdr lst)) (car lst))
        (else (tail (cdr lst))))))
(define rmtail
  (lambda (lst)
    (reverse (cdr (reverse lst)))))
(define test '(1 2 3 4 5 6 7 8 9))
(tail test)
(rmtail test)
