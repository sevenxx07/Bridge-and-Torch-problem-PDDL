(define (problem 01) (:domain bat)
(:objects a b c d - guy l r - island)

(:init
    (at a l)
    (at b l)
    (at c l)
    (at d l)
    (has-torch a)
    (connected l r)
    (connected r l)
    (greater d a) (greater d c) (greater d b) (greater d a) (greater d d)
    (greater c b) (greater c a) (greater c c)
    (greater b a) (greater b b)
    (greater a a)
    (= (guy-cost a) 1)
    (= (guy-cost b) 2)
    (= (guy-cost c) 5)
    (= (guy-cost d) 8)
)

(:goal (and
    (at a r) (at b r) (at c r) (at d r)
))

;un-comment the following line if metric is needed
(:metric minimize (total-cost))
)
