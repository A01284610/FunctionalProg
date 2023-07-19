#lang racket

(define grupo '(("A01" "Ana" (10 10 8))
                ("A02" "Carlos" (10 8 9))
                ("A03" "Luisa" (9 10 10))
                ("A04" "Juan" (8 8 8))
                ("A05" "Juan" (9 7 8))
               )
)

; Extrea solo los nombres
(define (nombres grupo)
  (map cadr grupo)
)
(display "\nNombres:\n")
(nombres grupo)

; Determina si un alumno es parte del grupo segun su matricula
(define (alumno-grupo? matricula grupo)
  (not (null? (filter (lambda (x) (equal? (car x) matricula) ) grupo) ) )
)
(display "\nAlumno pertenece a grupo segun su matricula:\n")
(alumno-grupo? "A01" grupo)

; Calcula los promedios
(define (promedios grupo)
  (map (lambda (x) (list (car x) (cadr x) (/ (apply + (caddr x)) (length (caddr x) ) ) ) ) grupo) 
)
(display "\nPromedios:\n")
(promedios grupo)

; Regresa el registro de la matricula
(define (registro matricula grupo)
  (car (filter (lambda (x) (equal? (car x) matricula) ) grupo) )
)
(display "\nRegistro de la matricula:\n")
(registro "A03" grupo)