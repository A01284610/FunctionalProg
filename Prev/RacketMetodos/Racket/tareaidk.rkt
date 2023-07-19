#lang racket

( define grupo '(("A01" "Ana" (10 10 8))
                ("A02" "Carlos" (10 8 9))
                ("A03" "Luisa" (9 10 10))
                ("A04" "Juan" (8 8 8))
                ("A05" "Juan" (9 7 8)))
)

;;; Extrae solo los nombres
(define (nombres lista)
    (map (lambda (x) 
            (cadr x)
         ) 
        lista
    )
)

(nombres grupo)

;;; Determina si un alumno es parte del grupo según su matricula 
(define (buscarMat lista matricula)
    (not (null? (filter (lambda (x)
                            (equal? (car x) matricula)
                        )
                        lista
                )
        )
    )
)

(buscarMat grupo "A01")
(buscarMat grupo "A06")

;;; Calcula los promedios
(define (promedios lista)
    (map (lambda (x)
            (/ (apply + (caddr x)) (* 1.0 (length (caddr x))))
         )
         lista
    )
)
(promedios grupo)

;;; Regresa el registro de la matricula 
(define (registroMat lista matricula)
    (car (map (lambda (x)
                (list (car x) (cadr x) (/ (apply + (caddr x)) (* 1.0(length (caddr x)))))) 
            (filter (lambda (x) (equal? matricula (car x))) lista)
         )
    )
)

(registroMat grupo "A01")
