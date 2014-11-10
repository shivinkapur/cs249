pdf("BigData100.pdf", 8,8)

# CompanyNames x Buzzwords
opar = par(mar=c(1,1,1,1))

BigData100 = read.csv("BigData100.csv", header=TRUE, as.is=TRUE)

p = dim(BigData100)[2]

CompanyNames = BigData100[,1]
Buzzwords = colnames(BigData100[,2:p])

Data = data.matrix(BigData100[,2:p])
rownames(Data) = CompanyNames
colnames(Data) = Buzzwords

Data = Data[  apply(Data,1,sum) > 3, ]  # throw away rows with few column values
Data = Data[, apply(Data,2,sum) > 3  ]  # throw away columns with few row values
Data = Data[  apply(Data,1,sum) > 3, ]  # throw away rows with few column values
Data = Data[, apply(Data,2,sum) > 3  ]  # throw away columns with few row values


n1 = dim(Data)[1]  # number of companies
n2 = dim(Data)[2]  # number of buzzwords
n = n1 + n2

AdjacencyMatrix = matrix(0, n, n)
AdjacencyMatrix[1:n1, n1+(1:n2)] = Data

names


library(igraph)

G = graph.adjacency( AdjacencyMatrix, mode="undirected" )

V(G)$size  = 5 # small nodes
V(G)$shape = c( rep("circle",n1), rep("square",n2) )
V(G)$color = c( rep("cyan",n1), rep("green",n2) )
V(G)$frame.color = V(G)$color # border around each node
V(G)$label = c( rownames(Data), colnames(Data) )
V(G)$label.color = "blue"
V(G)$label.cex = 0.40  # small labels
V(G)$label.family = "Helvetica"
V(G)$label.dist = 0.75  # put label beside the vertex
V(G)$label.degree = 0   # put label to the right
V(G)$label.degree = c( rep(0,n1), rep(pi,n2) )

E(G)$color = "gray"
E(G)$width = 1
E(G)$id = 1:ecount(G)
# E(G)$curved = TRUE

# diameter.path.nodes = get.diameter(G)
# V(G)[ diameter.path.nodes ]$label.color = "black"
# V(G)[ diameter.path.nodes ]$color = "red"

MST = minimum.spanning.tree(G)

E(G)$color[E(MST)$id] = "red"
E(G)$width[E(MST)$id] = 2

# plot(G, layout=layout.kamada.kawai, vertex.label.dist=0, vertex.size=7)
plot(G, layout=layout.kamada.kawai)
title(main="Graph of the Big Data 100", sub="red edges = MST")

par(opar)

dev.off()
