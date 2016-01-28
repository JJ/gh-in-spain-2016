library("ggplot2")
library("ggthemes")

data <- read.csv("../data/date-followers-contrib.csv")

ggplot( data, aes(x=Yr,y=..count..))+geom_bar(stat='bin')+scale_x_continuous(breaks=c(2007:2016))+  theme_tufte()

ggplot( data, aes(x=Yr,y=Contribs))+geom_point()+scale_y_log10()+  theme_tufte()
ggplot( data, aes(x=Yr,y=Followers))+geom_point()+scale_y_log10()+  theme_tufte()

qplot(factor(Yr), Followers, data = data, geom = "boxplot")+scale_y_log10()+  theme_tufte()
qplot(factor(Yr), Contribs, data = data, geom = "boxplot")+scale_y_log10()+  theme_tufte()

users <- read.csv("../data/users-month.csv")
ggplot(data=users)+geom_bar(aes(x=Month,y=IncUsers,fill='Users'),alpha=.3,stat='identity')+geom_bar(aes(x=Month,y=NewUsers,fill='New Users'),stat='identity')+theme_tufte()+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("users.png",height=3,width=4,dpi=300)
