#lang racket
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

;; ex-2-7
(define (make-interval a b) (cons a b))
(define lower-bound car)
(define upper-bound cdr)

;; ex-2-8
(define (sub-interval a b)
  (make-interval
    (- (lower-bound a) (upper-bound b))
    (- (upper-bound a) (lower-bound b))))

;; ex-2-9
(define (width x) (/ (+ (lower-bound x) (upper-bound x)) 2))

;; test-2-9
(display (width (make-interval 2 9)))
(newline)
(display (width (make-interval 3 6)))
(newline)
(display (width
  (add-interval (make-interval 2 9)
                (make-interval 3 6))))

(newline)

;; ex-2-10
(define (span x) (- (upper-bound x) (lower-bound x)))
(define (div-interval-modified x y)
  (if (= 0 (span y))
      (error "Interval spans zero should not be divied")
      (div-interval x y)))

;; test-2-10
(display (div-interval-modified
  (make-interval 1 3)
  (make-interval 2 2)))
(newline)
