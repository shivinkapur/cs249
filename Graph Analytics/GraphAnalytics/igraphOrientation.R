Instructions on how to start analyzing graphs using the R environment


1.  Download and install R from    http://cran.stat.ucla.edu

2.  Start R  and make sure you are connected to the web

3.  Within R, download and install the igraph package:

                 install.packages( "igraph" )

4.  Do some tests to make sure igraph is working:

                  library(igraph)
                  ?igraph                                  #  produces a manual page about igraph
                  ?diameter                              #  produces a manual page about the diameter() function
                  example(diameter)              #  runs a pre-specified test case for the diameter() function
                  plot(g)                                     #  plots the graph used in the diameter test case

4.  within R, change directory into whatever directory you stored the HW#1 files in.
    There probably ought to be a little text input area for changing directory on the R console.
    If this doesn't work, you can either copy the HW#1 files to whatever directory R is in
    (like "Documents" or whatever it is), or use the R setwd() command to
    set the current working directory:

                  setwd("#...<whatever path you put the HW#1 files in>...#")

    If you can't get the setwd() command to work, then copy the files into R's current directory.
    If you can't figure out what the current working directory is, that is a bad sign.  Perhaps try

                  getwd()

    and assuming this gives you something reasonable, perhaps list the contents of the directory:

                  dir()

    This way you can at least see the files that are in whatever directory you are in.

5.  Once in the right directory, load the HW#1 files:

                  Airports     =  read.csv( "airports.csv", header=TRUE )
                  Connections  =  read.csv( "airport_connections.csv", header=TRUE )

    This creates two tables in R, exactly like the tables in the .csv files.

6.  Create an airport graph from these tables

                  Edges = data.matrix( Connections[ , c(2,4) ] )     #  select cols 2 and 4 from the Connections table
                  G =  graph.edgelist( Edges, directed=FALSE )       #  create an undirected graph from Edges
                  V(G)$name = c("", Airports[,2])   # give names to vertices using column 2 of the Airports table (= IATA code)
                  V(G)$label = V(G)$name            # in case you want to plot the graph

7.  Analyze the graph:

                  diameter(G)                                        #  compute the diameter of the airport graph

8.  Try some other things, e.g. read the manual pages about important functions:

                  ? get.diameter
                  ? shortest.paths

                  help.search("degree")

9.  Read the igraph documentation at   http://igraph.sourceforge.net/documentation.html





##########  In theory you could just paste the following script into your R session,
##########  if you edit the path to point to the right directory:


##########  R script for analyzing the airport data

install.packages( "igraph" )

library(igraph)
?igraph                #  produces a manual page about igraph
?diameter              #  produces a manual page about the diameter() function
example(diameter)      #  runs a pre-specified test case for the diameter() function
plot(g)                #  plots the graph used in the diameter test case

##########  change directory into whatever directory you stored the HW#1 files in.

setwd("#...<whatever path you put the HW#1 files in>...#")
getwd()
dir()

##########  load the HW#1 files into two tables, for airports and connections:

Airports     =  read.csv( "airports.csv", header=TRUE )
Connections  =  read.csv( "airport_connections.csv", header=TRUE )

##########  create an airport graph from these tables

Edges = data.matrix( Connections[ , c(2,4) ] )     #  select cols 2 and 4 from the Connections table
G =  graph.edgelist( Edges, directed=FALSE )       #  create an undirected graph from Edges
V(G)$name = c("", Airports[,2])   # give names to vertices using column 2 of the Airports table (= IATA code)
V(G)$label = V(G)$name            # in case you want to plot the graph

##########  analyze the graph

diameter(G)  #  compute the diameter of the airport graph

##########  read the manual pages about important functions:

? get.diameter
? shortest.paths

help.search("degree")

##########  read documentation at  http://igraph.sourceforge.net/documentation.html

