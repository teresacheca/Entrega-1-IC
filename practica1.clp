   
;;;; HECHOS GENERALES DEL SISTEMA ;;;;;
;;;;TERESA DEL CARMEN CHECA MARABOTTO ;;;;
;;;;(serán válidos para todas las ejecuciones del sistema) ;;;;

; Listado de los leones de la familia con la propiedad unaria de macho o hembra

(deffacts leones
   (macho Mohatu) ; "Mohatu es macho"
   (macho Ahadi)
   (macho Mufasa)
   (macho Scar)
   (macho Kovu)
   (macho Nuka)
   (macho Kopa)
   (macho Mheetu)
   (macho Ni)
   (macho Simba)
   (macho Tojo)
   (macho Chumvi)
   (macho Boridi)
   
   (hembra Asali)         ; "Asali es una hembra"
   (hembra Uru)
   (hembra Sarabi)
   (hembra Sarafina)
   (hembra Zira)
   (hembra Nala)
   (hembra Kiara)
   (hembra Vitani)
   (hembra Kula) 
   (hembra Tama) 
   (hembra Chozi) 

)



;;;;; Plantilla típica de Relaciones binarias, ajustada a relaciones de parentesco restringiendo los valores de tipo de relación a estas. Se usa para registrar "El <sujeto> es <tipo de relación> de <objeto>", por ejemplo "Scar es TIO de Simba" 

(deftemplate Relacion 
  (slot tipo (type SYMBOL) (allowed-symbols HIJO PADRE ABUELO NIETO HERMANO ESPOSO PRIMO TIO SOBRINO  CUNIADO YERNO SUEGRO))
  (slot sujeto)
  (slot objeto))



;;;;; Declaramos todos los conjuntos de hechos necesarios ;;;;; 

;;;;; Relaciones femeninas posible
(deffacts Relacion_femenina 
   (Relacion_femenina HIJA)
   (Relacion_femenina MADRE)
   (Relacion_femenina ABUELA)
   (Relacion_femenina NIETA)
   (Relacion_femenina HERMANA)
   (Relacion_femenina ESPOSA)
   (Relacion_femenina PRIMA)
   (Relacion_femenina TIA)
   (Relacion_femenina SOBRINA)
   (Relacion_femenina CUNIADA)
   (Relacion_femenina NUERA)
   (Relacion_femenina SUEGRA)
  )

;;;;; Relaciones masculinas posibles

(deffacts Relacion_masculina 
   (Relacion_masculina HIJO)
   (Relacion_masculina PADRE)
   (Relacion_masculina ABUELO)
   (Relacion_masculina NIETO)
   (Relacion_masculina HERMANO)
   (Relacion_masculina ESPOSO)
   (Relacion_masculina PRIMO)
   (Relacion_masculina TIO)
   (Relacion_masculina SOBRINO)
   (Relacion_masculina CUNIADO)
   (Relacion_masculina YERNO)
   (Relacion_masculina SUEGRO)
  )

;;;;; Relaciones posibles puestas en plural
(deffacts plurales 
   (plurales HIJAS)(plurales MADRES)(plurales ABUELAS)(plurales NIETAS)(plurales HERMANAS)(plurales ESPOSAS)(plurales PRIMAS)(plurales TIAS)(plurales SOBRINAS)(plurales CUNIADAS)(plurales NUERAS)(plurales SUEGRAS)(plurales HIJOS)(plurales ABUELOS)(plurales NIETOS)(plurales HERMANOS)(plurales ESPOSOS)(plurales PRIMOS)(plurales TIOS)(plurales SOBRINOS)(plurales CUNIADOS)  (plurales YERNOS)(plurales SUEGROS)(plurales PADRES)
  )

;;;;; Tipos de relaciones indirectas en masculino
(deffacts indirectos 
   (indirectos ABUELO)
   (indirectos NIETO)
   (indirectos HERMANO)
   (indirectos ESPOSO)
   (indirectos PRIMO)
   (indirectos TIO)
   (indirectos SOBRINO)
   (indirectos CUNIADO)
   (indirectos YERNO)
   (indirectos SUEGRO)
  )

;;;;; Tipos de relaciones indirectas en femenino
(deffacts indirectos_f 
   (indirectos ABUELA)
   (indirectos NIETA)
   (indirectos HERMANA)
   (indirectos ESPOSA)
   (indirectos PRIMA)
   (indirectos TIA)
   (indirectos SOBRINA)
   (indirectos CUNIADA)
   (indirectos NUERA)
   (indirectos SUEGRA)
  )

;;;;; Todos los tipos de relaciones posibles
(deffacts tipos_relaciones 
   (tipos_relaciones ABUELA)(tipos_relaciones  NIETA)(tipos_relaciones  HERMANA)(tipos_relaciones  ESPOSA)(tipos_relaciones  PRIMA)(tipos_relaciones  TIA)(tipos_relaciones  SOBRINA)  (tipos_relaciones  CUNIADA)(tipos_relaciones  YERNA)(tipos_relaciones  SUEGRA)(tipos_relaciones  HIJO)( tipos_relaciones PADRE)( tipos_relaciones ABUELO)( tipos_relaciones NIETO)(tipos_relaciones HERMANO) (tipos_relaciones ESPOSO)(tipos_relaciones PRIMO)(tipos_relaciones TIO)(tipos_relaciones SOBRINO)(tipos_relaciones CUNIADO)(tipos_relaciones YERNO)(tipos_relaciones SUEGRO)(tipos_relaciones HIJAS)(tipos_relaciones MADRES)(tipos_relaciones ABUELAS)(tipos_relaciones NIETAS)(tipos_relaciones HERMANAS)(tipos_relaciones ESPOSAS)(tipos_relaciones PRIMAS)(tipos_relaciones TIAS)(tipos_relaciones SOBRINAS)(tipos_relaciones CUNIADAS)(tipos_relaciones NUERAS)(tipos_relaciones SUEGRAS)(tipos_relaciones HIJOS)(tipos_relaciones ABUELOS)(tipos_relaciones NIETOS)(tipos_relaciones HERMANOS)(tipos_relaciones ESPOSOS)(tipos_relaciones PRIMOS)(tipos_relaciones TIOS)(tipos_relaciones SOBRINOS)(tipos_relaciones CUNIADOS)(tipos_relaciones YERNOS)(tipos_relaciones SUEGROS)(tipos_relaciones PADRES)
  )

;;;;; Datos de la relación HIJO y ESPOSO en mi familia que es suficiente para el problema, pues el resto se deduce de estas

(deffacts relaciones
  (Relacion (tipo HIJO) (sujeto Uru) (objeto Mohatu)) ; "Uru es HIJ@ de Mohatu"
   (Relacion (tipo HIJO) (sujeto Mufasa) (objeto Uru))
   (Relacion (tipo HIJO) (sujeto Scar) (objeto Ahadi))
   (Relacion (tipo HIJO) (sujeto Mheetu) (objeto Ni))
   (Relacion (tipo HIJO) (sujeto Nala) (objeto Ni))
   (Relacion (tipo HIJO) (sujeto Simba) (objeto Mufasa))
   (Relacion (tipo HIJO) (sujeto Kopa) (objeto Simba))
   (Relacion (tipo HIJO) (sujeto Kiara) (objeto Simba))
   (Relacion (tipo HIJO) (sujeto Kovu) (objeto Scar))
   (Relacion (tipo HIJO) (sujeto Nuka) (objeto Scar))
   (Relacion (tipo HIJO) (sujeto Vitani) (objeto Scar))
   (Relacion (tipo HIJO) (sujeto Ahadi) (objeto Tojo))
   (Relacion (tipo HIJO) (sujeto Sarabi) (objeto Chumvi))
   (Relacion (tipo HIJO) (sujeto Zira) (objeto Boridi))

   (Relacion (tipo ESPOSO) (sujeto Mohatu) (objeto Asali)) ; "Mohatu es ESPOSO de Asali"
   (Relacion (tipo ESPOSO) (sujeto Ahadi) (objeto Uru)) 
   (Relacion (tipo ESPOSO) (sujeto Ni) (objeto Sarafina))
   (Relacion (tipo ESPOSO) (sujeto Mufasa) (objeto Sarabi))
   (Relacion (tipo ESPOSO) (sujeto Scar) (objeto Zira))
   (Relacion (tipo ESPOSO) (sujeto Kiara) (objeto Kovu))
   (Relacion (tipo ESPOSO) (sujeto Simba) (objeto Nala))
   (Relacion (tipo ESPOSO) (sujeto Tojo) (objeto Kula))
   (Relacion (tipo ESPOSO) (sujeto Chumvi) (objeto Tama))
   (Relacion (tipo ESPOSO) (sujeto Boridi) (objeto Chozi))
)

;;;;;;; Cada relación tiene una relación dual que se produce al cambiar entre si objeto y sujeto. Por ejemplo, Si x es HIJO de y, y es PADRE de x". Para poder deducirlo con una sola regla metemos esa información como hechos con la etiqueta dual, "Dual de HIJO PADRE", y así con todas las relaciones consideradas
 
(deffacts duales
(dual HIJO PADRE) (dual ABUELO NIETO) (dual HERMANO HERMANO) 
(dual ESPOSO ESPOSO) 
(dual PRIMO PRIMO) (dual TIO SOBRINO) 
(dual CUNIADO CUNIADO) 
(dual YERNO SUEGRO))


;;;;; Declaramos las relaciones indirectas de otra forma. Con busca_indirectos cuando introducimos el primer elemento por ejemplo HERMANO, obtenemos las relaciones que debemos buscar para encontrar este pariente, de forma que el segundo valor es la primera relación que buscamos del león, en este ejemplo PADRE, y el tercero sería la relación que buscaríamos de este sujeto encontrado, en este ejemplo el HIJO del PADRE.

(deffacts busca_indirectos 
(busca_indirectos  ABUELO PADRE PADRE) (busca_indirectos NIETO HIJO HIJO) (busca_indirectos  HERMANO PADRE HIJO)
(busca_indirectos  TIO PADRE HERMANO) (busca_indirectos PRIMO TIO HIJO) (busca_indirectos  SOBRINO HERMANO HIJO)
(busca_indirectos  CUNNIADO HERMANO ESPOSO) (busca_indirectos YERNO HIJO ESPOSO) (busca_indirectos  SUEGRO ESPOSO PADRE) 
)


;;;;;; Para deducir las reglas que se aplican son de composición, del tipo "el HERMANO del PADRE es un TIO". Por comodidad, en lugar de crear una regla por cada posible composición, metemos como hechos la relación que se obtiene por composición. Solo metemos unas cuantas composiciones que sean suficientes para deducir cualquier cosa

(deffacts compuestos
(comp HIJO HIJO NIETO) (comp PADRE PADRE ABUELO) (comp ESPOSO PADRE PADRE)(comp HERMANO PADRE TIO) (comp HERMANO ESPOSO CUNIADO) (comp ESPOSO HIJO YERNO) (comp ESPOSO HERMANO CUNIADO) (comp HIJO PADRE HERMANO) (comp ESPOSO CUNIADO CUNIADO) (comp ESPOSO TIO TIO)  (comp HIJO TIO PRIMO)  ) 


;;;;;; Para que cuando digamos por pantalla el parentesco lo expresemos correctamente, y puesto que el nombre que hemos puesto a cada relación es el caso masculino, vamos a meter como hechos como se diaria esa relación en femenino mediante la etiqueta femenino

(deffacts femenino
(femenino HIJO HIJA) (femenino PADRE MADRE) (femenino ABUELO ABUELA) (femenino NIETO NIETA) (femenino HERMANO HERMANA) (femenino ESPOSO ESPOSA) (femenino PRIMO PRIMA) (femenino TIO TIA) (femenino SOBRINO SOBRINA) (femenino CUNIADO CUNIADA) (femenino YERNO NUERA) (femenino SUEGRO SUEGRA)) 

;;;;; Al igual que el anterior, podremos cambiar la etiqueta de femenino a masculino, lo usamos porque todas las relaciones se declaran en un principio en masculino, por lo que, si la relación de entrada es femenina, podemos cambiarlo a su correspondiente masculino y realizar la búsqueda de la relación existente con la etiqueta en masculino
(deffacts masculino
(masculino HIJA HIJO)(masculino PADRE MADRE) (masculino ABUELA ABUELO) (masculino NIETA NIETO) (masculino HERMANA HERMANO) (masculino ESPOSA ESPOSO) (masculino PRIMA PRIMO) (masculino TIA TIO) (masculino SOBRINA SOBRINO) (masculino CUNIADA CUNIADO) (masculino NUERA YERNO) (masculino SUEGRA SUEGRO) )

;;;;; Declaramos un deffacts para poder cambiar las etiquetas del plural al singular. El igual que en el anterior, al estar declarado de una forma, en este caso, en singular, si nos entra una relación escrita en plural, cambiaremos esta etiqueta a su correspondiente singular y realizaremos el resto de operaciones con esta etiqueta
(deffacts cambiar_a_singular
(cambiar_a_singular HIJAS HIJA)(cambiar_a_singular MADRES MADRE) (cambiar_a_singular ABUELAS ABUELA) (cambiar_a_singular NIETAS NIETA) (cambiar_a_singular HERMANAS HERMANA) (cambiar_a_singular ESPOSAS ESPOSA) (cambiar_a_singular PRIMAS PRIMA) (cambiar_a_singular TIAS TIA) (cambiar_a_singular SOBRINAS SOBRINA) (cambiar_a_singular CUNIADAS CUNIADA) (cambiar_a_singular NUERAS NUERA) (cambiar_a_singular SUEGRAS SUEGRA) 
(cambiar_a_singular HIJOS HIJO)(cambiar_a_singular PADRES PADRE) (cambiar_a_singular ABUELOS ABUELO) (cambiar_a_singular NIETOS NIETO) (cambiar_a_singular HERMANOS HERMANO) (cambiar_a_singular ESPOSOS ESPOSO) (cambiar_a_singular PRIMOS PRIMO) (cambiar_a_singular TIOS TIO) (cambiar_a_singular SOBRINOS SOBRINO) (cambiar_a_singular CUNIADOS CUNIADO) (cambiar_a_singular NYERNOS YERNO) (cambiar_a_singular SUEGROS SUEGRA))

;;;;; REGLAS DEL SISTEMA ;;;;;

;;;; La dualidad es simétrica: si r es dual de t, t es dual de r. Por eso solo metimos como hecho la dualidad en unos sentidos, pues en el otro lo podíamos deducir con esta regla

(defrule autodualidad
      (dual ?r ?t)
=> 
   (assert (dual ?t ?r)))


;;;; Si  x es R de y, entonces y es dualdeR de x

(defrule dualidad
   (Relacion (tipo ?r) (sujeto ?x) (objeto ?y))
   (dual ?r ?t)
=> 
   (assert (Relacion (tipo ?t) (sujeto ?y) (objeto ?x))))


;;;; Si  y es R de x, y x es T de z entonces y es RoT de z
;;;; añadimos que z e y sean distintos para evitar que uno resulte hermano de si mismo y cosas asi.

(defrule composicion
   (Relacion (tipo ?r) (sujeto ?y) (objeto ?x))
   (Relacion (tipo ?t) (sujeto ?x) (objeto ?z))
   (comp ?r ?t ?u)
   (test (neq ?y ?z))
=> 
   (assert (Relacion (tipo ?u) (sujeto ?y) (objeto ?z))))

;;;;; Como puede deducir que tu hermano es tu cuñado al ser el esposo de tu cuñada, eliminamos los cuñados que sean hermanos

(defrule limpiacuniados
    (Relacion (tipo HERMANO) (sujeto ?x) (objeto ?y))
    ?f <- (Relacion (tipo CUNIADO) (sujeto ?x) (objeto ?y))
=>
	(retract ?f) )

;;;;; PREGUNTAS ;;;;;
;;;;; Solicitamos el nombre del león del cual queremos saber información y lo guardamos y añadimos ese hecho 
 
(defrule pregunta
(declare (salience 1000)) 
=>
   (printout t "Escribe el nombre del LEON/A del que quieras saber informacion: " crlf)
   (assert (leon (read))))
   
   
;;;;; Solicitamos el tipo de relación familiar que queremos saber acerca del león introducido
 
(defrule pregunta2
(declare (salience 100))
(leon ?primero)
=>
   (printout t "Escribe la relacion familiar de " ?primero " que quieres conocer (en mayusculas): " crlf)
   (assert (relacion (read))))



;;;;; Hacemos que nos diga por pantalla todos los familiares que tienen ese tipo de parentesco con el león indicado. 


;;;;; Primero hacemos una regla que nos devolverá los parientes masculinos (y sólo los masculinos)
(defrule regla_masculino

    (leon ?p)
    (relacion ?r)
    (Relacion_masculina ?r)
    (Relacion (tipo ?r) (sujeto ?o) (objeto ?p))
    (macho ?o)
     

 =>
   (assert (Encontrado))
   (printout t ?o " es " ?r " de " ?p crlf)
)
     

;;;;; Esta regla nos devolverá los femeninos
(defrule regla_femenino
    (leon ?p)
    (relacion ?r)
    (Relacion_femenina ?r)
    (masculino ?r ?t)
    (Relacion (tipo ?t) (sujeto ?o) (objeto ?p))
    (hembra ?o)
 
 =>
   (assert (Encontrado))
   (printout t ?o " es " ?r " de " ?p crlf)
     )
 
;;;;; Esta regla detecta si hemos introducido la relación en plural y masculino. La reconoce, la cambia a singular masculino y busca el pariente que tenga esa relación y lo muestra por pantalla

(defrule regla_masculino_plural
    (leon ?p)
    (relacion ?r)
    (plurales ?r)
    (cambiar_a_singular ?r ?s)
    (Relacion (tipo ?s) (sujeto ?o) (objeto ?p))
    (macho ?o)

 =>

    (assert (Encontrado))
    (printout t ?o " es " ?r " de " ?p crlf)
     )

;;;;; Esta regla detecta si hemos introducido la relación en plural y femenino. La reconoce, la cambia a singular femenino y busca el pariente que tenga esa relación y lo muestra por pantalla 

(defrule regla_femenino_plural
    (leon ?p)
    (relacion ?r)
    (plurales ?r)
    (cambiar_a_singular ?r ?s)
    (Relacion_femenina ?s)
    (masculino ?s ?t)
    (Relacion (tipo ?t) (sujeto ?o) (objeto ?p))
    (hembra ?o)
 
 =>

   (assert (Encontrado))
   (printout t ?o " es " ?r " de " ?p crlf)
     )



;;;;; Esta regla detecta las relaciones indirectas masculinas. Con busca_indirectos, sabe el tipo de parientes que tiene que buscar, por ejemplo, con HERMANO, sabe que tiene que buscar primero al PADRE del león indicado y luego al HIJO/S del padre encontrado, filtrando que no sea el mismo que hemos introducido. Una vez lo tenga creará la relación, en este ejemplo, será la relación HERMANO entre el HIJO del PADRE y el león que ya teníamos. 
(defrule relacion_indirecta_m
   (leon ?p)
   (relacion ?r)
   (indirectos ?r)
   (busca_indirectos ?r ?s ?t)
   (Relacion (tipo ?s) (sujeto ?x) (objeto ?p))
   (Relacion (tipo ?t) (sujeto ?o) (objeto ?x))
   (not(test(= ?o ?p)))

 
=> 
      
      (assert (Relacion (tipo ?r) (sujeto ?o) (objeto ?p)))
)

;;;;;Esta regla hace lo mismo que la anterior pero para los casos femeninos
(defrule relacion_indirecta_f
   (leon ?p)
   (relacion ?r)
   (indirectos_f ?r)
   (busca_indirectos ?r ?s ?t)
   (Relacion (tipo ?s) (sujeto ?x) (objeto ?p))
   (Relacion (tipo ?t) (sujeto ?o) (objeto ?x))
   (not(test(= ?o ?p)))

 
=> 
      
      (assert (Relacion (tipo ?r) (sujeto ?o) (objeto ?p)))
)


;;;;;Esta regla muestra un mensaje de error cuando introducimos mal el nombre del león del que queremos saber información y nos pide que volvamos a introducir el nombre
(defrule regla_error
    ?f<-(leon ?p)
    (not(macho ?p))
    (not (hembra ?p))
    (relacion ?r)
    (tipos_relaciones ?r)

=>

    (printout t "No existe ese leon. Vuelve a introducirlo" crlf)
    (retract ?f)
    (assert (leon (read)))
)


;;;;;Esta regla muestra un mensaje de error cuando introducimos mal el nombre de la relación familiar que queremos conocer, y nos pide que volvamos a introducir el tipo de relación
(defrule regla_error2
    ?f<-(relacion ?r)
    (not(Relacion_femenina ?r))
    (not (Relacion_masculina ?r))
    (not (plurales ?r))

=>
    (printout t "No existe esa relacion. Vuelve a intraoducirla " crlf)
    (retract ?f)
    (assert (relacion (read)))
)

;;;;;Esta regla muestra un mensaje cuando no existen parientes del león introducido con el tipo de relación que hemos indicado. Por ello hemos hecho (assert (Encontrado)) en las reglas anteriores, de esta forma comprobamos que no hay relaciones de ningún tipo y por ello nos muestra el mensaje de que no existe ese pariente
(defrule regla_error3
     (not(Encontrado))
=>
     (printout t "No existe ese pariente " crlf)
)
