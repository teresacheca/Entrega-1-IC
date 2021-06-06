;;;;;;; JUGADOR DE 4 en RAYA ;;;;;;;
;;;;TERESA DEL CARMEN CHECA MARABOTTO ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;;;;;;;;;; Version de 4 en raya clÃ¡sico: Tablero de 6x7, donde se introducen fichas por arriba
;;;;;;;;;;;;;;;;;;;;;;; y caen hasta la posicion libre mas abajo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;; Hechos para representar un estado del juego

;;;;;;; (Turno M|J)   representa a quien corresponde el turno (M maquina, J jugador)
;;;;;;; (Tablero Juego ?i ?j _|M|J) representa que la posicion i,j del tablero esta vacia (_), o tiene una ficha propia (M) o tiene una ficha del jugador humano (J)

;;;;;;;;;;;;;;;; Hechos para representar estado del analisis
;;;;;;; (Tablero Analisis Posicion ?i ?j _|M|J) representa que en el analisis actual la posicion i,j del tablero esta vacia (_), o tiene una ficha propia (M) o tiene una ficha del jugador humano (J)
;;;;;;; (Sondeando ?n ?i ?c M|J)  ; representa que estamos analizando suponiendo que la ?n jugada h sido ?i ?c M|J
;;;

;;;;;;;;;;;;; Hechos para representar una jugadas

;;;;;;; (Juega M|J ?columna) representa que la jugada consiste en introducir la ficha en la columna ?columna 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; INICIALIZAR ESTADO


(deffacts Estado_inicial
(Tablero Juego 1 1 _) (Tablero Juego 1 2 _) (Tablero Juego 1 3 _) (Tablero Juego  1 4 _) (Tablero Juego  1 5 _) (Tablero Juego  1 6 _) (Tablero Juego  1 7 _)
(Tablero Juego 2 1 _) (Tablero Juego 2 2 _) (Tablero Juego 2 3 _) (Tablero Juego 2 4 _) (Tablero Juego 2 5 _) (Tablero Juego 2 6 _) (Tablero Juego 2 7 _)
(Tablero Juego 3 1 _) (Tablero Juego 3 2 _) (Tablero Juego 3 3 _) (Tablero Juego 3 4 _) (Tablero Juego 3 5 _) (Tablero Juego 3 6 _) (Tablero Juego 3 7 _)
(Tablero Juego 4 1 _) (Tablero Juego 4 2 _) (Tablero Juego 4 3 _) (Tablero Juego 4 4 _) (Tablero Juego 4 5 _) (Tablero Juego 4 6 _) (Tablero Juego 4 7 _)
(Tablero Juego 5 1 _) (Tablero Juego 5 2 _) (Tablero Juego 5 3 _) (Tablero Juego 5 4 _) (Tablero Juego 5 5 _) (Tablero Juego 5 6 _) (Tablero Juego 5 7 _)
(Tablero Juego 6 1 _) (Tablero Juego 6 2 _) (Tablero Juego 6 3 _) (Tablero Juego 6 4 _) (Tablero Juego 6 5 _) (Tablero Juego 6 6 _) (Tablero Juego 6 7 _)
(Jugada 0)
)

(defrule Elige_quien_comienza
=>
(printout t "Quien quieres que empieze: (escribre M para la maquina o J para empezar tu) ")
(assert (Turno (read)))
)

;;;;;;;;;;;;;;;;;;;;;;; MUESTRA POSICION ;;;;;;;;;;;;;;;;;;;;;;;
(defrule muestra_posicion
(declare (salience 10))
(muestra_posicion)
(Tablero Juego 1 1 ?p11) (Tablero Juego 1 2 ?p12) (Tablero Juego 1 3 ?p13) (Tablero Juego 1 4 ?p14) (Tablero Juego 1 5 ?p15) (Tablero Juego 1 6 ?p16) (Tablero Juego 1 7 ?p17)
(Tablero Juego 2 1 ?p21) (Tablero Juego 2 2 ?p22) (Tablero Juego 2 3 ?p23) (Tablero Juego 2 4 ?p24) (Tablero Juego 2 5 ?p25) (Tablero Juego 2 6 ?p26) (Tablero Juego 2 7 ?p27)
(Tablero Juego 3 1 ?p31) (Tablero Juego 3 2 ?p32) (Tablero Juego 3 3 ?p33) (Tablero Juego 3 4 ?p34) (Tablero Juego 3 5 ?p35) (Tablero Juego 3 6 ?p36) (Tablero Juego 3 7 ?p37)
(Tablero Juego 4 1 ?p41) (Tablero Juego 4 2 ?p42) (Tablero Juego 4 3 ?p43) (Tablero Juego 4 4 ?p44) (Tablero Juego 4 5 ?p45) (Tablero Juego 4 6 ?p46) (Tablero Juego 4 7 ?p47)
(Tablero Juego 5 1 ?p51) (Tablero Juego 5 2 ?p52) (Tablero Juego 5 3 ?p53) (Tablero Juego 5 4 ?p54) (Tablero Juego 5 5 ?p55) (Tablero Juego 5 6 ?p56) (Tablero Juego 5 7 ?p57)
(Tablero Juego 6 1 ?p61) (Tablero Juego 6 2 ?p62) (Tablero Juego 6 3 ?p63) (Tablero Juego 6 4 ?p64) (Tablero Juego 6 5 ?p65) (Tablero Juego 6 6 ?p66) (Tablero Juego 6 7 ?p67)
=>
(printout t crlf)
(printout t ?p11 " " ?p12 " " ?p13 " " ?p14 " " ?p15 " " ?p16 " " ?p17 crlf)
(printout t ?p21 " " ?p22 " " ?p23 " " ?p24 " " ?p25 " " ?p26 " " ?p27 crlf)
(printout t ?p31 " " ?p32 " " ?p33 " " ?p34 " " ?p35 " " ?p36 " " ?p37 crlf)
(printout t ?p41 " " ?p42 " " ?p43 " " ?p44 " " ?p45 " " ?p46 " " ?p47 crlf)
(printout t ?p51 " " ?p52 " " ?p53 " " ?p54 " " ?p55 " " ?p56 " " ?p57 crlf)
(printout t ?p61 " " ?p62 " " ?p63 " " ?p64 " " ?p65 " " ?p66 " " ?p67 crlf)
(printout t  crlf)
)


;;;;;;;;;;;;;;;;;;;;;;; RECOGER JUGADA DEL CONTRARIO ;;;;;;;;;;;;;;;;;;;;;;;
(defrule mostrar_posicion
(declare (salience 9999))
(Turno J)
=>
(assert (muestra_posicion))
)

(defrule jugada_contrario
?f <- (Turno J)
=>
(printout t "en que columna introduces la siguiente ficha? ")
(assert (Juega J (read)))
(retract ?f)
)

(defrule juega_contrario_check_entrada_correcta
(declare (salience 1))
?f <- (Juega J ?c)
(test (and (neq ?c 1) (and (neq ?c 2) (and (neq ?c 3) (and (neq ?c 4) (and (neq ?c 5) (and (neq ?c 6) (neq ?c 7))))))))
=>
(printout t "Tienes que indicar un numero de columna: 1,2,3,4,5,6 o 7" crlf)
(retract ?f)
(assert (Turno J))
)

(defrule juega_contrario_check_columna_libre
(declare (salience 1))
?f <- (Juega J ?c)
(Tablero Juego 1 ?c ?X) 
(test (neq ?X _))
=>
(printout t "Esa columna ya esta completa, tienes que jugar en otra" crlf)
(retract ?f)
(assert (Turno J))
)

(defrule juega_contrario_actualiza_estado
?f <- (Juega J ?c)
?g <- (Tablero Juego ?i ?c _)
(Tablero Juego ?j ?c ?X) 
(test (= (+ ?i 1) ?j))
(test (neq ?X _))
=>
(retract ?f ?g)
(assert (Turno M) (Tablero Juego ?i ?c J))
)

(defrule juega_contrario_actualiza_estado_columna_vacia
?f <- (Juega J ?c)
?g <- (Tablero Juego 6 ?c _)
=>
(retract ?f ?g)
(assert (Turno M) (Tablero Juego 6 ?c J))
)


;;;;;;;;;;; ACTUALIZAR  ESTADO TRAS JUGADA DE CLISP ;;;;;;;;;;;;;;;;;;

(defrule juega_clisp_actualiza_estado
?f <- (Juega M ?c)
?g <- (Tablero Juego ?i ?c _)
(Tablero Juego ?j ?c ?X) 
(test (= (+ ?i 1) ?j))
(test (neq ?X _))
=>
(retract ?f ?g)
(assert (Turno J) (Tablero Juego ?i ?c M))
)

(defrule juega_clisp_actualiza_estado_columna_vacia
?f <- (Juega M ?c)
?g <- (Tablero Juego 6 ?c _)
=>
(retract ?f ?g)
(assert (Turno J) (Tablero Juego 6 ?c M))
)

;;;;;;;;;;; CLISP JUEGA SIN CRITERIO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule elegir_jugada_aleatoria
(declare (salience -9998))
?f <- (Turno M)
=>
(assert (Jugar (random 1 7)))
(retract ?f)
)

(defrule comprobar_posible_jugada_aleatoria
?f <- (Jugar ?c)
(Tablero Juego 1 ?c M|J)
=>
(retract ?f)
(assert (Turno M))
)

(defrule clisp_juega_sin_criterio
(declare (salience -9999))
?f<- (Jugar ?c)
=>
(printout t "JUEGO en la columna " ?c crlf)
(retract ?f)
(assert (Juega M ?c))
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;  Comprobar si hay 4 en linea ;;;;;;;;;;;;;;;;;;;;;

(defrule cuatro_en_linea_horizontal
(declare (salience 9999))
(Tablero ?t ?i ?c1 ?jugador)
(Tablero ?t ?i ?c2 ?jugador) 
(test (= (+ ?c1 1) ?c2))
(Tablero ?t ?i ?c3 ?jugador)
(test (= (+ ?c1 2) ?c3))
(Tablero ?t ?i ?c4 ?jugador)
(test (= (+ ?c1 3) ?c4))
(test (or (eq ?jugador M) (eq ?jugador J) ))
=>
(assert (Cuatro_en_linea ?t ?jugador horizontal ?i ?c1))
)

(defrule cuatro_en_linea_vertical
(declare (salience 9999))
?f <- (Turno ?X)
(Tablero ?t ?i1 ?c ?jugador)
(Tablero ?t ?i2 ?c ?jugador)
(test (= (+ ?i1 1) ?i2))
(Tablero ?t ?i3 ?c  ?jugador)
(test (= (+ ?i1 2) ?i3))
(Tablero ?t ?i4 ?c  ?jugador)
(test (= (+ ?i1 3) ?i4))
(test (or (eq ?jugador M) (eq ?jugador J) ))
=>
(assert (Cuatro_en_linea ?t ?jugador vertical ?i1 ?c))
)

(defrule cuatro_en_linea_diagonal_directa
(declare (salience 9999))
?f <- (Turno ?X)
(Tablero ?t ?i ?c ?jugador)
(Tablero ?t ?i1 ?c1 ?jugador)
(test (= (+ ?i 1) ?i1))
(test (= (+ ?c 1) ?c1))
(Tablero ?t ?i2 ?c2  ?jugador)
(test (= (+ ?i 2) ?i2))
(test (= (+ ?c 2) ?c2))
(Tablero ?t ?i3 ?c3  ?jugador)
(test (= (+ ?i 3) ?i3))
(test (= (+ ?c 3) ?c3))
(test (or (eq ?jugador M) (eq ?jugador J) ))
=>
(assert (Cuatro_en_linea ?t ?jugador diagonal_directa ?i ?c))
)

(defrule cuatro_en_linea_diagonal_inversa
(declare (salience 9999))
?f <- (Turno ?X)
(Tablero ?t ?i ?c ?jugador)
(Tablero ?t ?i1 ?c1 ?jugador)
(test (= (+ ?i 1) ?i1))
(test (= (- ?c 1) ?c1))
(Tablero ?t ?i2 ?c2  ?jugador)
(test (= (+ ?i 2) ?i2))
(test (= (- ?c 2) ?c2))
(Tablero ?t ?i3 ?c3  ?jugador)
(test (= (+ ?i 3) ?i3))
(test (= (- ?c 3) ?c3))
(test (or (eq ?jugador M) (eq ?jugador J) ))
=>
(assert (Cuatro_en_linea ?t ?jugador diagonal_inversa ?i ?c))
)

;;;;;;;;;;;;;;;;;;;; DESCUBRE GANADOR
(defrule gana_fila
(declare (salience 9999))
?f <- (Turno ?X)
(Cuatro_en_linea Juego ?jugador horizontal ?i ?c)
=>
(printout t ?jugador " ha ganado pues tiene cuatro en linea en la fila " ?i crlf)
(retract ?f)
(assert (muestra_posicion))
) 

(defrule gana_columna
(declare (salience 9999))
?f <- (Turno ?X)
(Cuatro_en_linea Juego ?jugador vertical ?i ?c)
=>
(printout t ?jugador " ha ganado pues tiene cuatro en linea en la columna " ?c crlf)
(retract ?f)
(assert (muestra_posicion))
) 

(defrule gana_diagonal_directa
(declare (salience 9999))
?f <- (Turno ?X)
(Cuatro_en_linea Juego ?jugador diagonal_directa ?i ?c)
=>
(printout t ?jugador " ha ganado pues tiene cuatro en linea en la diagonal que empieza la posicion " ?i " " ?c   crlf)
(retract ?f)
(assert (muestra_posicion))
) 

(defrule gana_diagonal_inversa
(declare (salience 9999))
?f <- (Turno ?X)
(Cuatro_en_linea Juego ?jugador diagonal_inversa ?i ?c)
=>
(printout t ?jugador " ha ganado pues tiene cuatro en linea en la diagonal hacia arriba que empieza la posicin " ?i " " ?c   crlf)
(retract ?f)
(assert (muestra_posicion))
) 


;;;;;;;;;;;;;;;;;;;;;;;  DETECTAR EMPATE

(defrule empate
(declare (salience -9999))
(Turno ?X)
(Tablero Juego 1 1 M|J)
(Tablero Juego 1 2 M|J)
(Tablero Juego 1 3 M|J)
(Tablero Juego 1 4 M|J)
(Tablero Juego 1 5 M|J)
(Tablero Juego 1 6 M|J)
(Tablero Juego 1 7 M|J)
=>
(printout t "EMPATE! Se ha llegado al final del juego sin que nadie gane" crlf)
)

;;;;;;;;;;;;;;;;;;;;;; CONOCIMIENTO EXPERTO ;;;;;;;;;;
;;;;; Â¡Â¡Â¡Â¡Â¡Â¡Â¡Â¡Â¡Â¡ AÃ±adir conocimiento para que juege como vosotros jugariais !!!!!!!!!!!!
;;;;;Nos basaremos en un orden de prioridad para realizar las distintas acciones posibles. Siendo las prioridades en el siguiente orden de mayor a menor: Colocar cuando M tiene un trío, Taponar cuando J tiene un trío, Colocar cuando M tiene una pareja, Taponar cuando J tiene una pareja, Colocar al lado de nuestra pieza cuando J no tiene ni parejas ni tríos y colocar de forma aleatoria cuando no tenemos ninguna pieza colocada.
;;;;;Por establecer algún orden, si estamos comprobando parejas o tríos en horizontal, siempre se intentará colocar a la derecha de la pareja, trío o ficha sola. Si no pudiésemos colocar a la derecha porque está ocupado o por que es el final del tablero, colocamos a la izquierda. 
;;;;;Por el contrario, si es en vertical o en diagonal (en cualquiera de los dos sentidos) siempre se intentará colocar donde corresponda si la posición no está ocupada

;;;;;Si comprobamos lo anterior, se puede dar la posibilidad de que en la fila y la columna en la que queremos colocar, las filas de debajo estén vacías. Por lo que se rellenarán los huecos de "debajo" y esto no tendría sentido para la estrategia porque podría perjudicarla. Por ello, siempre comprobaremos si el hueco anterior al que queremos rellenar está libre, menos cuando estamos comprobando en vertical o cuando en horizontal estamos en la fila 6


;;;;;;;;;;;;;;;;;;;;;; DEFENSA ;;;;;;;;;;
;;;;;Declararemos estos hecho para poder encontrar las posiciones que se encuentran a la derecha (siguiente) o a la izquierda (anterior) de la posición indicada, o bien ariiba (anterior) o abajo (siguiente)

(deffacts obtenerSiguiente 
(siguiente 1 2) (siguiente 2 3) (siguiente 3 4) (siguiente 4 5) (siguiente 5 6) (siguiente 6 7)
)

(deffacts obtenerAnterior 
(anterior 2 1) (anterior 3 2) (anterior 4 3) (anterior 5 4) (anterior 6 5) (anterior 7 6)
)




;;;;;Esta función reconoce que haya dos posiciones seguidas ocupadas por el jugador. Si esto ocurre, la estrategia será tapar la casilla de al lado para que el jugador no pueda seguir colocando al lado de estas. La regla dos_en_linea_horizontal_coloco_derecha reconoce que las casillas estén ocupadas y además que la posición de la derecha esté libre y que no sea el final de l tablero (por la derecha, es decir, que no sea la columna 7). Complementaria a esta tenemos la regla dos_en_linea_horizontal_coloco_izquierda, la cual se encarga de colocar una ficha por la izquierda
;;;;;Esta, crea una salida: (assert (Dos_en_linea ?t J horizontal ?i ?s)), la cual sirve principalmente para comprobar que debe colocarse porque hay una pareja y además saber la columna en la que se debe colocar
;;;;;Por otro lado si no tenemos la pareja en la fila 6 (la de abajo) debemos comprobar que el hueco que se encuentra en diagonal derecho hacia abajo no está libre, puesto que si no, se colocaría en la fila anterior, por lo que no sería bueno para la estrategia. Por ello, si no es la fila 6, hacemos (assert (Comprobar_hueco ?t ?a ?s)), que lo usaremos en la regla Comprueba_hueco_libre la cual leerá la fila y la columna del hueco que queremos comprobar

(defrule dos_en_linea_horizontal_coloco_derecha
   (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i ?c J)
   (siguiente ?c ?c1)
   (Tablero ?t ?i ?c1 J)
   (test (=(+ ?c 1) ?c1))
   (siguiente ?c1 ?s)
   (Tablero ?t ?i ?s _)
   (not(test (= ?c1 7)))

   (siguiente ?i ?a)

   (not(PrioridadALTA))
   (not(PrioridadMediaAlta))
   (not(PrioridadMedia))
=> 
   (if (= ?i 6) then 
     (assert (Prioridad1))
     (assert (Prioridad_baja))
     (assert (Dos_en_linea ?t J ?i ?s))

   else 
    (assert (Comprobar_hueco ?t ?a ?s))
   )

)


;;;;;Esta regla hace lo mismo que la anterior pero colocando en la posición que se encuentra a la izquierda de esta pareja. Esta regla sólo es llamada cuando se da el hecho de que haya una pareja del jugador y que además no haya podido colocar en la posición de la derecha
;;;;;Además, produce la misma salida que la regla anterior, pero se le pasa la columna de la izquierda si esta está libre
;;;;;Por otro lado, esta función también comprobará qque el hueco diagonal izquierdo de la fila de abajo de la pareja no está libre de la misma forma que en la función anterior

(defrule dos_en_linea_horizontal_coloco_izquierda
   (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i ?c J)
   (siguiente ?c ?c1)
   (Tablero ?t ?i ?c1 J)
   (test (=(+ ?c 1) ?c1))
   (not(test (= ?c 1)))
   (anterior ?c ?s)
   (Tablero ?t ?i ?s _)
   (siguiente ?i ?a)

   (not(Prioridad))
   (not(Prioridad2))
=> 

   (if (= ?i 6) then 
     (assert (Prioridad1))
     (assert (Prioridad_baja))
     (assert (Dos_en_linea ?t J ?i ?s))

   else 
     (assert (Comprobar_hueco ?t ?a ?s))
   )
)

;;;;;Comprobaremos lo mismo para cuando J tiene una pareja en vertical

(defrule dos_en_linea_vertical
     (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i1 ?c J)
   (siguiente ?i1 ?i2)
   (Tablero ?t ?i2 ?c J)
   (test (= (+ ?i1 1) ?i2))
   (not(test(= ?i2 1)))
   (not(Prioridad))
   (not(Prioridad2))
=> 
   (assert (Prioridad1))
     (assert (Prioridad_baja))
     (assert (Dos_en_linea ?t J ?i1 ?c))
     
)

;;;;;Esta regla comprueba que J tenga una pareja en la diagonal directa
(defrule dos_en_diagonal_directa
   (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i ?c J)
   (anterior ?i ?ni)
   (siguiente ?c ?nc)

   (Tablero ?t ?ni ?nc J)
   (not(test(= ?nc 7)))
   (siguiente ?nc ?s)

   (not(Prioridad))
  (not(Prioridad2))
=> 
   (assert (Prioridad1))
     (assert (Prioridad_baja))
     (assert (Comprobar_hueco ?t ?ni ?s))
)

;;;;;Esta regla comprueba que J tenga una pareja en la diagonal inversa
(defrule dos_en_diagonal_inversa
   (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i ?c J)
   (anterior ?i ?ni)
   (anterior ?c ?nc)
   (not(test(= ?nc 1)))
   (Tablero ?t ?ni ?nc J)
   (anterior ?nc ?s)

   (not(Prioridad))
   (not(Prioridad2))
=> 
   (assert (Prioridad1))
     (assert (Prioridad_baja))
     (assert (Comprobar_hueco ?t ?ni ?s))
)


;;;;;Esta regla la usaremos para comprobar que los huecos de debajo no están vacíos. A pesar de que usaremos esta regla en otras ocasiones, haremos distinciones debido a las prioridades que ha¡emos establecido
(defrule Comprueba_hueco_libre 
   (Comprobar_hueco ?t ?i ?c)
   (not(Tablero ?t ?i ?c _))
=>
   (assert (Prioridad_baja))
   (assert (Dos_en_linea ?t J ?i ?c))
)

;;;;;Esta regla, reconoce el turno de la máquina, también comprueba (Dos_en_linea Juego J horizontal ?i ?c) que se crea cuando el jugador contrario tiene una pareja, de esta forma sabemos que la columna que nos pasan como parámetro es en la que debemos colocar.
;;;;; Por otro lado, llamaremos a (retract ?f) para eliminar el evento de la lista de eventos puesto que ya ha ocurrido

(defrule tapona_pareja
   (declare (salience -9998))
   ?f<-(Turno M)
   (Dos_en_linea Juego J ?i ?c)
   (not(Prioridad))
   (Prioridad_baja)
   ?pb <- (Prioridad_baja)
   ?p1 <- (Prioridad1)
=>
   (assert (Jugar ?c))
   (retract ?pb)
   (retract ?p1)
   (retract ?f)
   (printout t "Tapono pareja "  crlf)
     
)





;;;;;TRÍOS
;;;;;Ahora haremos exactamente lo mismo que antes, pero para el caso de que J tenga tríos en las diferentes posiciones, y estableceremos su respectiva prioridad.

(defrule tres_en_linea_horizontal_coloco_derecha
   (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i ?c J)
   (siguiente ?c ?cs)
   (Tablero ?t ?i ?cs J)
   (test (=(+ ?c 1) ?cs))
   (siguiente ?cs ?s)
   (Tablero ?t ?i ?s J)
   (test (=(+ ?cs 1) ?s))
   (siguiente ?s ?s2)
   (Tablero ?t ?i ?s2 _)
   (not(test (= ?s 7)))

   (siguiente ?i ?a)

=> 
   (if (= ?i 6) then 
     (assert(PrioridadMediaAlta))
     (assert (Coloca_derecha))
     (assert (Tres_en_linea ?t J ?i ?s2))

   else 
    (assert (Comprobar_hueco_trio ?t ?a ?s2))
   )

)


(defrule tres_en_linea_horizontal_coloco_izquierda
   (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i ?c J)
   (siguiente ?c ?nc)
   (Tablero ?t ?i ?nc J)
   (test (=(+ ?c 1) ?nc))
   (siguiente ?nc ?s)
   (Tablero ?t ?i ?s J)
   (test (=(+ ?nc 1) ?s))

   (anterior ?c ?s2)
   (Tablero ?t ?i ?s2 _)
   (not(test (= ?c 1)))
   
   (siguiente ?s ?ss)
   (not(Tablero ?i ?ss _))
   (siguiente ?i ?a)
   (not(Coloca_derecha))
=> 

   (if (= ?i 6) then 
     (assert(PrioridadMediaAlta))
     (assert (Tres_en_linea ?t J ?i ?s2))

   else 
    (assert (Comprobar_hueco_trio ?t ?a ?s2))
   )

)


(defrule tapona_trio
   (declare (salience -9998))
   ?f<-(Turno M)
   (Tres_en_linea Juego J ?i ?c)
   (not(PrioridadALTA))
   (PrioridadMediaAlta)
   ?p <- (PrioridadMediaAlta)

=>
   (printout t "Tapono TRIO " crlf)
   (assert (Jugar ?c))
   (retract ?p)
   (retract ?f)
)

(defrule Comprueba_hueco_libre_trio 
   (Comprobar_hueco_trio ?t ?i ?c)
   (not(Tablero ?t ?i ?c _))
=>
   (assert(PrioridadMediaAlta))
   (assert (Tres_en_linea ?t J ?i ?c))
   (printout t "Compruebo hueco no esta libre trio " crlf)
)



(defrule tres_en_linea_vertical
   ?f <- (Turno M)
   (Tablero ?t ?i ?c J)
   (anterior ?i ?a1)
   (Tablero ?t ?a1 ?c J)
   (test (= (+ ?a1 1) ?i))
   (anterior ?a1 ?a)
   (Tablero ?t ?a ?c J)
   (not(test(= ?a 1)))

   (anterior ?a ?a3)
   (Tablero ?t ?a3 ?c _)

=> 
     (assert(PrioridadMediaAlta))
     (assert (Tres_en_linea ?t J ?i ?c))
     (printout t "TRIO en vertical en  columna" ?c  crlf)
     
)


(defrule tres_en_diagonal_directa
(declare (salience 9999))
?f <- (Turno ?X)
(Tablero ?t ?i ?c J)
(anterior ?i ?ni)
(siguiente ?c ?nc)

(Tablero ?t ?ni ?nc J)

(anterior ?ni ?ni2)
(siguiente ?nc ?nc2)

(Tablero ?t ?ni2 ?nc2 J)

(not(test(= ?nc2 7)))
(siguiente ?nc ?s)

=>
(assert (Comprobar_hueco_trio ?t ?ni2 ?s))
(printout t "TRIO diagonal directa en columna " ?c  crlf)
)

(defrule tres_en_diagonal_inversa
(declare (salience 9999))
?f <- (Turno ?X)
(Tablero ?t ?i ?c J)
(anterior ?i ?ni)
(anterior ?c ?nc)

(Tablero ?t ?ni ?nc J)

(anterior ?ni ?ni2)
(anterior ?nc ?nc2)

(Tablero ?t ?ni2 ?nc2 J)

(anterior ?nc2 ?s)

(not(test(= ?nc2 1)))

=>
(assert (Comprobar_hueco_trio ?t ?ni2 ?s))
(printout t "TRIO diagonal inversa en  columna " ?c  crlf)
)


;;;;;;;;;;;;;;;;;;;;;; ATAQUE ;;;;;;;;;;
;;;;Estableceremos las distintas reglas para cuando queremos "atacar", es decir, mejorar nuestra situación, creando parejas, tríos o ganando y no taponando las parejas o tríos de J

;;;;;Esta regla colocará una ficha M al lado de otra M, con una priridad baja, cuando no tenemos ni parejas ni tríos en el tablero, ni tampoco queremos perjudicar a las parejas o los tríos de J
(defrule coloca_derecha
   (declare (salience 9999))
   ?f <- (Turno M)

   (Tablero ?t ?i ?c M)

   (siguiente ?c ?nc)
   (Tablero ?t ?i ?nc _)
   (siguiente ?i ?a)
   (not(test(= ?c 7)))
   (not(Prioridad_baja))
   (not(Prioridad))

=> 

   (if (= ?i 6) then 
     (assert (Coloca_ataque ?t J ?i ?nc))
   else 
     (assert (Comprobar_hueco_ataque ?t ?a ?nc))
   )
)

;;;;;Esta regla hará lo mismo que la anterior pero en el caso de que no hayamos podido colocar a la derecha
(defrule coloca_izquierda
   (declare (salience 9999))
   ?f <- (Turno M)

   (Tablero ?t ?i ?c M)



   (anterior ?c ?nc)
   (Tablero ?t ?i ?nc _)

   (siguiente ?i ?a)
   (not(test(= ?c 1)))
   (not(Prioridad_baja))
   (not(Prioridad))

=> 
   (if (= ?i 6) then 
     (assert (Coloca_ataque ?t J ?i ?nc))
   else 
     (assert (Comprobar_hueco_ataque ?t ?a ?nc))
   )
)

;;;;;Esta regla hará lo mismo que la anterior pero en el caso de que no hayamos podido colocar a la derecha ni a la izquierda
(defrule coloca_vertical
   (declare (salience 9999))
   ?f <- (Turno M)

   (Tablero ?t ?i ?c M)



   (siguiente ?i ?ni)
   (Tablero ?t ?ni ?c _)


   (not(test(= ?i 1)))
   (not(Prioridad_baja))
   (not(Prioridad))

=> 
     (assert (Coloca_ataque ?t J ?ni ?c))

)

;;;;;Esta regla colocará una ficha M al lado de una pareja de M's cuando ni J ni M tienen tríos en el tablero
(defrule coloca_pareja_derecha
   (declare (salience 9999))
   ?f <- (Turno M)

   (Tablero ?t ?i ?c M)

   (siguiente ?c ?nc)
   (Tablero ?t ?i ?nc M)

   (siguiente ?nc ?nc2)
   (Tablero ?t ?i ?nc2 _)


   (siguiente ?i ?a)
   (not(test(= ?nc 7)))

   (not(PrioridadALTA))
   (not(PrioridadMediaAlta))

=> 

   (if (= ?i 6) then 
     (assert(PrioridadMedia))
     (assert (Coloca_ataque ?t J ?i ?nc2))
   else 
     (assert (Comprobar_hueco_ataque ?t ?a ?nc2))
   )
)

;;;;;Esta regla hará lo mismo que la anterior, siempre y cuando no hayamos podido colocar a la derecha
(defrule coloca_pareja_izquierda
   (declare (salience 9999))
   ?f <- (Turno M)

   (Tablero ?t ?i ?c M)

   (siguiente ?c ?s)
   (not(Tablero ?t ?i ?s _))

   (anterior ?c ?nc)
   (Tablero ?t ?i ?nc M)

   (anterior ?nc ?nc2)
   (Tablero ?t ?i ?nc2 _)

   (siguiente ?i ?a)
   (not(test(= ?c 2)))

   (not(PrioridadALTA))
   (not(PrioridadMediaAlta))

=> 

   (if (= ?i 6) then 
     (assert(PrioridadMedia))
     (assert (Coloca_ataque ?t J ?i ?nc2))
   else 
     (assert (Comprobar_hueco_ataque ?t ?a ?nc2))
   )
)


;;;;;Esta regla colocará una ficha M al lado de una pareja de M's que se encuantren en diagonal directa cuando ni J ni M tienen tríos en el tablero
(defrule coloco_diagonal_directa
   (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i ?c M)
   (anterior ?i ?ni)
   (siguiente ?c ?nc)

   (Tablero ?t ?ni ?nc M)
   (not(test(= ?nc 7)))
   (siguiente ?nc ?s)
  

   (not(PrioridadALTA))
   (not(PrioridadMediaAlta))

=> 
     (assert (Comprobar_hueco_ataque ?t ?ni ?s))
)

;;;;;Esta regla colocará una ficha M al lado de una pareja de M's que se encuantren en diagonal inversa cuando ni J ni M tienen tríos en el tablero

(defrule coloco_diagonal_inversa
   (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i ?c J)
   (anterior ?i ?ni)
   (anterior ?c ?nc)
   (not(test(= ?nc 1)))
   (Tablero ?t ?ni ?nc J)
   (anterior ?nc ?s)

   (not(PrioridadALTA))
   (not(PrioridadMediaAlta))

=> 
     (assert (Comprobar_hueco_ataque ?t ?ni ?s))
)

;;;;;TRIOS
;;;;;Esta regla colocará una ficha M al lado de un trío de M's. Esta tendrá máxima prioridad puesto que con esta se ganaría la partida
(defrule trio_derecha
   (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i ?c M)
   (siguiente ?c ?cs)
   (Tablero ?t ?i ?cs M)
   (test (=(+ ?c 1) ?cs))
   (siguiente ?cs ?s)
   (Tablero ?t ?i ?s M)
   (test (=(+ ?cs 1) ?s))
   (siguiente ?s ?s2)
   (Tablero ?t ?i ?s2 _)
   (not(test (= ?s 7)))

   (siguiente ?i ?a)

=> 
   (if (= ?i 6) then 
     (assert (PrioridadALTA))
     (assert (Coloca_ataque ?t J ?i ?s2))

   else 
    (assert (Comprobar_hueco_trio ?t ?a ?s2))
   )

)

;;;;;Esta regla colocará una ficha M al lado de un trío de M's, siempre que no se haya podido colocar a la derecha de este. Esta tendrá máxima prioridad puesto que con esta se ganaría la partida
(defrule trio_izquierda
   (declare (salience 9999))
   ?f <- (Turno M)
   (Tablero ?t ?i ?c J)
   (siguiente ?c ?nc)
   (Tablero ?t ?i ?nc J)
   (test (=(+ ?c 1) ?nc))
   (siguiente ?nc ?s)
   (Tablero ?t ?i ?s J)
   (test (=(+ ?nc 1) ?s))

   (anterior ?c ?s2)
   (Tablero ?t ?i ?s2 _)
   (not(test (= ?c 1)))
   
   (siguiente ?s ?ss)
   (not(Tablero ?i ?ss _))
   (siguiente ?i ?a)
   (not(Coloca_derecha))
=> 

   (if (= ?i 6) then 
     (assert (PrioridadALTA))
     (assert (Coloca_ataque ?t J ?i ?s2))

   else 
    (assert (Comprobar_hueco_ataque ?t ?a ?s2))
   )

)

;;;;;Esta regla colocará una ficha M al lado de un trío de M's que se encuentra vertical. Esta tendrá máxima prioridad puesto que con esta se ganaría la partida
(defrule coloco_trio_linea_vertical
   ?f <- (Turno M)
   (Tablero ?t ?i ?c M)
   (anterior ?i ?a1)
   (Tablero ?t ?a1 ?c M)
   (test (= (+ ?a1 1) ?i))
   (anterior ?a1 ?a)
   (Tablero ?t ?a ?c M)
   (not(test(= ?a 1)))

   (anterior ?a ?a3)
   (Tablero ?t ?a3 ?c _)

=> 
     (assert (PrioridadALTA))
     (assert (Coloca_ataque ?t J ?i ?c))
     (printout t "TRIO en vertical en  columna" ?c  crlf)
     
)

;;;;;Esta regla colocará una ficha M al lado de un trío de M's que se encuentra en la diagonal directa. Esta tendrá máxima prioridad puesto que con esta se ganaría la partida
(defrule coloco_trio_diagonal_directa
(declare (salience 9999))
?f <- (Turno ?X)
(Tablero ?t ?i ?c M)
(anterior ?i ?ni)
(siguiente ?c ?nc)

(Tablero ?t ?ni ?nc M)

(anterior ?ni ?ni2)
(siguiente ?nc ?nc2)

(Tablero ?t ?ni2 ?nc2 M)

(not(test(= ?nc2 7)))
(siguiente ?nc ?s)

=>
(assert (PrioridadALTA))
(assert (Comprobar_hueco_ataque ?t ?ni2 ?s))
(printout t "TRIO diagonal directa en columna " ?c  crlf)
)

;;;;;Esta regla colocará una ficha M al lado de un trío de M's que se encuentra en la diagonal inversa. Esta tendrá máxima prioridad puesto que con esta se ganaría la partida
(defrule coloco_trio_diagonal_inversa
(declare (salience 9999))
?f <- (Turno ?X)
(Tablero ?t ?i ?c M)
(anterior ?i ?ni)
(anterior ?c ?nc)

(Tablero ?t ?ni ?nc M)

(anterior ?ni ?ni2)
(anterior ?nc ?nc2)

(Tablero ?t ?ni2 ?nc2 M)

(anterior ?nc2 ?s)

(not(test(= ?nc2 1)))

=>
(assert (PrioridadALTA))
(assert (Comprobar_hueco_ataque ?t ?ni2 ?s))
(printout t "TRIO diagonal inversa en  columna " ?c  crlf)
)

;;;;;Esta regla la usaremos para colocar las fichas de M cuando estemos "atacando"
(defrule ataque
   (declare (salience -9998))
   ?f<-(Turno M)
   (Coloca_ataque Juego J ?i ?c)
   (PrioridadMedia)
   ?p <-(PrioridadMedia)
=>
   (assert (Jugar ?c))
   (retract ?f)
   (retract ?p)
   (printout t "Coloco al lado de mi ficha " crlf)
)

;;;;;Esta la usaremos cuando encontremos un trío de M's que tendrá la prioridad máxima
(defrule tira_a_ganar
   (declare (salience -9998))
   ?f<-(Turno M)
   (Coloca_ataque Juego J ?i ?c)
   (PrioridadALTA)
   ?pa <- (PrioridadALTA)
=>
 
   (assert (Jugar ?c))
   (retract ?f)
   (retract ?pa)
   (printout t "Coloco al lado de mi ficha " crlf)
)
   
;;;;;Esta regla comprueba que donde queremos colocar, las filas de debajo no se encuentran vacías. Hace lo mismo que las anteriores, pero distingue las prioridades.
(defrule Comprueba_hueco_ataque 
   (Comprobar_hueco_ataque ?t ?i ?c)
   (not(Tablero ?t ?i ?c _))
=> 

   (assert (PrioridadALTA))
   (assert (Coloca_ataque ?t J ?i ?c))
   (printout t "Compruebo hueco no esta libre trio " crlf)
)

