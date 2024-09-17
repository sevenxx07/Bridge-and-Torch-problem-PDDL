;Header and description

(define (domain bat)

;remove requirements that are not needed
(:requirements 
    :strips
    :typing 
    :action-costs
) 

(:types 
    guy island - object
)

; un-comment following line if constants are needed
;(:constants )

(:predicates
    (at ?guy - guy ?location - island)
    (has-torch ?guy - guy)
    (connected ?from - island ?to - island)
    (greater ?guy1 - guy ?guy2 - guy)
)


(:functions
    (guy-cost ?c - guy) - number
    (total-cost) - number
)

;define actions here
(:action cross
    :parameters (?guy1 ?guy2 - guy ?from ?to - island)
    :precondition (and 
        (at ?guy1 ?from) 
        (at ?guy2 ?from)
        (connected ?from ?to)
        (or (has-torch ?guy1)
            (has-torch ?guy2))
        (greater ?guy1 ?guy2))
        
    :effect (and 
        (not (at ?guy1 ?from))
        (not (at ?guy2 ?from))
        (at ?guy1 ?to)
        (at ?guy2 ?to)
        (increase (total-cost) (guy-cost ?guy1))
        )
)

(:action giveTorch
    :parameters (?giver ?receiver - guy ?location - island)
    :precondition (and 
        (at ?giver ?location)
        (at ?receiver ?location)
        (has-torch ?giver)
        (not (has-torch ?receiver)))
    :effect (and 
        (has-torch ?receiver)
        (not(has-torch ?giver)))
)

)