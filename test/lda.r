#Topic Model
library("data.table")
library("tm")
library("RTextTools")
library("topicmodels")

data<-fread("documents.txt",header=TRUE,sep=";")
matrix <- create_matrix(as.vector(data$title), language="english", removeNumbers=TRUE, stemWords=TRUE, weighting=weightTf)
k <- 2
lda <- LDA(matrix, k, method = "Gibbs")

# Extract the probability distributions for the terms and topics.
termsByTopics <- as.data.frame(t(posterior(lda)$terms))
topicsByTitles <- as.data.frame(t(posterior(lda)$topics))
write.table(termsByTopics, file="termsByTopics.txt", sep=";", dec=".", row.names=TRUE, col.names=FALSE, quote=FALSE)
write.table(topicsByTitles, file="topicsByTitles.txt", sep=";", dec=".", row.names=FALSE, col.names=FALSE, quote=FALSE)