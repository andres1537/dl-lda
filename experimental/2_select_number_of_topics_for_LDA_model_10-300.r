#Select number of topics for LDA model
library("NLP")
library("tm")
library("ldatuning")
library("topicmodels")
library("RTextTools")
sink("C:/Users/andres/Desktop/data/topicModel/result-10_300.txt")

data<-read.csv("C:/Users/andres/Desktop/data/topicModel/titles_per_venue.txt",header=TRUE,sep=";")
matrix <- create_matrix(as.vector(data$titles), language="english", removeNumbers=FALSE, stemWords=FALSE, weighting=weightTf)
matrix
result <- FindTopicsNumber(
  matrix,
  topics = seq(from = 10, to = 300, by = 10),
  metrics = c("Griffiths2004", "CaoJuan2009", "Arun2010", "Deveaud2014"),
  method = "Gibbs",
  control = list(seed = 77),
  mc.cores = 1L,
  verbose = TRUE
)
result