#lang racket

( define (fibhelp n a b)
    ( if (> n 1)
    (fibhelp (- n 1) b (+ a b))
    a
    )
)

( define (fib n)
    (fibhelp n 0 1)
)

(fib 5)


(define f (list apply filter map))


(define a '(1 2 3))

(apply + a)

((car f) + a)