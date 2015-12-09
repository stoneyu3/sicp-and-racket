#lang planet neil/sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

          
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))
;; test map
(map (lambda (x) (* x x)) (list 1 2 3 4 5))

;; ---
(define (append seq1 seq2) (accumulate cons (accumulate cons nil seq2) seq1))
;; test
(append (list 0 0) (list 1 2 3 4 5))

;; ---
(define (length sequence) (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
;; test
(length (list 1 2 3 4 5))
