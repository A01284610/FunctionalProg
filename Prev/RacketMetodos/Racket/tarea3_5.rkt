#lang racket ;Alejandro Lizárraga Vizcarra A01284610

;;; 1) Averiguar si la lista contiene un elemento
(define (isIn lista n)
    ( cond [(null? lista) false]
        [(= (car lista) n) true]
        [else (isIn (cdr lista) n)]
    )
)
(display "\n buscador en lista\n")
(isIn '(1 2 3 4 5 6) 3)
(isIn '(1 2 3 4 5 6) 9)

;;; 2) Contar el numero de ocurrencias de un elemento en la lista
(define (ocurrencias lista n)
    ( cond [(null? lista) 0]
        [(= (car lista) n) (+ 1 (ocurrencias (cdr lista) n))]
        [else (ocurrencias (cdr lista) n)]
    )
)
(display "\n ocurrencias en lista\n")
(ocurrencias '(1 2 3 4 3 6) 3)
(ocurrencias '(1 7 77 4 7 7) 7)
(ocurrencias '(1 2 3 4 5 6) 9)

;;; 3) Arreglar getMayor para funcionar con negativos (opcinal) 
(define (getMayor lista)
  ( cond [ (null? (cdr lista)) (car lista) ]
         [ (> (car lista) (getMayor (cdr lista)) ) (car lista)]
         [ else (getMayor (cdr lista) )]
  )
)
(display "\n mayor de lista\n")
(getMayor '(1 2 3 4 5 6))
(getMayor '(-100 -2 -30 -1 -61) ) 

;;; 4) Promdeio de lista
(define (sumatoria lista)
    ( if (null? lista)
        0
        (+ (car lista) (sumatoria (cdr lista)))
    )
)

(define (promedio lista)
    ( if (null? lista)
        0
        (/ (sumatoria lista) (length lista))
    )
)
(display "\n promedio de lista\n")
(promedio '(2 2))
(promedio '(2 3 10))
(promedio '(1))

;;; 5) Desviasion standar de la lista

( define (stdvPt1 lista n)
    (
        if (null? lista) '()
        (append (list (expt (- (car lista) n) 2)) (stdvPt1 (cdr lista) n))
    )
)

( define (desviacion lista)
    (
        sqrt (/ (sumatoria (stdvPt1 lista (promedio lista))) (- (length lista) 1))
    )
)
(display "\n stdv de lista\n")
(desviacion '(1 2 4 99 3))
(desviacion '(1 2 3 4 5))
(desviacion '(1 1 1 1))

;;; 6) Lista con los n primeros valores Fibonacci 
(define (lastN lista)
    (   cond [(null? (cdr lista)) (car lista)]
        [else (lastN (cdr lista))]
    )
)

(define (fib n)

    (if (> n 2)
        (append (fib (- n 1)) (list (+ (lastN (fib (- n 1))) (lastN ( fib (- n 2))))))
        (list 1 1)
    )
)
(display "\n lista de fibonacci\n")
(fib 6)
(fib 2)
(fib 9)


;;; 7) Lista con números pares en un rango
(define (pares a b)
    (cond
        [(> a b) '()]
        [(= (modulo a 2) 0) (append (list a) (pares (+ 2 a) b))]
        [else (pares (+ 1 a) b)]
    )
)

(display "\n lista de pares\n")
(pares 1 2)
(pares 3 3)
(pares -5 11)

;;; 8) Invertir el orden de una lista
(define (invertir lista)
    (if (null? lista)
        '()
        (append (invertir (cdr lista)) (list (car lista)))
    )
)
(display "\n invertir lista\n")
(invertir '(1 2 4 99 3))
(invertir '(1 2 3))
(invertir '(7))

;;; 9) Insertar un valor ordenado
(define (insertOrdenado lista valor)
    (cond [(null? lista) (list valor)]
        [(<= valor (car lista)) (cons valor lista)]
        [else (cons (car lista) (insertOrdenado (cdr lista) valor))]
    )
)
(display "\n insertar ordenado\n")
(insertOrdenado '(1 2 4 5) 3)
(insertOrdenado '(-99 -50 0 2 4) -51)
(insertOrdenado '(-99 -50 0 2 4) 3)

;;; 10) Ordenar
(define (minimo lista)
    (cond [(null? lista) -2147483648]
        [(null? (cdr lista)) (car lista)]
        [else
            (if (< (car lista) (minimo (cdr lista)))
                (car lista)
                (minimo (cdr lista))
            )
        ]

    )
)

(define (quitar lista n)
    (cond [(null? lista) '()]
        [(= (car lista) n) (cdr lista)]
        [else (cons (car lista) (quitar (cdr lista) n))]
    )
)

(define (ordenar2 lista lista2)
    (cond [(null? lista) lista2]
        [else (ordenar2 (quitar lista (minimo lista)) (append lista2 (list (minimo lista))))]
    )
)

(define (ordenar lista)
    (ordenar2 lista '())
)
(display "\n ordenar lista\n")
(ordenar '(3 1 4 1 5 9 2 6 5))
(ordenar '(1 2 3 4 5 6))
(ordenar '(-1 0 23 -38 4))


;;; 11) Sumar dos listas, de longitud variable
(define (sumarListas lista lista2)
    (cond [(null? lista) lista2]
            [(null? lista2) lista]
            [else (cons (+ (car lista) (car lista2)) (sumarListas (cdr lista) (cdr lista2)))]
    )
)
(display "\n sumar listas\n")
(sumarListas '() '())
(sumarListas '() '(4))
(sumarListas '(1 2) '())
(sumarListas '(2 3) '(10))
(sumarListas '(3) '(5 7 9))
(sumarListas '(2 2 3) '(5 6 0))

