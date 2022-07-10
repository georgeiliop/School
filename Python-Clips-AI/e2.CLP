(deftemplate space
    (slot name)
    (slot state)
)

(deftemplate platform
    (slot name  )
    (slot space )
    (slot state )
)

(deftemplate car
   (slot number)
   (slot state)
)

(deffacts spaces 
    (space (name S1) (state NE))
    (space (name S2) (state E))
    (space (name S3) (state NE))
    (space (name S4) (state NE))
    (space (name S5) (state NE))
    (space (name S6) (state NE))
)

(deffacts platforms
    (platform (name P1) (space S1) (state E)) 
    (platform (name P2) (space S3) (state E)) 
    (platform (name P3) (space S4) (state E)) 
    (platform (name P4) (space S5) (state E)) 
    (platform (name P5) (space S6) (state E)) 
    
)
(deffacts cars
   (car (number 01) (state waiting))
   (car (number 02) (state waiting))
   (car (number 03) (state waiting))
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








(defrule move_east
    ?x <- (space (name ?s) (state NE))
    ?z <- (platform (name ?p) (space ?s)(state ?v))
    (east ?s ?snew)
    ?y <- (space (name ?snew) (state E))
=>
    (modify ?x (state E))
    (modify ?y (state NE))
    (modify ?z (space ?snew))
)


(defrule move_north
    ?x <- (space (name ?s) (state NE))
    ?z <- (platform (name ?p) (space ?s)(state ?v))
    (north ?s ?snew)
    ?y <- (space (name ?snew) (state E))
=>
    (modify ?x (state E))
    (modify ?y (state NE))
    (modify ?z (space ?snew))
)


(defrule move_west
    ?x <- (space (name ?s) (state NE))
    ?z <- (platform (name ?p) (space ?s)(state ?v))
    (east ?snew ?s)
    ?y <- (space (name ?snew) (state E))
=>
    (modify ?x (state E))
    (modify ?y (state NE))
    (modify ?z (space ?snew))
)


(defrule move_south
    ?x <- (space (name ?s) (state NE))
    ?z <- (platform (name ?p) (space ?s)(state ?v))
    (north ?snew ?s)
    ?y <- (space (name ?snew) (state E))
=>
    (modify ?x (state E))
    (modify ?y (state NE))
    (modify ?z (space ?snew))
)


(defrule enter
   ?x <-(car (number ?z) (state waiting)) 
   (space (name S2) (state NE))
   ?y <- (platform (name ?s) (space S2) (state E))
=>
  (modify ?y (state NE))
  (modify ?x (state parked))
)

(defrule goal_found
    (car(state parked))
    (test (>= (length$ (find-all-facts ((?l car)) (eq ?l:state parked))) (length$ (find-all-facts ((?l car)) ))))
    ;(test (>= (length$ (find-all-facts ((?l car)) (eq ?l:state parked))) 3))
    
=>
   (printout t "Goal Found" crlf)
   (halt)
)



