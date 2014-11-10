# The main table from:
# Enterprise Data Analysis and Visualization: An Interview Study
# Sean Kandel, Andreas Paepcke, Joseph M. Hellerstein, and Jeffrey Heer
# VAST 2012.


WhatIsUsedByWhom = data.matrix( read.csv("EnterpriseDataAnalysis.csv", row.names=1, header=TRUE) )

n = nrow(WhatIsUsedByWhom)
p = ncol(WhatIsUsedByWhom)

Hacker          = WhatIsUsedByWhom[,(1:(p-11)) ]
Scripter        = WhatIsUsedByWhom[,((p-12):(p-6)) ]
ApplicationUser = WhatIsUsedByWhom[,((p-5):p) ]

JobColors = matrix(c(
   "Biology",         "aquamarine",
   "Healthcare",      "cyan",
   "SocialNetworking","chartreuse",
   "Finance",         "purple",
   "Retail",          "blue",
   "Marketing",       "orange",
   "Insurance",       "hotpink",
   "Analytics",       "magenta",
   "Visualization",   "red",
   "Web",             "skyblue",
   "WebSecurity",     "deepskyblue",
   "Sports",          "goldenrod",
   "NewsAggregator",  "gold",
   "Datamart",        "khaki",
   "Media",           "dodgerblue"), 15,2, byrow=TRUE)

WhoUsesWhat = t(WhatIsUsedByWhom)

WhatNames = colnames(WhatIsUsedByWhom)
colors = WhatNames
colors = gsub("Hacker.",         "",colors) 
colors = gsub("Scripter.",       "",colors) 
colors = gsub("ApplicationUser.","",colors) 

for (i in 1:nrow(JobColors)) {
   colors = gsub(paste(JobColors[i,1],".*",sep=""), JobColors[i,2], colors)
}

ApplicationUserColors = colors[((p-5):p)]
ScripterColors       = colors[((p-12):(p-6))]
HackerColors         = colors[(1:(p-11))]

ProcessToolColors = c( rep("limegreen",14), rep("steelblue",13) )
# Process: limegreen
# Tools: steelblue


opar = par( ask=TRUE )  # ask permission to show each new plot


displayTable = function(T,RowColors,ColColors,...) {
   heatmap(T, symm=FALSE, scale="none", hclust = function(d) hclust(d, method="complete" ),
              RowSideColors=RowColors, ColSideColors=ColColors, margins=c(15,17),
              cex=0.8, cexRow=0.8,cexCol=0.8, col=c("white","red"), ...)
   legend( "topright", JobColors[,1], fill=JobColors[,2], border=JobColors[,2], cex=0.3 )
}

displayTable( WhatIsUsedByWhom, ProcessToolColors, colors,                main="WhatIsUsedByWhom" )
displayTable( Hacker,           ProcessToolColors, HackerColors,          main="Hacker" )
displayTable( Scripter,         ProcessToolColors, ScripterColors,        main="Scripter" )
displayTable( ApplicationUser,  ProcessToolColors, ApplicationUserColors, main="ApplicationUser" )


displayCorr = function(T,SideColors,...) {
   correlation_colors = function(n) rainbow(n, start=0.0, end=0.35)  # n colors starting at red, ending at green
   heatmap(T, symm=TRUE, scale="none",
              RowSideColors=SideColors, ColSideColors=SideColors, margins=c(15,17),
              cex=0.8, cexRow=0.8,cexCol=0.8, col=correlation_colors(101), ...)
   legend( "topright", rev(paste( seq(-1,+1,length=11)) ),
              fill=rev(correlation_colors(11)), border=rev(correlation_colors(11)), cex=0.5 ) 
}

JobCorrelation = cor( WhatIsUsedByWhom )
displayCorr( JobCorrelation, colors, main="Job Correlation" )
legend( "bottomright", JobColors[,1], fill=JobColors[,2], border=JobColors[,2], cex=0.4 )

ProcessToolCorrelation = cor( WhoUsesWhat )
displayCorr( ProcessToolCorrelation, ProcessToolColors, main="Process/Tool Correlation" )
legend( "bottomright", c("Process","Tool"), fill=c("limegreen","steelblue"), border=c("limegreen","steelblue"), cex=0.5 )


Job = data.frame( WhoUsesWhat )  #  create a data frame with the WhoUsesWhat data
#  add a new "class" variable to the data frame, called "Type", as an enumerated type ("factor")

Job$Type = as.factor( c( rep("Hacker",p-13), rep("Scripter",7), rep("ApplicationUser",6) ) )
Job$Type = as.factor( gsub( "[.].*", "", WhatNames ) )

library(rpart)
Classifier = rpart( Type ~ ., data=Job, method="class" )
Classifier

summary(Classifier)

# change jobs to the company type
Job$Type = as.factor( gsub("[0-9]","", gsub( ".*[.]", "", WhatNames ) ) )
unique(Job$Type)  #  there are now 15 different "classes"

Classifier = rpart( Type ~ ., data=Job, method="class", model=TRUE, parms = list( split="information" ) )
Classifier



par(opar)  # restore plot parameters
