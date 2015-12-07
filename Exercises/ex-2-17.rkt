#lang racket

(define (last-pair l)
  (if (null? (cdr l))
    l
    (last-pair (cdr l))))

;; test
(display (last-pair '(1 2 3 4 5 6)))
(newline)
