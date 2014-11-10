library(igraph)

g = graph.famous("Petersen")

A = get.adjacency(g)
A

L = graph.laplacian(g)
L

Eigen = eigen(L)
Eigenvectors = Eigen$vectors

f = Eigenvectors[,2]
f

# Using the signs of entries in the Fiedler vector (2nd eigenvector),
# partition the graph into two parts:

which(f>=0)
which(f< 0)

A1 = A[f>=0, f>=0]
A1

A2 = A[f<0, f<0]
A2

#   library(igraph)
#   
#   g = graph.famous("Petersen")
#   
#   A = get.adjacency(g)
#   A
#   10 x 10 sparse Matrix of class "dgCMatrix"
#                            
#    [1,] . 1 . . 1 1 . . . .
#    [2,] 1 . 1 . . . 1 . . .
#    [3,] . 1 . 1 . . . 1 . .
#    [4,] . . 1 . 1 . . . 1 .
#    [5,] 1 . . 1 . . . . . 1
#    [6,] 1 . . . . . . 1 1 .
#    [7,] . 1 . . . . . . 1 1
#    [8,] . . 1 . . 1 . . . 1
#    [9,] . . . 1 . 1 1 . . .
#   [10,] . . . . 1 . 1 1 . .
#   
#   L = graph.laplacian(g)
#   L
#   10 x 10 sparse Matrix of class "dgCMatrix"
#                                      
#    [1,]  3 -1  .  . -1 -1  .  .  .  .
#    [2,] -1  3 -1  .  .  . -1  .  .  .
#    [3,]  . -1  3 -1  .  .  . -1  .  .
#    [4,]  .  . -1  3 -1  .  .  . -1  .
#    [5,] -1  .  . -1  3  .  .  .  . -1
#    [6,] -1  .  .  .  .  3  . -1 -1  .
#    [7,]  . -1  .  .  .  .  3  . -1 -1
#    [8,]  .  . -1  .  . -1  .  3  . -1
#    [9,]  .  .  . -1  . -1 -1  .  3  .
#   [10,]  .  .  .  . -1  . -1 -1  .  3
#   
#   Eigen = eigen(L)
#   Eigenvectors = Eigen$vectors
#   
#   f = Eigenvectors[,2]
#   f
#    [1]  0.00000000 -0.35536418  0.10463297  0.16837885  0.08235236  0.27301182
#    [7]  0.60609538 -0.02228061 -0.52374302 -0.33308356
#   
#   # Using the signs of entries in the Fiedler vector (2nd eigenvector),
#   # partition the graph into two parts:
#   
#   which(f>=0)
#   [1] 1 3 4 5 6 7
#   which(f< 0)
#   [1]  2  8  9 10
#   
#   A1 = A[f>=0, f>=0]
#   A1
#   6 x 6 sparse Matrix of class "dgCMatrix"
#                   
#   [1,] . . . 1 1 .
#   [2,] . . 1 . . .
#   [3,] . 1 . 1 . .
#   [4,] 1 . 1 . . .
#   [5,] 1 . . . . .
#   [6,] . . . . . .
#   
#   A2 = A[f<0, f<0]
#   A2
#   4 x 4 sparse Matrix of class "dgCMatrix"
#               
#   [1,] . . . .
#   [2,] . . . 1
#   [3,] . . . .
#   [4,] . 1 . .
