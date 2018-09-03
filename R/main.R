#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


# ggplotly(ggplot(iris, aes(x = Sepal.Length, y = Petal.Width, color = Species)) + geom_point())


ggs3plotly <- function(plotblob) {
  plot <- plotly::ggplotly(plotblob)
  html <- htmlwidgets::saveWidget(plot, "temp.html")
  path <- aws.s3::put_object(file = "temp.html", object = "iframe_plot_whatever.html", bucket = "caro-bucket-function", acl = "public-read")

  url <- paste("https://s3-", Sys.getenv('AWS_DEFAULT_REGION'), ".amazonaws.com/", "caro-bucket-function/iframe_plot_whatever.html",sep = "")

  return(url)
}

