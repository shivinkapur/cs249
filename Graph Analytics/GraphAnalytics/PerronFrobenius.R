library(igraph)
library(igraphdata)

G = erdos.renyi.game(10, 0.4)

A = get.adjacency(G)
A

L = graph.laplacian(G)
L

D = diag(diag(data.matrix(L)))
Walk = solve(D) %*% A
Walk

apply(Walk, 1, sum)  # Walk is a stochastic matrix, all row sums should be 1

E = eigen(Walk)

Should_be_one = E$values[1]
Should_be_one

first_eigenvector = E$vectors[,1]
if (first_eigenvector[1] < 0) first_eigenvector = -first_eigenvector
Should_be_nonnegative = first_eigenvector
Should_be_nonnegative
min(Should_be_nonnegative>=0)

Wsvd = svd(Walk)
left_first_eigenvector  = Wsvd$u[,1]
left_first_eigenvector
right_first_eigenvector = Wsvd$v[,1]
right_first_eigenvector

if (left_first_eigenvector[1]  < 0) left_first_eigenvector  = -left_first_eigenvector
if (right_first_eigenvector[1] < 0) right_first_eigenvector = -right_first_eigenvector
Should_be_nonnegative = left_first_eigenvector
Should_be_nonnegative
Should_be_nonnegative = right_first_eigenvector
Should_be_nonnegative

pagerank = page.rank(G)$vector
pagerank = pagerank/sum(pagerank^2)
pagerank

authority = authority.score(G)$vector
authority = authority/sum(authority^2)
authority

hub = hub.score(G)$vector
hub = hub/sum(hub^2)
hub


#   library(igraph)
#   library(igraphdata)
#   
#   G = erdos.renyi.game(10, 0.4)
#   
#   A = get.adjacency(G)
#   A
#   10 x 10 sparse Matrix of class "dgCMatrix"
#                            
#    [1,] . 1 1 . . 1 1 . . .
#    [2,] 1 . 1 1 1 . 1 1 . 1
#    [3,] 1 1 . 1 . 1 . 1 . .
#    [4,] . 1 1 . . . . 1 1 .
#    [5,] . 1 . . . 1 1 . . 1
#    [6,] 1 . 1 . 1 . . 1 . 1
#    [7,] 1 1 . . 1 . . . 1 .
#    [8,] . 1 1 1 . 1 . . . 1
#    [9,] . . . 1 . . 1 . . .
#   [10,] . 1 . . 1 1 . 1 . .
#   
#   L = graph.laplacian(G)
#   L
#   10 x 10 sparse Matrix of class "dgCMatrix"
#                                      
#    [1,]  4 -1 -1  .  . -1 -1  .  .  .
#    [2,] -1  7 -1 -1 -1  . -1 -1  . -1
#    [3,] -1 -1  5 -1  . -1  . -1  .  .
#    [4,]  . -1 -1  4  .  .  . -1 -1  .
#    [5,]  . -1  .  .  4 -1 -1  .  . -1
#    [6,] -1  . -1  . -1  5  . -1  . -1
#    [7,] -1 -1  .  . -1  .  4  . -1  .
#    [8,]  . -1 -1 -1  . -1  .  5  . -1
#    [9,]  .  .  . -1  .  . -1  .  2  .
#   [10,]  . -1  .  . -1 -1  . -1  .  4
#   
#   D = diag(diag(data.matrix(L)))
#   Walk = solve(D) %*% A
#   Walk
#   10 x 10 Matrix of class "dgeMatrix"
#              [,1] [,2]      [,3]      [,4]      [,5] [,6]      [,7]      [,8]
#    [1,] 0.0000000 0.25 0.2500000 0.0000000 0.0000000 0.25 0.2500000 0.0000000
#    [2,] 0.1428571 0.00 0.1428571 0.1428571 0.1428571 0.00 0.1428571 0.1428571
#    [3,] 0.2000000 0.20 0.0000000 0.2000000 0.0000000 0.20 0.0000000 0.2000000
#    [4,] 0.0000000 0.25 0.2500000 0.0000000 0.0000000 0.00 0.0000000 0.2500000
#    [5,] 0.0000000 0.25 0.0000000 0.0000000 0.0000000 0.25 0.2500000 0.0000000
#    [6,] 0.2000000 0.00 0.2000000 0.0000000 0.2000000 0.00 0.0000000 0.2000000
#    [7,] 0.2500000 0.25 0.0000000 0.0000000 0.2500000 0.00 0.0000000 0.0000000
#    [8,] 0.0000000 0.20 0.2000000 0.2000000 0.0000000 0.20 0.0000000 0.0000000
#    [9,] 0.0000000 0.00 0.0000000 0.5000000 0.0000000 0.00 0.5000000 0.0000000
#   [10,] 0.0000000 0.25 0.0000000 0.0000000 0.2500000 0.25 0.0000000 0.2500000
#         [,9]     [,10]
#    [1,] 0.00 0.0000000
#    [2,] 0.00 0.1428571
#    [3,] 0.00 0.0000000
#    [4,] 0.25 0.0000000
#    [5,] 0.00 0.2500000
#    [6,] 0.00 0.2000000
#    [7,] 0.25 0.0000000
#    [8,] 0.00 0.2000000
#    [9,] 0.00 0.0000000
#   [10,] 0.00 0.0000000
#   
#   apply(Walk, 1, sum)  # Walk is a stochastic matrix, all row sums should be 1
#    [1] 1 1 1 1 1 1 1 1 1 1
#   
#   E = eigen(Walk)
#   
#   Should_be_one = E$values[1]
#   Should_be_one
#   [1] 1
#   
#   first_eigenvector = E$vectors[,1]
#   if (first_eigenvector[1] < 0) first_eigenvector = -first_eigenvector
#   Should_be_nonnegative = first_eigenvector
#   Should_be_nonnegative
#    [1] 0.3162278 0.3162278 0.3162278 0.3162278 0.3162278 0.3162278 0.3162278
#    [8] 0.3162278 0.3162278 0.3162278
#   min(Should_be_nonnegative>=0)
#   [1] 1
#   
#   Wsvd = svd(Walk)
#   left_first_eigenvector  = Wsvd$u[,1]
#   left_first_eigenvector
#    [1] -0.3758814 -0.2671127 -0.3291505 -0.2994664 -0.3578012 -0.2425428
#    [7] -0.2580512 -0.3358448 -0.3285376 -0.3393758
#   right_first_eigenvector = Wsvd$v[,1]
#   right_first_eigenvector
#    [1] -0.2071274 -0.5160214 -0.3079784 -0.3201510 -0.2252754 -0.3829895
#    [7] -0.3682763 -0.2979897 -0.1330319 -0.2322071
#   
#   if (left_first_eigenvector[1]  < 0) left_first_eigenvector  = -left_first_eigenvector
#   if (right_first_eigenvector[1] < 0) right_first_eigenvector = -right_first_eigenvector
#   
#   Should_be_nonnegative = left_first_eigenvector
#   Should_be_nonnegative
#    [1] 0.3758814 0.2671127 0.3291505 0.2994664 0.3578012 0.2425428 0.2580512
#    [8] 0.3358448 0.3285376 0.3393758
#   
#   Should_be_nonnegative = right_first_eigenvector
#   Should_be_nonnegative
#    [1] 0.2071274 0.5160214 0.3079784 0.3201510 0.2252754 0.3829895 0.3682763
#    [8] 0.2979897 0.1330319 0.2322071
#   
#   pagerank = page.rank(G)$vector
#   pagerank = pagerank/sum(pagerank^2)
#   pagerank
#    [1] 0.8667317 1.4340607 1.0478315 0.8964710 0.8709748 1.0502423 0.9097333
#    [8] 1.0462879 0.5264232 0.8582331
#   
#   authority = authority.score(G)$vector
#   authority = authority/sum(authority^2)
#   authority
#    [1] 0.13415581 0.20435224 0.16580569 0.12392376 0.12835414 0.15506139
#    [7] 0.10915473 0.16654162 0.04929085 0.13837168
#   
#   hub = hub.score(G)$vector
#   hub = hub/sum(hub^2)
#   hub
#    [1] 0.13415581 0.20435224 0.16580569 0.12392376 0.12835414 0.15506139
#    [7] 0.10915473 0.16654162 0.04929085 0.13837168
#   
