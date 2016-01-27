library("ggplot2")

data <- read.csv("../data/date-followers-contrib.csv")

ggplot( data, aes(x=Yr,y=..count..))+geom_bar(stat='bin')+scale_x_continuous(breaks=c(2007:2016))

ggplot( data, aes(x=Yr,y=Contribs))+geom_point()+scale_y_log10()
ggplot( data, aes(x=Yr,y=Followers))+geom_point()+scale_y_log10()

qplot(factor(Yr), Followers, data = data, geom = "boxplot")+scale_y_log10()
qplot(factor(Yr), Contribs, data = data, geom = "boxplot")+scale_y_log10()
