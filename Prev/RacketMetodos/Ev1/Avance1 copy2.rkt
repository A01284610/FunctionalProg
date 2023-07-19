#lang racket

(define archivo "input.txt")

(define in (open-input-file archivo))
(define codigo (string-split (string-join (sequence->list (in-lines in)) " <br>") " "))
(close-input-port in)

; Crea un archivo .css
(define sty (open-output-file "style.css"))
(display "body {background-color: rgb(14, 11, 35);}" sty)
(newline sty)
(display ".int {color: purple;}" sty)
(newline sty)
(display ".float {color: red;}" sty)
(newline sty)
(display ".keyword {color: yellow;}" sty)
(newline sty)
(display ".comment {color: green;}" sty)
(newline sty)
(display ".comment {color: green;}" sty)
(newline sty)
(display ".otro {color: white;}" sty)
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
(define (esInt? elemento)
  (regexp-match? #px"^-?\\d+$" elemento))

(define (esFloat? elemento)
  (regexp-match? #px"^-?\\d+\\.\\d+$" elemento))

(define (esCommentario? elemento)
  (regexp-match? #px"//.*"  elemento))

(define (esKeyword? elemento)
  (regexp-match? #px"(int|float|string|char)" elemento))

; Verificación de sintaxis y escritura en archivo .html
(define (escribir elemento escritura)
  (cond
    [(esCommentario? elemento)
     (begin
       (display "<text class='comment'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura))]
    [(esInt? elemento)
     (begin
       (display "<text class='int'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura))]
    [(esFloat? elemento)
     (begin
       (display "<text class='float'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura))]
    [(esKeyword? elemento)
     (begin
       (display "<text class='keyword'>" escritura)
       (display elemento escritura)
       (display "</text>" escritura)
       (newline escritura))]
    [else
     (display "<text class='otro'>" escritura)
     (display elemento escritura)
     (display "</text>" escritura)
     (newline escritura)]))

; Escritura de lista
(define (escribir-lista lista)
  (define escritura (open-output-file "output.html" #:exists 'append))
  (let loop ((lst lista))
    (cond
      [(null? lst) (close-output-port escritura)]
      [(string=? (car lst) "<br>")
       (begin
         (display "<br>" escritura)
         (newline escritura)
         (loop (cdr lst)))]
      [else
       (begin
         (escribir (car lst) escritura)
         (loop (cdr lst)))])))

(escribir-lista codigo)

; Escritura final del archivo .html
(define escritura-final (open-output-file "output.html" #:exists 'append))
(display "</body>" escritura-final)
(display "<br>") ; Use <br> tag to break lines in HTML
(display "</html>" escritura-final)
(close-output-port escritura-final)
