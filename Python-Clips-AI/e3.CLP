(deftemplate space
    (slot name)
    (slot state)
    (slot platform)
)

(deftemplate platform
    (slot name  )
    (slot space )
    (slot state )
)

(deftemplate car
   (slot number)
   (slot state)
   (slot plat)
)

(deffacts spaces 
    (space (name S1) (state NE)(platform P1))
    (space (name S2) (state E)(platform E))
    (space (name S3) (state NE)(platform P2))
    (space (name S4) (state NE)(platform P3))
    (space (name S5) (state NE)(platform P4))
    (space (name S6) (state NE)(platform P5))
)

(deffacts platforms
    (platform (name P1) (space S1) (state E)) 
    (platform (name P2) (space S3) (state E)) 
    (platform (name P3) (space S4) (state E)) 
    (platform (name P4) (space S5) (state E)) 
    (platform (name P5) (space S6) (state E)) 
    
)
(deffacts cars
   ;(car (number 01) (state waiting))
   ;(car (number 02) (state waiting))
   ;(car (number 03) (state waiting))
)

(deffacts east
    (east S1 S2)
    (east S4 S5)
    (east S2 S3)
    (east S5 S6)
    
)
(deffacts north
    (north S1 S4)
    (north S2 S5)
    (north S3 S6)
)
(deffacts rule
   (rule begin)
)


(defrule move_east
    ?x <- (space (name ?s)(state NE))
    ?z <- (platform (name ?p) (space ?s)(state ?v))
    (east ?s ?snew)
    ?y <- (space (name ?snew) (state E)(platform E))
=>
    (modify ?x (state E)(platform E))
    (modify ?y (state NE)(platform ?p))
    (modify ?z (space ?snew))
)


(defrule move_north
    ?x <- (space (name ?s) (state NE))
    ?z <- (platform (name ?p) (space ?s)(state ?v))
    (north ?s ?snew)
    ?y <- (space (name ?snew) (state E)(platform E))
=>
    (modify ?x (state E)(platform E))
    (modify ?y (state NE)(platform ?p))
    (modify ?z (space ?snew))
)


(defrule move_west
    ?x <- (space (name ?s) (state NE))
    ?z <- (platform (name ?p) (space ?s)(state ?v))
    (east ?snew ?s)
    ?y <- (space (name ?snew) (state E)(platform E))
=>
    (modify ?x (state E)(platform E))
    (modify ?y (state NE)(platform ?p))
    (modify ?z (space ?snew))
)


(defrule move_south
    ?x <- (space (name ?s) (state NE))
    ?z <- (platform (name ?p) (space ?s)(state ?v))
    (north ?snew ?s)
    ?y <- (space (name ?snew) (state E)(platform E))
=>
    (modify ?x (state E)(platform E))
    (modify ?y (state NE)(platform ?p))
    (modify ?z (space ?snew))
)


(defrule enter
(declare (salience 40))
   ?x <-(car (state waiting))
   ?y <- (platform (name ?s)(space S2)(state E))
=>
  (modify ?y (state NE))
  (modify ?x (state parked)(plat ?s))
)

(defrule depart
   ?x<-(car (number ?z) (state leaving))
   ?c<-(car (number ?z)(plat ?s))
   ?y<-(platform (name ?s) (space S2) (state NE))
=>
   (modify ?y (state E))
   (retract ?c)
   (retract ?x)
)

(defrule goal_found
   (declare (salience 35))
   ; (car(state parked))
   ;(test (>= (length$ (find-all-facts ((?l car)) (eq ?l:state parked))) (length$ (find-all-facts ((?l           car)) ))))
   (not(car(state waiting)))
   ?x<-(rule insert)
   
=>
   (printout t "Goal Found" crlf)
   ;(halt)
   ;(printout t “All cars parked” crlf)
   (retract ?x)
   (assert (rule options))
)
(defrule begin
   (declare (salience 50))
   (initial-fact)
   ?x<-(rule begin)
=>
   (set-strategy random)
   (retract ?x)
   (assert (rule insert))
)

(defrule options
  (declare (salience 45))
	?x<-(rule options)
=>
	(printout t "Give 1 to insert or 2 to remove a car , if you want to exit give 3" crlf)
	(bind ?option(read))
	(while (not (integerp ?option))
		(printout t "Give 1 to insert , 2 to remove , if you want to exit give 3" crlf)			(bind ?option(read))
	)
	(if (= ?option 3) then (halt)
	else
		(if(= ?option 1)  then
			(retract ?x)
			(assert (rule insert))
		else
			(retract ?x)
			(assert (rule remove))
		)
	)
)


(defrule insert
    (declare (salience 40))
    ?x<-(rule insert)
=>
	(printout t "How many cars you want to insert?To exit give 0" crlf)
	(bind ?cars(read))
	(while (not (integerp ?cars))
		(printout t "How many cars you want to insert?To exit give 0" crlf)
		(bind ?cars(read))
	)
	(if (= ?cars 0) then (printout t "Halting" crlf)(halt)
	else
		(if(> ?cars 0)  then
			(while (> ?cars 0)
				(printout t "Give car number" crlf)
				(bind ?number (read))
				(assert(car (number ?number)(state waiting)(plat E)))
				(bind ?cars (- ?cars 1))
			)		
		)
	)
)


(defrule remove
    (declare (salience 40))
    ?x<-(rule remove)
=>
   (printout t "How many cars you want to remove?Give 0 to exit" crlf)
   (bind ?cars(read))
   (while (not (integerp ?cars))
   	  (printout t "How many cars you want to remove?Give 0 to exit" crlf)
	  (bind ?cars(read))
    )
    (if (= ?cars 0) then (halt)
    else
	   (if(> ?cars 0)  then
		 (while (> ?cars 0)
			 (printout t "Give car number" crlf)
			 (bind ?number (read))
			 (assert(car (number ?number)(state leaving )))
			 (bind ?cars (- ?cars 1))
			 	
    		  )		
    	    )
     )
 )


