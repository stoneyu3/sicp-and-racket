#lang racket
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define (+ n1 n2)
  (lambda (f) (lambda (x) ((n1 f) ((n2 f) x))))
)

;; test
(display (+ one two))
(display (+ two one))
