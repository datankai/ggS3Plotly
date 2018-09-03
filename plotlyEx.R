library(ggplot2)
library(plotly)

ggplotly(ggplot(iris, aes(x = Sepal.Length, y = Petal.Width, color = Species)) + geom_point())