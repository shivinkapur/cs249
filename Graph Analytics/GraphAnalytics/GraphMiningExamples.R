
pdf("GraphMiningExamples.pdf", 8, 8)
opar = par(ask=TRUE, mar=c(2,1,1,1))

library(igraph)
library(igraphdata)

data(karate)
G = karate
E(G)$id = 1:ecount(G)

E(G)$width = 1
E(G)$color = "gray"

V(G)$size   = 13
V(G)$color  = "cyan"
V(G)$frame.color = "cyan"
V(G)$label.color = "blue"
V(G)$label.cex   = 0.75
V(G)$label.side  = 0.5
V(G)$family = "Helvetica"

V(G)$label.cex   = 0.25 + degree(G)/max(degree(G)) * 1.75

Glayout = layout.grid(G) # impossible to see much
Glayout = layout.circle(G) # impossible to see much
Glayout = layout.mds(G)  # terrible
Glayout = layout.kamada.kawai(G)  # better, but not great
Glayout = layout.fruchterman.reingold(G)

plot(G, layout=Glayout)
title(main="Zachary karate club", cex.main=0.75)


L = graph.laplacian(G)
E = eigen(L)
round(E$values, 2)

S = get.stochastic(G)

n = vcount(G)

#---------------------------------------------------------------------------------------------
# HITS (authorities)
#---------------------------------------------------------------------------------------------

authorities = authority.score(G)$vector
round( authorities, 2 )

plot( authorities, main="authority scores", type="b", pch=20, col="red", cex.main=0.75 )
text( 1:n, authorities, paste(1:n), pos=4, col="blue", cex=0.5 )

#---------------------------------------------------------------------------------------------
# PageRank
#---------------------------------------------------------------------------------------------

rankings = page.rank(G)$vector
round( rankings, 2 )

plot( rankings, main="page rank scores", type="b", pch=20, col="red", cex.main=0.75 )
text( 1:n, rankings, paste(1:n), pos=4, col="blue", cex=0.5 )

#---------------------------------------------------------------------------------------------
# Betweenness
#---------------------------------------------------------------------------------------------

betweens = betweenness(G)
round( betweens, 2 )

plot( betweens, main="betweenness scores", type="b", pch=20, col="red", cex.main=0.75 )
text( 1:n, betweens, paste(1:n), pos=4, col="blue", cex=0.5 )

degrees = degree(G)
degrees

#---------------------------------------------------------------------------------------------
# Closeness
#---------------------------------------------------------------------------------------------

close = closeness(G, normalized=TRUE)
round( close, 2 )

plot( close, main="closeness scores", type="b", pch=20, col="red", cex.main=0.75 )
text( 1:n, close, paste(1:n), pos=4, col="blue", cex=0.5 )

degrees = degree(G)
degrees

#---------------------------------------------------------------------------------------------
# graph diameter
#---------------------------------------------------------------------------------------------

diameter.path.nodes = get.diameter(G)

V(G)[ diameter.path.nodes ]$label.color = "black"
V(G)[ diameter.path.nodes ]$color = "red"
V(G)[ diameter.path.nodes ]$frame.color = "red"

plot(G, layout=Glayout)
title(main="diameter (longest path) nodes", cex.main=0.75)

V(G)$color  = "cyan"
V(G)$frame.color = "cyan"

#---------------------------------------------------------------------------------------------
# eigenvector centrality
#---------------------------------------------------------------------------------------------

centralities = evcent(G)$vector
round( centralities, 2 )

plot( centralities, main="eigenvector centrality scores", type="b", pch=20, col="red", cex.main=0.75 )

#---------------------------------------------------------------------------------------------
# leading eigenvector communities
#---------------------------------------------------------------------------------------------

Vcommunity = leading.eigenvector.community(G)

palette( topo.colors(max(Vcommunity$membership)) )
palette( rainbow(10) )

V(G)$color       = Vcommunity$membership
V(G)$frame.color = Vcommunity$membership

plot(G, layout=Glayout)
title(main="leading eigenvector communities", cex.main=0.75)

V(G)$color  = "cyan"
V(G)$frame.color = "cyan"

#---------------------------------------------------------------------------------------------
# optimal communities
#---------------------------------------------------------------------------------------------

OPTcommunity = optimal.community(G)

V(G)$color       = OPTcommunity$membership
V(G)$frame.color = OPTcommunity$membership

plot(G, layout=Glayout)
title(main="optimal communities", cex.main=0.75)

V(G)$color  = "cyan"
V(G)$frame.color = "cyan"

Gmodularity = modularity(OPTcommunity)
Gmodularity

compare( Vcommunity, OPTcommunity )

#---------------------------------------------------------------------------------------------
# biconnected components
#---------------------------------------------------------------------------------------------

bicomp = biconnected.components(G)

for (i in 1:bicomp$no) {
   E(G)[bicomp$component_edges[[i]]]$color = i
}

plot(G, layout=Glayout)
title(main="biconnected components", cex.main=0.75)
E(G)$color  = "cyan"

#---------------------------------------------------------------------------------------------
# cocitation similarity
#---------------------------------------------------------------------------------------------

cocitation.similarities = cocitation(G)

heatmap( cocitation.similarities, symm=TRUE, main="Cocitation similarity", cexRow=0.5, cexCol=0.5)

#---------------------------------------------------------------------------------------------
# Jaccard similarity
#---------------------------------------------------------------------------------------------

jaccard.similarities = similarity.jaccard(G)

heatmap( jaccard.similarities, symm=TRUE, main="Jaccard similarity", cexRow=0.5, cexCol=0.5)


par(opar)
dev.off()


#   pdf("GraphMiningExamples.pdf", 8, 8)
#   opar = par(ask=TRUE, mar=c(2,1,1,1))
#   
#   library(igraph)
#   library(igraphdata)
#   
#   data(karate)
#   G = karate
#   E(G)$id = 1:ecount(G)
#   
#   E(G)$width = 1
#   E(G)$color = "gray"
#   
#   V(G)$size   = 13
#   V(G)$color  = "cyan"
#   V(G)$frame.color = "cyan"
#   V(G)$label.color = "blue"
#   V(G)$label.cex   = 0.75
#   V(G)$label.side  = 0.5
#   V(G)$family = "Helvetica"
#   
#   V(G)$label.cex   = 0.25 + degree(G)/max(degree(G)) * 1.75
#   
#   Glayout = layout.grid(G) # impossible to see much
#   Glayout = layout.circle(G) # impossible to see much
#   Glayout = layout.mds(G)  # terrible
#   Glayout = layout.kamada.kawai(G)  # better, but not great
#   Glayout = layout.fruchterman.reingold(G)
#   
#   plot(G, layout=Glayout)
#   Hit <Return> to see next plot: title(main="Zachary karate club", cex.main=0.75)
#   
#   
#   L = graph.laplacian(G)
#   E = eigen(L)
#   round(E$values, 2)
#    [1] 52.07 45.99 41.83 37.99 29.69 25.56 22.78 21.36 19.32 17.03 14.89 14.38
#   [13] 12.08 11.87 10.22 10.01  9.18  6.98  6.45  5.59  5.17  4.98  4.70  4.54
#   [25]  4.16  3.80  3.71  3.12  3.06  2.97  2.93  2.39  1.19  0.00
#   
#   S = get.stochastic(G)
#   
#   n = vcount(G)
#   
#   #---------------------------------------------------------------------------------------------
#   # HITS (authorities)
#   #---------------------------------------------------------------------------------------------
#   
#   authorities = authority.score(G)$vector
#   round( authorities, 2 )
#      Mr Hi  Actor 2  Actor 3  Actor 4  Actor 5  Actor 6  Actor 7  Actor 8 
#       0.86     0.83     0.99     0.55     0.15     0.19     0.18     0.49 
#    Actor 9 Actor 10 Actor 11 Actor 12 Actor 13 Actor 14 Actor 15 Actor 16 
#       0.68     0.14     0.13     0.12     0.11     0.66     0.22     0.31 
#   Actor 17 Actor 18 Actor 19 Actor 20 Actor 21 Actor 22 Actor 23 Actor 24 
#       0.05     0.12     0.13     0.20     0.17     0.16     0.22     0.60 
#   Actor 25 Actor 26 Actor 27 Actor 28 Actor 29 Actor 30 Actor 31 Actor 32 
#       0.14     0.34     0.16     0.41     0.24     0.37     0.43     0.58 
#   Actor 33   John A 
#       0.91     1.00 
#   
#   plot( authorities, main="authority scores", type="b", pch=20, col="red", cex.main=0.75 )
#   Hit <Return> to see next plot: text( 1:n, authorities, paste(1:n), pos=4, col="blue", cex=0.5 )
#   
#   #---------------------------------------------------------------------------------------------
#   # PageRank
#   #---------------------------------------------------------------------------------------------
#   
#   rankings = page.rank(G)$vector
#   round( rankings, 2 )
#      Mr Hi  Actor 2  Actor 3  Actor 4  Actor 5  Actor 6  Actor 7  Actor 8 
#       0.09     0.06     0.06     0.04     0.02     0.03     0.03     0.03 
#    Actor 9 Actor 10 Actor 11 Actor 12 Actor 13 Actor 14 Actor 15 Actor 16 
#       0.03     0.01     0.02     0.01     0.01     0.03     0.01     0.02 
#   Actor 17 Actor 18 Actor 19 Actor 20 Actor 21 Actor 22 Actor 23 Actor 24 
#       0.02     0.01     0.01     0.01     0.01     0.01     0.01     0.04 
#   Actor 25 Actor 26 Actor 27 Actor 28 Actor 29 Actor 30 Actor 31 Actor 32 
#       0.02     0.03     0.02     0.03     0.01     0.03     0.02     0.04 
#   Actor 33   John A 
#       0.08     0.10 
#   
#   plot( rankings, main="page rank scores", type="b", pch=20, col="red", cex.main=0.75 )
#   Hit <Return> to see next plot: text( 1:n, rankings, paste(1:n), pos=4, col="blue", cex=0.5 )
#   
#   #---------------------------------------------------------------------------------------------
#   # Betweenness
#   #---------------------------------------------------------------------------------------------
#   
#   betweens = betweenness(G)
#   round( betweens, 2 )
#      Mr Hi  Actor 2  Actor 3  Actor 4  Actor 5  Actor 6  Actor 7  Actor 8 
#     250.15    33.80    36.65     1.33     0.50    15.50    15.50     0.00 
#    Actor 9 Actor 10 Actor 11 Actor 12 Actor 13 Actor 14 Actor 15 Actor 16 
#      13.10     7.28     0.50     0.00     0.00     1.20     0.00     0.00 
#   Actor 17 Actor 18 Actor 19 Actor 20 Actor 21 Actor 22 Actor 23 Actor 24 
#       0.00    16.10     3.00   127.07     0.00     0.00     0.00     1.00 
#   Actor 25 Actor 26 Actor 27 Actor 28 Actor 29 Actor 30 Actor 31 Actor 32 
#      33.83     0.50     0.00     6.50    10.10     0.00     3.00    66.33 
#   Actor 33   John A 
#      38.13   209.50 
#   
#   plot( betweens, main="betweenness scores", type="b", pch=20, col="red", cex.main=0.75 )
#   Hit <Return> to see next plot: text( 1:n, betweens, paste(1:n), pos=4, col="blue", cex=0.5 )
#   
#   degrees = degree(G)
#   degrees
#      Mr Hi  Actor 2  Actor 3  Actor 4  Actor 5  Actor 6  Actor 7  Actor 8 
#         16        9       10        6        3        4        4        4 
#    Actor 9 Actor 10 Actor 11 Actor 12 Actor 13 Actor 14 Actor 15 Actor 16 
#          5        2        3        1        2        5        2        2 
#   Actor 17 Actor 18 Actor 19 Actor 20 Actor 21 Actor 22 Actor 23 Actor 24 
#          2        2        2        3        2        2        2        5 
#   Actor 25 Actor 26 Actor 27 Actor 28 Actor 29 Actor 30 Actor 31 Actor 32 
#          3        3        2        4        3        4        4        6 
#   Actor 33   John A 
#         12       17 
#   
#   #---------------------------------------------------------------------------------------------
#   # Closeness
#   #---------------------------------------------------------------------------------------------
#   
#   close = closeness(G, normalized=TRUE)
#   round( close, 2 )
#      Mr Hi  Actor 2  Actor 3  Actor 4  Actor 5  Actor 6  Actor 7  Actor 8 
#       0.25     0.20     0.20     0.18     0.15     0.15     0.15     0.18 
#    Actor 9 Actor 10 Actor 11 Actor 12 Actor 13 Actor 14 Actor 15 Actor 16 
#       0.20     0.19     0.18     0.15     0.20     0.19     0.17     0.14 
#   Actor 17 Actor 18 Actor 19 Actor 20 Actor 21 Actor 22 Actor 23 Actor 24 
#       0.11     0.19     0.19     0.25     0.20     0.18     0.16     0.14 
#   Actor 25 Actor 26 Actor 27 Actor 28 Actor 29 Actor 30 Actor 31 Actor 32 
#       0.16     0.12     0.17     0.16     0.20     0.17     0.17     0.21 
#   Actor 33   John A 
#       0.20     0.25 
#   
#   plot( close, main="closeness scores", type="b", pch=20, col="red", cex.main=0.75 )
#   Hit <Return> to see next plot: text( 1:n, close, paste(1:n), pos=4, col="blue", cex=0.5 )
#   
#   degrees = degree(G)
#   degrees
#      Mr Hi  Actor 2  Actor 3  Actor 4  Actor 5  Actor 6  Actor 7  Actor 8 
#         16        9       10        6        3        4        4        4 
#    Actor 9 Actor 10 Actor 11 Actor 12 Actor 13 Actor 14 Actor 15 Actor 16 
#          5        2        3        1        2        5        2        2 
#   Actor 17 Actor 18 Actor 19 Actor 20 Actor 21 Actor 22 Actor 23 Actor 24 
#          2        2        2        3        2        2        2        5 
#   Actor 25 Actor 26 Actor 27 Actor 28 Actor 29 Actor 30 Actor 31 Actor 32 
#          3        3        2        4        3        4        4        6 
#   Actor 33   John A 
#         12       17 
#   
#   #---------------------------------------------------------------------------------------------
#   # graph diameter
#   #---------------------------------------------------------------------------------------------
#   
#   diameter.path.nodes = get.diameter(G)
#   
#   V(G)[ diameter.path.nodes ]$label.color = "black"
#   V(G)[ diameter.path.nodes ]$color = "red"
#   V(G)[ diameter.path.nodes ]$frame.color = "red"
#   
#   plot(G, layout=Glayout)
#   Hit <Return> to see next plot: title(main="diameter (longest path) nodes", cex.main=0.75)
#   
#   V(G)$color  = "cyan"
#   V(G)$frame.color = "cyan"
#   
#   #---------------------------------------------------------------------------------------------
#   # eigenvector centrality
#   #---------------------------------------------------------------------------------------------
#   
#   centralities = evcent(G)$vector
#   round( centralities, 2 )
#      Mr Hi  Actor 2  Actor 3  Actor 4  Actor 5  Actor 6  Actor 7  Actor 8 
#       0.86     0.83     0.99     0.55     0.15     0.19     0.18     0.49 
#    Actor 9 Actor 10 Actor 11 Actor 12 Actor 13 Actor 14 Actor 15 Actor 16 
#       0.68     0.14     0.13     0.12     0.11     0.66     0.22     0.31 
#   Actor 17 Actor 18 Actor 19 Actor 20 Actor 21 Actor 22 Actor 23 Actor 24 
#       0.05     0.12     0.13     0.20     0.17     0.16     0.22     0.60 
#   Actor 25 Actor 26 Actor 27 Actor 28 Actor 29 Actor 30 Actor 31 Actor 32 
#       0.14     0.34     0.16     0.41     0.24     0.37     0.43     0.58 
#   Actor 33   John A 
#       0.91     1.00 
#   
#   plot( centralities, main="eigenvector centrality scores", type="b", pch=20, col="red", cex.main=0.75 )
#   Hit <Return> to see next plot: 
#   #---------------------------------------------------------------------------------------------
#   # leading eigenvector communities
#   #---------------------------------------------------------------------------------------------
#   
#   Vcommunity = leading.eigenvector.community(G)
#   
#   palette( topo.colors(max(Vcommunity$membership)) )
#   palette( rainbow(10) )
#   
#   V(G)$color       = Vcommunity$membership
#   V(G)$frame.color = Vcommunity$membership
#   
#   plot(G, layout=Glayout)
#   Hit <Return> to see next plot: title(main="leading eigenvector communities", cex.main=0.75)
#   
#   V(G)$color  = "cyan"
#   V(G)$frame.color = "cyan"
#   
#   #---------------------------------------------------------------------------------------------
#   # optimal communities
#   #---------------------------------------------------------------------------------------------
#   
#   OPTcommunity = optimal.community(G)
#   
#   V(G)$color       = OPTcommunity$membership
#   V(G)$frame.color = OPTcommunity$membership
#   
#   plot(G, layout=Glayout)
#   Hit <Return> to see next plot: title(main="optimal communities", cex.main=0.75)
#   
#   V(G)$color  = "cyan"
#   V(G)$frame.color = "cyan"
#   
#   Gmodularity = modularity(OPTcommunity)
#   Gmodularity
#   [1] 0.4449036
#   
#   compare( Vcommunity, OPTcommunity )
#   [1] 0.09855874
#   
#   #---------------------------------------------------------------------------------------------
#   # biconnected components
#   #---------------------------------------------------------------------------------------------
#   
#   bicomp = biconnected.components(G)
#   
#   for (i in 1:bicomp$no) {
#      E(G)[bicomp$component_edges[[i]]]$color = i
#   }
#   
#   plot(G, layout=Glayout)
#   Hit <Return> to see next plot: title(main="biconnected components", cex.main=0.75)
#   E(G)$color  = "cyan"
#   
#   #---------------------------------------------------------------------------------------------
#   # cocitation similarity
#   #---------------------------------------------------------------------------------------------
#   
#   cocitation.similarities = cocitation(G)
#   
#   heatmap( cocitation.similarities, symm=TRUE, main="Cocitation similarity", cexRow=0.5, cexCol=0.5)
#   Hit <Return> to see next plot: 
#   #---------------------------------------------------------------------------------------------
#   # Jaccard similarity
#   #---------------------------------------------------------------------------------------------
#   
#   jaccard.similarities = similarity.jaccard(G)
#   
#   heatmap( jaccard.similarities, symm=TRUE, main="Jaccard similarity", cexRow=0.5, cexCol=0.5)
#   Hit <Return> to see next plot: 
#   
#   par(opar)
#   dev.off()
#   null device 
#             1 
