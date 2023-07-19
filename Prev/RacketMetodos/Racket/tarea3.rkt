#lang racket ;Alejandro Lizárraga Vizcarra A01284610

(define I '( 1 2 (3 4) (5 (6 7)) ) )
(car I)
(car (cdr I))
(car (car (cdr (cdr I))))
(car (cdr (car (cdr (cdr I)))))
(car (car (cdr (cdr (cdr I)))))
(car (car (cdr (car (cdr (cdr (cdr I)))))))
(car (cdr (car (cdr (car (cdr (cdr (cdr I))))))))

(define J '(a (b c d) e (f g) ))
(car J)
(car (car (cdr J)))
(car (cdr (car (cdr J))))
(car (cdr (cdr (car (cdr J)))))
(car (cdr (cdr J)))
(car (car (cdr (cdr (cdr J)))))
(car (cdr (car (cdr (cdr (cdr J))))))

(define (sumatoriaList lst)
    (cond 
        [(null? lst) 0]
        [else (+ (car lst) (sumatoriaList (cdr lst)))]
    )
)
(sumatoriaList (list 1 2 3 5 89 ))

;;car
;; Viene de "Contents of the Address part of Register number" o "contents of address register"
;;cdr
;; Viene de "Contents of the Decrement part of Register number" o "contents of decrement register"

;;Tienen relacion con la aplicación de hardware que había en los registros de la maquina
;;IBM 704 pero hay conflicto con esta explicacion debido a que no habia un registro 
;;accesible por el programador al registro y aparte los registros de modificacion se 
;;lamaban "index registers"
;;se cree que viene de codigo viejo de assebly pero nadie esta seguros