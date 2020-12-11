### Control-flow graph:
Plain and straight-forward
### Data-dependency graph:
vertice : each stmt in the function
edge : v1->v2 means value defined by v1 is used in v2
### Control-dependency graph:
vertice: each stmt in the fucntion
edge: v1->v2, if in the control-flow graph, there is a path from v1 to v2 that doesn't contain the **immediate post dominator of v1**. Then v2 is said to be control dependent on v1.
#### Domination
if every path from the entry to v2 all go through v1, then v1 dominates v2
if all path from v2 to the end of the function all go through v1, then v1 post-dominates v2.
immediate dominate: the closest (post) dominator.
The relation of immediate (post) dominator is represented in the (post) dominator graph
### Program dependency graph:
                 CFG
                / | \
Data-dependency G |  Post-dominance graph
     \            |  /
      \   Control-dependency graph
       \          |
       Program dependency graph
