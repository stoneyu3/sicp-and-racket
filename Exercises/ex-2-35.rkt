#lang planet neil/sicp

;; 2.2.2
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))



(define (accumulate op initial sequence)
 (if (null? sequence)
     initial
     (op (car sequence)
         (accumulate op initial (cdr sequence)))))

(define (count-leaves2 t)
  (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves2 x) 1)) t)))

;; test
(define x (cons (list 1 2) (list 3 4)))

(count-leaves x)
(count-leaves (list x x))
(count-leaves2 x)
(count-leaves2 (list x x))
