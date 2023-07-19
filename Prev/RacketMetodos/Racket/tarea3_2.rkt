#lang racket ;Alejandro Lizárraga Vizcarra A01284610

( define (listPlus1 lst)
    (
        if (null? lst) '()
        (append (list (+ 1 (car lst))) (listPlus1 (cdr lst)))
    )
)


(listPlus1 (list 1  12  30  4  7))
(listPlus1 (list 0  -1 -3))
(listPlus1 (list 6))

