#lang racket

;; point data abstraction
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (midpoint p1 p2)
  (make-point (/ (+ (x-point p1) (x-point p2)) 2) (/ (+ (y-point p1) (y-point p2)) 2))
)

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
  (newline)
)

;; segment data abstraction
(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (midpoint-segment s)
  (midpoint (start-segment s) (end-segment s))
)

;; test
(print-point (midpoint-segment (make-segment (make-point 1 1) (make-point 5 5))))
