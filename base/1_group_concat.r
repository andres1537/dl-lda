#Create dataset for topic modeling
library(sqldf)
data<-read.csv("/usr/local/data/topicModel/dataset.txt",header=TRUE,sep=";")
resultado <- sqldf("select journal as venue, group_concat(title) as titles from data group by journal")
write.table(resultado, file="/usr/local/data/topicModel/titles_per_venue.txt", sep=";", row.names=FALSE, col.names=TRUE, quote=FALSE)