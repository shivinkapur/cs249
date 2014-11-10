pdf("DiseaseNetwork.pdf", 8, 8)
opar = par(ask=TRUE, mar=c(1,1,3,1))

### if you do not already have these packages installed, please install them:
# install.packages("lattice")
# install.packages("Matrix")

disease = read.csv("DiseaseNetwork.csv", header=TRUE)
interaction = data.matrix(read.csv("GeneInteraction.csv", header=TRUE))

library(igraph)

G = graph.edgelist( interaction[,1:2], directed=FALSE )

vertex.labels = disease[,2]
V(G)$name  = disease[,1]
V(G)$label = gsub(" ","\n", gsub("-", "- ", vertex.labels))
V(G)$label.family = "Helvetica"
V(G)$color = disease[,7]
V(G)$frame.color  = disease[,7]  # border color
V(G)$size  = as.numeric( disease[,8] )/2
V(G)$label.cex  = 2.5
xy.position = data.matrix(disease[,5:6])

E(G)$weight = interaction[,3]


####  disease graph neighborhood plot
## plot(G, vertex.label.degree=pi, vertex.label.dist=0.2, layout=xy.position)
plot(G, layout=xy.position)
mtext("Barabasi et al's disease graph", cex=1.0)

similarity = interaction[,3]
difference = max(similarity) + 1 - similarity
distance = dist(difference)

adjacency_matrix = get.adjacency(G)
rownames(adjacency_matrix) = vertex.labels

distance_matrix = dist( adjacency_matrix )

####  hierarchical clustering plot
par(cex=0.25)
plot( hclust(distance_matrix), label=vertex.labels, col="deepskyblue", main="")
mtext("dendrogram (hierarchical clustering) of diseases", cex=1.0)

if (FALSE) {
####  dendrogram plot
par(cex=0.15)
plot( as.dendrogram( hclust(distance_matrix)), nodePar=list( lab.deepskycol=c("red","blue") ), horiz=TRUE, main="")
mtext("dendrogram of diseases", cex=1.0)

####  community dendrogram plot
dendPlot(fastgreedy.community(G))
mtext("dendPlot of diseases", cex=1.0)
}

par(opar)
dev.off()

#   
#   pdf("DiseaseNetwork.pdf", 8, 8)
#   opar = par(ask=TRUE, mar=c(1,1,3,1))
#   
#   ### if you do not already have these packages installed, please install them:
#   # install.packages("lattice")
#   # install.packages("Matrix")
#   
#   disease = read.csv("DiseaseNetwork.csv", header=TRUE)
#   interaction = data.matrix(read.csv("GeneInteraction.csv", header=TRUE))
#   
#   library(igraph)
#   
#   G = graph.edgelist( interaction[,1:2], directed=FALSE )
#   
#   vertex.labels = disease[,2]
#   V(G)$name  = disease[,1]
#   V(G)$label = gsub(" ","\n", gsub("-", "- ", vertex.labels))
#   V(G)$label.family = "Helvetica"
#   V(G)$color = disease[,7]
#   V(G)$frame.color  = disease[,7]  # border color
#   V(G)$size  = as.numeric( disease[,8] )/2
#   V(G)$label.cex  = 2.5
#   xy.position = data.matrix(disease[,5:6])
#   
#   E(G)$weight = interaction[,3]
#   
#   
#   ####  disease graph neighborhood plot
#   ## plot(G, vertex.label.degree=pi, vertex.label.dist=0.2, layout=xy.position)
#   plot(G, layout=xy.position)
#   Hit <Return> to see next plot: mtext("Barabasi et al's disease graph", cex=1.0)
#   
#   similarity = interaction[,3]
#   difference = max(similarity) + 1 - similarity
#   distance = dist(difference)
#   
#   adjacency_matrix = get.adjacency(G)
#   rownames(adjacency_matrix) = vertex.labels
#   
#   distance_matrix = dist( adjacency_matrix )
#   
#   ####  hierarchical clustering plot
#   par(cex=0.25)
#   plot( hclust(distance_matrix), label=vertex.labels, col="deepskyblue", main="")
#   Hit <Return> to see next plot: mtext("dendrogram (hierarchical clustering) of diseases", cex=1.0)
#   
#   if (FALSE) {
#   ####  dendrogram plot
#   par(cex=0.15)
#   plot( as.dendrogram( hclust(distance_matrix)), nodePar=list( lab.deepskycol=c("red","blue") ), horiz=TRUE, main="")
#   mtext("dendrogram of diseases", cex=1.0)
#   
#   ####  community dendrogram plot
#   dendPlot(fastgreedy.community(G))
#   mtext("dendPlot of diseases", cex=1.0)
#   }
#   
#   par(opar)
#   dev.off()
#   null device 
#       
