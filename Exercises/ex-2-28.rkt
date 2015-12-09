#lang planet neil/sicp

(define (fringe x)
  (if (null? x)
    nil
    (append (if (pair? (car x))
              (fringe (car x))
              (list (car x)))
            (fringe (cdr x)))))
;; test
(define x (list (list 1 2) (list 3 4)))
(fringe x)
(define y (list 1 (list 2 3) 4 (list 5 6)))
(fringe y)
