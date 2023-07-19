#lang racket

; Lee un archivo de texto y lo guarda en una lista
(define archivo "input.txt")

(define in (open-input-file archivo))
(define codigo (string-split (string-join (sequence->list (in-lines in)) " <br> ") " "))
(cdr codigo)

(close-input-port in)

; Crea un archivo .css
(define sty (open-output-file "style.css"))
(display "body {background-color: rgb(14, 11, 35);}" sty)
(newline sty)
(display ".num {color: rgb(255, 176, 116);}" sty)
(newline sty)
(display ".operador {color: rgb(255, 255, 116);}" sty)
(newline sty)
(display ".string {color: rgb(154, 255, 113);}" sty)
(newline sty)
(display ".keyword {color: rgb(205, 111, 255);}" sty)
(newline sty)
(display ".comment {color: rgb(123, 123, 123);}" sty)
(newline sty)
(display ".loop {color: pink;}" sty)
(newline sty)
(display ".otro {color: white;}" sty)
(newline sty)
(display ".extra {color: rgb(100, 252, 255);}" sty)
(newline sty)
(display ".extra2 {color: rgb(86, 100, 255);}" sty)
(newline sty)
(display ".funcion {color: rgb(103, 116, 255);}" sty)
(close-output-port sty)

; Crea un archivo .html 
(define out (open-output-file "output.html"))
(display "<!DOCTYPE html>" out)
(newline out)
(newline out)
(display "<html>" out)
(newline out)
(newline out)
(display "<head>" out)
(newline out)
(display "<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\" />" out)
(newline out)
(display "<title>Resaltador de sintaxis</title>" out)
(newline out)
(display "</head>" out)
(newline out)
(newline out)
(display "<body>" out)
(newline out)
(close-output-port out)

; Verifica el contenido de acuerdo a la sintaxis de un lenguaje 
; Expresiones regulares (regex)

(define (esBR? elemento)
  (regexp-match? #px"<br>" elemento))


(define (esInt? elemento)
  (regexp-match? #px"^-?\\d+$" elemento))

(define (esSuma? elemento)
  (regexp-match? #px"\\+" elemento))

(define (esFloat? elemento)
  (regexp-match? #px"^-?\\d+\\.\\d+$" elemento))

(define (esNumero? elemento)
  (or (esInt? elemento) (esFloat? elemento)))

(define (esString? elemento)
  (regexp-match? #px"\"[^\"]*\"" elemento))

(define (esCommentario? elemento)
  (regexp-match? #px"//.*" elemento))

(define (esKeyword? elemento)
  (regexp-match? #px"(int|float|string|char)" elemento))

(define (esLoop? elemento)
  (regexp-match? #px"(for|while)" elemento))

(define (esExtra? elemento)
  (regexp-match? #px"(;|,|=|\\(|\\)|\\+\\+|#)" elemento))

(define (esExtra2? elemento)
  (regexp-match? #px"(<<|endl|\\{|\\})" elemento))

(define (esFuncion? elemento)
  (regexp-match? #px"\\b[A-Za-z_][A-Za-z0-9_]*\\s*\\([^)]*\\)" elemento))

; Verificación de sintaxis y escritura en archivo .html
(define (escribir elemento escritura)
  (cond
    [(esBR? elemento)
     (begin
       (display "<br>" escritura)
       (newline escritura))]
    [(esCommentario? elemento)
     (begin
       (display "<text class='comment'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura))]
    [(esNumero? elemento)
     (begin
       (display "<text class='num'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura))]
    [(esSuma? elemento)
     (begin
       (display "<text class='operador'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura))]
    [(esString? elemento)
      (begin
        (display "<text class='string'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [(esKeyword? elemento)
     (begin
       (display "<text class='keyword'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura))]
    [(esLoop? elemento)
      (begin
        (display "<text class='loop'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [(esExtra? elemento)
      (begin
        (display "<text class='extra'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [(esExtra2? elemento)
      (begin
        (display "<text class='extra2'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [(esFuncion? elemento)
      (begin
        (display "<text class='funcion'>" escritura)
        (display elemento escritura)
        (display "</text>" escritura)
        (newline escritura))]
    [else
     (display "<text class='otro'>" escritura)
     (display elemento escritura)
     (display "</text>" escritura)
     (newline escritura)])
)

(define (escribir-lista lista)
  (define escritura (open-output-file "output.html" #:exists 'append))
  (let loop ((lst lista))
    (cond
      [(null? lst) (close-output-port escritura)]
      [else
       (begin
          ( if (not (null? (cdr lst)))
            (begin
            (display "\n inicio \n")
            (display (cadr lst) )
            (display "\n fin  \n\n\n")
            )
            (display "\n end \n")
          )

         (escribir (car lst) escritura)
         (loop (cdr lst))
)])))
(escribir-lista codigo)

; Escritura final del archivo .html
(define escritura-final (open-output-file "output.html" #:exists 'append))
(display "</body>" escritura-final)
(newline escritura-final)
(newline escritura-final)
(display "</html>" escritura-final)
(close-output-port escritura-final)