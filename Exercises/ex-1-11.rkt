#lang racket
; recursive process
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; iterative process
(define (f2 n)
  (fi 0 1 2 n))
(define (fi fn-3 fn-2 fn-1 counter)
  (cond ((= counter 0) fn-3)
        ((= counter 1) fn-2)
        ((= counter 2) fn-1)
        (else (fi 
               fn-2 
               fn-1 
               (+ fn-1 (* 2 fn-2) (* 3 fn-3)) (- counter 1)))))