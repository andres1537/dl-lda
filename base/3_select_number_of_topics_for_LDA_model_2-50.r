#Select number of topics for LDA model
library("NLP")
library("tm")
library("ldatuning")
library("topicmodels")
library("RTextTools")
sink("/usr/local/data/topicModel/result-2_50.txt")

data<-read.csv("/usr/local/data/topicModel/titles_per_venue.txt",header=TRUE,sep=";")
matrix <- create_matrix(as.vector(data$titles), language="english", removeNumbers=FALSE, stemWords=FALSE, weighting=weightTf)
matrix
result <- FindTopicsNumber(
  matrix,
  topics = seq(from = 2, to = 50, by = 1),
  metrics = c("Griffiths2004", "CaoJuan2009", "Arun2010", "Deveaud2014"),
  method = "Gibbs",
  control = list(seed = 77),
  mc.cores = 8L,
  verbose = TRUE
)
result