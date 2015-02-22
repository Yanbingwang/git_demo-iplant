# ggplot learing script
# Yanbing Wang yanbingwang@email.arizona.edu
# Feb.22, 2015

install.packages("ggplot2", dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

library("ggplot2")
library("reshape2")
library("ggthemes")
library("plyr")

head(iris)
iris[1:2,]
df <- melt(iris,id.vars="script")

myplot <- ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width))
summary(myplot)

myplot <- ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point()

ggplot(iris, aes(Sepal.Length,Sepal.Width, color = Species)) + geom_point(size =3)
ggplot(iris, aes(Sepal.Length,Sepal.Width, color = Species)) + geom_point(aes(shape = Species), size =3)


d2 <- diamonds[sample(1:dim(diamonds)[1], 1000), ]
d2
ggplot(d2, aes(carat,price, color = color)) + geom_point(size =3)
ggplot(d2, aes(carat,price, color = color)) + geom_point(aes(shape = color),size =3)

library(MASS)
ggplot(birthwt,aes(factor(race),bwt))+geom_boxplot()

myplot <- ggplot(birthwt,aes(factor(race),bwt))+geom_boxplot() 
summary(myplot)

ggplot(iris, aes(Sepal.Length,Sepal.Width, color = Species)) + geom_point() +
  facet_wrap( ~ Species)  # notice lack of .

ggplot(iris, aes(Sepal.Length,Sepal.Width, color = Species)) + geom_point(size=3) +
  facet_wrap( ~ Species)

library(RColorBrewer)
display.brewer.all()

library("reshape2")
df  <- melt(iris, id.vars = "Species")
ggplot(df, aes(Species, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set1")