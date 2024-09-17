# Definition of problem 
We generalize the Bridge and Torch problem a bit. We consider a set of islands I that might be connected by bridges. 
Each bridge is of the same length for simplicity. Further, we have a set of guys G. Each of them has a crossing speed, 
i.e., a time he/she needs to cross a bridge. In the initial state, the guys are located on given islands. 
Our goal is to get all the guys to the final locations as quickly as possible. Further, there are several torches, 
each held by a guy. As before, a torch might be passed from one guy to another, but each guy can hold at most one torch. 
The rules for the crossing are the same as above, i.e., at most, two guys can cross a bridge at the same time, moving 
according to the slower one, and one holds a torch. We must introduce one more rule. In general, the guys could cross the 
bridges in parallel to optimize the time needed to get the guys to their final destinations. However, that would not be 
easy to model in PDDL. Thus, assume that the guys cannot cross bridges in parallel. If one or two guys cross a bridge, the remaining guys wait until they finish the crossing. 

# Domain
 Terms:<br />
 * guy, island: representing guys and locations in the domain.<br />
 
 Predicates:<br />
 * at(guy,island): represents if guy is on specific island
 * hasTorch(guy): represents if guy has a torch
 * connected(from,to): represents the connection between two islands
 * greater(guy1,guy2): represents inequality between crossing speed of two
 guys<br />
 
 Functions:<br />
 * guyCost(guy): represents crossing speed of a guy
 * totalCost: represents metric we want to minimise<br />
 
 Actions:<br />
 * cross
      1. parameters: guy1, guy2, from, to
      2. precondition: at(guy1, from) ∧ at(guy2,from) ∧ connected(from,
 to) ∧ (hasTorch(guy1) ∨ hasTorch(guy2)) ∧ greater(guy1, guy2)
      3. effect: ¬at(guy1,from)∧ ¬at(guy2,from)∧ at(guy1, to) ∧ at(guy2,
 to)
 * in action cross we also increase totalCost by guyCost(guy1)
 * giveTorch
      1. parameters: giver, receiver, location
      2. precondition: at(giver, location) ∧ at(receiver, location) ∧ hasTorch(giver)
 ∧ ¬hasTorch(reciever)
      3. effect: hasTorch(receiver) ∧ ¬hasTorch(giver)
