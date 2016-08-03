#Topic Model
library("data.table")
library("tm")
library("RTextTools")
library("topicmodels")

sink("/usr/local/data/topicModel/model.txt")
# Start the clock!
ptm <- proc.time()
ptm

data<-fread("/usr/local/data/topicModel/titles_per_venue.txt",header=TRUE,sep=";")
matrix <- create_matrix(as.vector(data$titles), language="english", removeNumbers=FALSE, stemWords=FALSE, weighting=weightTf)
k <- 12
lda <- LDA(matrix, k, method = "Gibbs")

# Extract the probability distributions for the terms and topics.
termsByTopics <- as.data.frame(t(posterior(lda)$terms))
topicsByJournals <- as.data.frame(t(posterior(lda)$topics))
write.table(termsByTopics, file="/usr/local/data/termsByTopics.txt", sep=";", dec=".", row.names=TRUE, col.names=FALSE, quote=FALSE)
write.table(topicsByJournals, file="/usr/local/data/topicsByPublicationVenues.txt", sep=";", dec=".", row.names=FALSE, col.names=FALSE, quote=FALSE)

# Stop the clock
proc.time() - ptm