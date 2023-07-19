;; clj -M test2.clj
;; corrrer en terminal


;;; 2) Contar el numero de ocurrencias de un elemento en la lista
(def f1 (future (println "Hello Marty!") (+ 10 20)))

f1

(deref f1)
@f1

(def f2 (future (println "Hello Marty!") (Thread/sleep 7000) (+ 10 20)))

;; aa

(def unDelay (delay (println "Hello Marty!") (+ 10 20)))

unDelay

@unDelay

unDelay

;; bb

(def unDelay2 (delay (println "Hello Marty!") (Thread/sleep 15000) (+ 10 20)))
unDelay2
@unDelay2
unDelay2

;; promise

(def pizza (promise))

(println pizza)

(deliver pizza "pizza pizza!")

@pizza

;; a

(def pinky (promise))

(realized? pinky)

(deliver pinky "listo")

(realized? pinky)