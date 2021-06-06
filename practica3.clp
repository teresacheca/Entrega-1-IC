;;;;PRACTICA 3: RECOMENDACIÓN DE RAMAS ;;;;
;;;;TERESA DEL CARMEN CHECA MARABOTTO ;;;;
;;;;;;;Siguiendo el árbol de clasificacion, se realizaran una serie de preguntas para llegar hasta una decisión sobre la rama que se recomienda 

;;;;;;;Primero, crearemos los hecho de las ramas
(deffacts Ramas
(Rama Computación_y_Sistemas_Inteligentes)
(Rama Ingeniería_del_Software)
(Rama Ingeniería_de_Computadores)
(Rama Sistemas_de_Información)
(Rama Tecnologías_de_la_Información)
)

;;;;;;;Ahora crearemos un template que usaremos para recopilar los consejos que dará el sistema dependiendo de las respuestas del alumno
;;;;;;;Este template tiene la estructura: (Consejo <nombre de la rama> “<texto del motivo>”  “apodo del experto”)

(deftemplate Consejo 
  (slot rama)
  (slot motivo)
  (slot experto)
)

;;;;;;;Como nuestra primera pragunta será si le gustan las matemáticas o no, de forma que podremos clasificar en dos grupos las asignaturas, podemos declarar los primeros 5 consejos (uno para cada rama), puesto que se dará bajo cualquier circunstancia
(deffacts consejos
  (Consejo (rama Computación_y_Sistemas_Inteligentes) (motivo "Te gustan las matematicas") (experto SISTEMA))
  (Consejo (rama Ingeniería_del_Software) (motivo "Te gustan las matematicas") (experto SISTEMA))
  (Consejo (rama Ingeniería_de_Computadores) (motivo "No te gustan las matematicas") (experto SISTEMA))
  (Consejo (rama Sistemas_de_Información) (motivo "No te gustan las matematicas") (experto SISTEMA))
  (Consejo (rama Tecnologías_de_la_Información) (motivo "No te gustan las matematicas") (experto SISTEMA))



)


;;;;;;;Mostramos uns introduccion al alumno para que sepa el objetivo del sistema
(defrule introduccion
	(declare (salience 1000)) 
=>
   	(printout t "Esto es un sistema que te ayuda a elegir la rama de ingenieria informatica que mas se adapte a tus gustos" crlf)
   	(printout t "Responde a las siguientes preguntas " crlf)

)
   
;;;;;;;Nuestra primera pregunta será acerca de si le gustan o no las matemáticas, si nos responde que sí, pasaremos a preguntarle si es trabajador, si nos responde que no, pasamos a preguntarle si le gusta el hardware

(defrule matematicas
	(declare (salience 1000)) 
=>
   	(printout t ">>>>>¿Te gustan las matematicas? (SI/NO)" crlf)
   	(assert (mates (read)))

)
 

;;;;;;;Según el arbol de clasificación, podemos preguntarle si es trabajador, tanto si nos responde que sí le gustan las matemáticas, como si nos recponde que no le ha gustado el hardware. 
;;;;;;;Si le gustaban las matemáticas: Si responde MUCHO o NORMAL, pasamos a preguntarle por su nota media del expediente, si nos responde POCO podemos decidir recomendarle la rama de ingeniería del software
;;;;;;;Si no le gustaba el hardware: Si nos reponde MUCHO o NORMAL, pasamos a preguntarle si le gusta programar. Si nos responde POCO, podemos decidir recomendarle la rama de TSI
;;;;;;;Como llegamos a esta pregunta si le gustan las matemáticos o si no le gusta el hardware, pordemos crear los consejos correspondientes para las ramas con las que llegaríamos a esta pregunta. Como el consejo de las matemáticas ya lo tenemos introducido, no hace falta que volvamos a crearlo

(defrule trabajador
	(declare (salience 1000)) 
	(or (mates SI) (hardware NO))

=>
   	(printout t ">>>>>¿Eres trabajador? (MUCHO/NORMAL/POCO)" crlf)
   	(assert (trabajador (read)))
   	(assert(Consejo (rama Tecnologías_de_la_Información) (motivo "No te gusta el hardware") (experto SISTEMA)))
   	(assert (Consejo (rama Sistemas_de_Información) (motivo "No te gusta el hardware") (experto SISTEMA)))

)


;;;;;;;Ahora, podemos preguntarle por su nota media del expediente. Esta pregunta sólo nos interesa si le gustan las matemáticas y si es trabajador (MUCHO o NORMAL)
;;;;;;;Como sólo llegamos a esta pregunta con las ramas de CSI y IS, y sabiendo que es trabajador, podemos declarar los respectivos consejos
;;;;;;;Si nos responde ALTA o MEDIA, pasamos a preguntarle si le gusta programar. Si nos responde BAJA, le podemos recomendar la rama de IS

(defrule nota_media
	(declare (salience 1000)) 
	(mates SI)
	(or(trabajador MUCHO) (trabajador NORMAL))
=>
  	(printout t ">>>>>¿Como es tu nota media? (ALTA/MEDIA/BAJA)" crlf)
	(assert (nota(read)))
	(assert(Consejo (rama Computación_y_Sistemas_Inteligentes) (motivo "Trabajas bastante") (experto SISTEMA)))
	(assert (Consejo (rama Ingeniería_del_Software) (motivo "Trabajas bastante") (experto SISTEMA)))

)

;;;;;;;Podemos preguntarle si le gusta programar: en el caso de que le hayan gustado las matemáticas, sea trabajados, tenga una nota media normal o alta, o en el caso de que no le gusten las matemáticas, no le guste el hardware y sea trabajador
;;;;;;;Si es el primer caso y nos responde que no, le recomendamos CSI, si nos responde que si, le preguntamos si prefiere las clases teóricas o prácticas
;;;;;;;Si es el segundo caso, nos interesa saber si le gusta programar, puesto que con los datos anteriores, si le gusta programar, le recomendamos SI, si no le gusta, le recomendamos TI
;;;;;;;Al igual que en los anteriores, creamos los respectivos consejos
(defrule programacion
	(declare (salience 1000)) 
	   (or 
	      (or
	         (nota ALTA) 
	         (nota MEDIA)
	      ) 
	      (and 
	         (hardware NO) 
	         (or 
        	    (trabajador MUCHO) 
	            (trabajador NORMAL)
	         )
	      )
	   )
=>
  	(printout t ">>>>>¿Te gusta programar? (SI/NO)" crlf)
	(assert (programar(read)))
	(assert(Consejo (rama Computación_y_Sistemas_Inteligentes) (motivo "Tienes buena nota media") (experto SISTEMA)))
   	(assert (Consejo (rama Ingeniería_del_Software) (motivo "Tienes buena nota media") (experto SISTEMA)))
   	(assert(Consejo (rama Tecnologías_de_la_Información) (motivo "Trabajas bastante") (experto SISTEMA)))
   	(assert (Consejo (rama Sistemas_de_Información) (motivo "Trabajas bastante") (experto SISTEMA)))


)


;;;;;;;Esta pregunta nos interesa hacerla: si le gustanlas matemáticas, es trabajador, tiene buena nota media y le gusta programar, o si no le gustan las matemáticas pero sí el hardware
;;;;;;;Si es el primer caso y nos responde TEORICAS, con la información anterior, podemos recomendarle CSI, si nos responde PRACTICAS, podemos recomendarle IS
;;;;;;;Si es el segundo caso y nos responde TEORICAS, podemos recomendarle la rama de TI, si nos responde PRACTICAS, podemos recomendarle IC
;;;;;;;Como en los anteriores, de los datos anteriores, creamos los respectivos consejos

(defrule teoricas_o_practicas
(declare (salience 1000)) 
(or (and (programar SI) (mates SI)) (hardware SI))
=>
   (printout t ">>>>>¿Prefieres las clases teoricas o practicas? (TEORICAS/PRACTICAS)" crlf)
   (assert (teoricas_practicas(read)))
      (assert(Consejo (rama Computación_y_Sistemas_Inteligentes) (motivo "Te gusta programar") (experto SISTEMA)))
   (assert (Consejo (rama Ingeniería_del_Software) (motivo "Te gusta programar") (experto SISTEMA)))
   (assert(Consejo (rama Tecnologías_de_la_Información) (motivo "Te gusta el hardware") (experto SISTEMA)))
   (assert (Consejo (rama Ingeniería_de_Computadores) (motivo "Te gusta el hardware") (experto SISTEMA)))

)


;;;;;;;Por último le preguntamos si le gusta el hardware o no. Esta pregunta nos interesa sólo si no le gustan las matemáticas.
;;;;;;;Si nos responde que sí le gusta el hardware, pasamos a preguntarle si prefiere las asignaturas teóricas o prácticas.
;;;;;;;Si nos responde que no le gusta el hardware, pasamos a preguntarñe si es o no trabajador

(defrule gusta_hardware
(declare (salience 1000)) 
(mates NO)
=>
   (printout t ">>>>>¿Te gusta el hardware? (SI/NO)" crlf)
   (assert (hardware(read)))

)


;;;;;;;Con la información anterior, dependiendo de lo que ha respondido el alumno, creamos los consejos que no hemos podido crear antes o que entran en conflicto con los datos anteriores puesto que se puede recomendar una rama por muchas razone distintas, no siempre van a ser las mismas
(defrule check_consejos
(hardware NO)
(trabajador POCO)

=>
   (assert (Consejo (rama Tecnologías_de_la_Información) (motivo "No te gusta el hardware") (experto SISTEMA)))
   (assert (Consejo (rama Tecnologías_de_la_Información) (motivo "Trabajas poco") (experto SISTEMA)))


)

(defrule check_consejos2
(hardware NO)
(programar SI)

=>
   (assert (Consejo (rama Sistemas_de_Información) (motivo "No te gusta el hardware") (experto SISTEMA)))
(assert (Consejo (rama Sistemas_de_Información) (motivo "Te gusta programar") (experto SISTEMA)))


)

(defrule check_consejos3
(hardware SI)
(teoricas_practicas TEORICAS)

=>
   (assert (Consejo (rama Tecnologías_de_la_Información) (motivo "Te gustan mas las clases teoricas que las practicas") (experto SISTEMA)))
)

(defrule check_consejos4
(hardware SI)
(teoricas_practicas PRACTICAS)

=>
   (assert (Consejo (rama Ingeniería_de_Computadores) (motivo "Te gustan mas las clases practicas que las teoricas") (experto SISTEMA)))
)

(defrule check_consejos5
(mates SI)
(programar NO)

=>
   (assert (Consejo (rama Computación_y_Sistemas_Inteligentes) (motivo "No te gusta programar") (experto SISTEMA)))
)

(defrule check_consejos6
(mates SI)
(teoricas_practicas TEORICAS)

=>
   (assert (Consejo (rama Computación_y_Sistemas_Inteligentes) (motivo "Te gustan mas las clases teoricas que las practicas") (experto SISTEMA)))
)


(defrule check_consejos7
(mates SI)
(teoricas_practicas PRACTICAS)

=>
   (assert (Consejo (rama Ingeniería_del_Software) (motivo "Te gustan mas las clases pacticas que las teoricas") (experto SISTEMA)))
)

(defrule check_consejos8
(mates SI)
(trabajador POCO)

=>
   (assert (Consejo (rama Ingeniería_del_Software) (motivo "Trabajas poco") (experto SISTEMA)))
)

(defrule check_consejos9
(mates SI)
(nota BAJA)

=>
   (assert (Consejo (rama Ingeniería_del_Software) (motivo "Tu nota media es baja") (experto SISTEMA)))
)


;;;;;;;Una vez hayamos declarado todos los consejos, podemos pasar a comprobar la información que nos ha dado el alumno. Por cada rama, programamos los distintos caminos que aparecen en el árbol para que, si las respuestas del alumno coinciden con estas, se jaga un assert Recomendar "Rama". Con ello, pasaremos a sacar el mensaje con la rama recomendada

(defrule recomiendo_CSI
   (mates SI)
   (or 
      (trabajador MUCHO) 
      (trabajador NORMAL)
    )
   (or 
      (nota ALTA) 
      (nota MEDIA)
   )
   (or 
      (programar NO) 
      (and 
          (programar SI) 
          (teoricas_practicas TEORICAS)
      )
    )

=> 
  (printout t "------Se recomienda realizar la rama de: COMPUTACION Y SISTEMAS INTELIGENTES por los siquientes motivos: " crlf)
  (assert (Recomendar Computación_y_Sistemas_Inteligentes))
)


(defrule recomiendo_IS
  (mates SI)
  (or
     (or 
        (trabajador POCO)
        (and
            (or
               (trabajador MUCHO)
               (trabajador NORMAL)
            )
           (nota BAJA)
         )
      )
      (and
         (or
            (nota ALTA)
            (nota MEDIA)
          )
          (and
              (programar SI)
              (teoricas_practicas PRACTICAS)
          )
      )
   )
     
   
=> 
  (printout t "------Se recomienda realizar la rama de: INGENIERIA DEL SOFTWARE por los siquientes motivos: " crlf)
  (assert (Recomendar Ingeniería_del_Software))

)


(defrule recomiendo_CI
    (mates NO)
    (hardware SI)
    (teoricas_practicas PRACTICAS)
     
   
=> 
  (printout t "------Se recomienda realizar la rama de: INGENIERIA DE COMPUTADORES por los siquientes motivos: " crlf)
  (assert (Recomendar Ingeniería_de_Computadores))


)



(defrule recomiendo_SI
    (mates NO)
    (hardware NO)
    (or 
       (trabajador MUCHO)
       (trabajdor NORMAL)
     )
     (programar SI)
     
   
=> 
  (printout t "------Se recomienda realizar la rama de: SISTEMAS DE INFORMACION por los siquientes motivos: " crlf)
  (assert (Recomendar Sistemas_de_Información))

)

(defrule recomiendo_TI
    (mates NO)
    (or
       (and
           (hardware SI)
           (teoricas_practicas TEORICAS)
        )
        (and
            (hardware NO)
            (or
               (trabajador POCO)
               (and
                   (or
                      (trabajador MUCHO)
                      (trabajador NORMAL)
                    )
                    (programar NO)
                )
            )
         )
     )
     
   
=> 
  (printout t "------Se recomienda realizar la rama de: TECNOLOGIAS DE LA INFORMACION por los siquientes motivos: " crlf)
  (assert (Recomendar Tecnologías_de_la_Información))

)

;;;;;;;Una vez sepamos la rama, recorreremos los distintos Consejos creados de forma que saquemos los motivos por los que hemos tomado la decisión de recomendarle una rama u otra.

(defrule justificacion_recomendacion
   (Recomendar ?c)
   (Rama ?c)
   (Consejo (rama ?c)  (motivo ?t) (experto SISTEMA))
=>
    (printout t "     - " ?t crlf)

)

;;;;;;;Con la siguiente regla, mostraremos un mensaje de error en la sintaxis, cuando las respuestas del alumno no se ajusten a las opciones que se le ofrecen



(defrule error_mates
	(declare (salience 1))
	(mates ?c)
        (test (and (neq ?c SI) (neq ?c NO)))
=>
        (printout t "Tienes que responder SI o NO" crlf)
   	(assert (mates (read)))
)


(defrule error_trabajador
	(declare (salience 1))
	(trabajador ?c)
        (test (and (neq ?c MUCHO) (and (neq ?c NORMAL)(neq ?c POCO))))
=>
        (printout t "Tienes que responder MUCHO, NORMAL o POCO" crlf)
   	(assert (trabajador (read)))
)


(defrule error_nota
	(declare (salience 1))
	(nota ?c)
        (test (and (neq ?c ALTA) (and (neq ?c MEDIA)(neq ?c BAJA))))
=>
        (printout t "Tienes que responder ALTA, MEDIA o BAJA" crlf)
   	(assert (nota (read)))
)


(defrule error_programacion
	(declare (salience 1))
	(programar ?c)
        (test (and (neq ?c SI) (neq ?c NO)))
=>
        (printout t "Tienes que responder SI o NO" crlf)
   	(assert (programar (read)))
)


(defrule error_teo_prac
	(declare (salience 1))
	(teoricas_practicas ?c)
        (test (and (neq ?c TEORICAS) (neq ?c PRACTICAS)))
=>
        (printout t "Tienes que responder TEORICAS o PRACTICAS" crlf)
   	(assert (teoricas_practicas (read)))
)


(defrule error_hardware
	(declare (salience 1))
	(hardware ?c)
        (test (and (neq ?c SI) (neq ?c NO)))
=>
        (printout t "Tienes que responder SI o NO" crlf)
   	(assert (hardware (read)))
)