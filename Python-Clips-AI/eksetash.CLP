(deftemplate cell
	(slot number_of_cell)
	(slot status_of_cell)
)
(deftemplate pawn
	(slot number_of_cell)
	(slot color_of_pawn)
)
(deftemplate left
	(slot cell)
	(slot cellleft)
)

	
(deffacts cells
	(cell (number_of_cell 1)(status_of_cell E))
	(cell (number_of_cell 2)(status_of_cell E))
	(cell (number_of_cell 3)(status_of_cell NE))
	(cell (number_of_cell 4)(status_of_cell NE))
)

;edw vazw ta pionia

(deffacts pawn
	(pawn (number_of_cell 4)(color_of_pawn WHITE))
	(pawn (number_of_cell 3)(color_of_pawn BLACK))
)
(deffacts left
	(left (cell 4) (cellleft 3))
	(left (cell 3) (cellleft 2))
	(left (cell 2) (cellleft 1))
)

(defrule eat_pawn
	?one<-(pawn (number_of_cell ?x)(color_of_pawn BLACK))
	(left (cell ?x) (cellleft ?xnew))
	?two<-(cell (number_of_cell ?xnew)(status_of_cell NE))
	?three<-(pawn (number_of_cell ?xnew)(color_of_pawn WHITE))
	?four<-(cell (number_of_cell ?x)(status_of_cell NE))
=>
	(modify ?one (number_of_cell ?xnew))
	(modify ?four (number_of_cell ?x)(status_of_cell E))
	(retract ?three)
)
(defrule goal
	(not(pawn(number_of_cell ?x)(color_of_pawn WHITE)))
=>
	(printout t "Goal found! There are no white pawns!" ctrlf)
)
;(defrule goal_not_found
;	(pawn(number_of_cell ?x)(color_of_pawn WHITE))
;=>
;	(printout t "Goal not found!There are white pawns that can't be eaten"ctrlf)
;)
	