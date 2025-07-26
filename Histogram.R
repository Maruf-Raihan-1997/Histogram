# importing dataset

dataset = read.csv("data.csv")

library(ggplot2)

#Basic histogram

ggplot(dataset, aes(x= weight) ) +
  geom_histogram()

# change width of bin


ggplot(dataset, aes(x= weight) ) +
  geom_histogram(binwidth = 1, color= "red")

# filled color changing

ggplot(dataset, aes(x= weight) ) +
  geom_histogram(binwidth = 1, color= "black",
                 fill="lightblue")


# adding mean line


myplot = ggplot(dataset, aes(x= weight) ) +
  geom_histogram(binwidth = 1, color= "black",
                 fill="lightblue")

myplot

myplot + geom_vline(aes(xintercept=mean(weight)),
                    color= "blue", linetype= "dashed",
                    size=1)




# density plot

ggplot(dataset, aes(x= weight) ) +
  geom_histogram(aes( y = after_stat(density)), color= "black",
                 fill="white")+
  geom_density(fill="blue", alpha= .2)



#changing line and fill colors

ggplot(dataset, aes(x= weight) ) +
  geom_histogram(color= "black",fill="white")

# changing line colors by groups


ggplot(dataset, aes(x= weight, fill= sex)) +
  geom_histogram(color= "black", alpha=.5
                 , position="identity")

#position adjustment to use 
#overlapping points  on the layer


#Interleaved histogram


ggplot(dataset, aes(x= weight, fill= sex)) +
  geom_histogram(color= "black", alpha=.5
                 , position="dodge")+
  theme(legend.position= "top")


# mean line for different group
# we need plyr pack
#useful for group wise mean

install.packages("plyr")
library(plyr)

group_means = ddply(dataset, "sex", summarise,
                    grp.mean= mean(weight))

group_means


#Adding mean lines

myplot = ggplot(dataset, aes(x= weight, fill= sex)) +
  geom_histogram(color= "black", alpha=.5,position= "dodge")+
                 geom_vline(data=group_means, aes(xintercept = grp.mean, color= sex),
                            linetype= "dashed")+
                 theme(legend.position="top")


myplot   

#Using custom color palettes

myplot + scale_color_manual(values = c ("red", "blue"))+
  scale_fill_manual(values = c("green", "orange"))

























