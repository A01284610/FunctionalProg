#lang racket

( define (cuentaElem lista)
    ( if (null? lista) 0
        (+ 1 (cuentaElem (cdr lista)))
    )
)

(cuentaElem '(1 2 3 4 5 6))

( define (cuentaPares lista)
    ( if (null? lista) 0
        (+ (modulo (+ 1 (car lista)) 2) (cuentaPares (cdr lista)))
    )
)

(cuentaPares '(1 2 3 5 6))


(define (sumaL a b)
    (
        if (null? a) '()
            (append (list (+ (car b) (car a)) ) (sumaL (cdr a) (cdr b)))
    )
)
(sumaL '(1 2 3 4 5 6) '(2 3 5 6 8 10))