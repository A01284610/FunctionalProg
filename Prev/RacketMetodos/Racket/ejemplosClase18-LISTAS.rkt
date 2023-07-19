#lang racket

;BLOQUE A: de lista a atomo
;Contar los elementos de una lista

(define (cuentaElem lista)
  ( if (null? lista) 0
       (+ 1 (cuentaElem (cdr lista) ) )
  )
)
(display "\n cuenta elementos de lista\n")
(cuentaElem '(1 2 3 5 6))
(cuentaElem '()  ) ; lista vacia

;Contar los pares de una lista
(define (cuentaPares lista)
  ( cond [(null? lista) 0]
         [(even? (car lista) )   (+ 1 (cuentaPares (cdr lista) ) )]
         [else ( cuentaPares (cdr lista) )  ]
  )
)
(display "\n cuenta pares de lista\n")
(cuentaPares '(1 2 3 4 5 6))
(cuentaPares '()  ) ; lista vacia

;Obtener el mayor de una lista
(define (getMayor lista)
  ( cond [ (null? lista) 0 ]
         [ (> (car lista) (getMayor (cdr lista)) ) (car lista)]
         [ else (getMayor (cdr lista) )]
  )
)
(display "\n mayor de lista\n")
(getMayor '(1 2 3 4 5 6))
(getMayor '(-1 -61 )  ) 

;Averiguar si la lista contiene un elemento
;Contar el numero de ocurrencias de un elemento en la lista
;Arreglar getMayor para funcionar con negativos (opcinal) 
;Promdeio de lista




; BLOQUE B: atomo a lista
;Crear una lista con n veces 0
(define (nzeros n)
  ( if (= n 0 ) '() ; si n es 0, regreso lista vacia
       ( cons 0 ( nzeros (- n 1) ) )
  )
)
(display "\n n ceros lista\n")
(nzeros 3 )
(nzeros 5 ) 

;Lista con valores de n a 1
(define (listan2one n)
  (if (= n 0 ) '()
      ( cons n ( listan2one (- n 1) ) ) 
  )
)
(display "\n n a 1 lista\n")
(listan2one 3 )
(listan2one 5 )

;Lista con valores de 1 a n
(define (listaone2n n)
  (if (= n 0 ) '()
      ;( cons  ( listaone2n (- n 1)) n  )
      ( append  ( listaone2n (- n 1)) (list n ) ) 
  )
)
(display "\n 1 a n lista\n")
(listaone2n 3 )
(listaone2n 5 )

; TAREA 
;Lista con los n primeros valores Fibonacci 
;Lista con números pares en un rango


;BLOQUE C
;Sumar dos listas (misma longitud)
(define (sumaL a b)
  ( if (null? a) '()
       ;( append (list (+ (car a) (car b))) (sumaL (cdr a) (cdr b)))
       ( cons (+ (car a) (car b)) (sumaL (cdr a) (cdr b)))

  )
)
(display "\n suma listas\n")
( sumaL '(1 2 3 4) '(1 2 3 4) )
( sumaL '(1 2 3 104) '(1 2 23 4) )

;Concatenar dos listas: tu propio append
( define (myAppend a b)
  ( cond [ (and (null? a) (null? b))  '() ]
        [ (null? a) (cons (car b) (myAppend a (cdr b) ) ) ]
        [else (cons (car a) (myAppend (cdr a) b ) ) ]
  )
)
(display "\n append listas\n")
( myAppend '(1 2 3) '(5 6 8) )

; Tarea 
;Invertir el orden de una lista
;Insertar un valor ordenado
;Ordenar
;Sumar dos listas, de longitud variable




