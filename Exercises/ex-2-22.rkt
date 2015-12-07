#lang racket

(define (square x) (* x x))
(define nil '())

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
              answer))))
(iter items nil))

;; test
(square-list (list 0 1 2 3))

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                (square (car things))))))
                (iter items nil))

;; test
(square-list-2 (list 0 1 2 3))

(define (square-list-modified items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (append answer (list (square (car things))))))
  )
  (iter items nil)
)
;; test
(square-list-modified (list 0 1 2 3))
