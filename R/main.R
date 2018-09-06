#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


# ggplotly(ggplot(iris, aes(x = Sepal.Length, y = Petal.Width, color = Species)) + geom_point())


ggs3plotly <- function(plotblob) {
  plot <- plotly::ggplotly(plotblob)
  html <- htmlwidgets::saveWidget(plot, "temp.html")
  output_filename <- paste(uuid::UUIDgenerate(), ".html", sep = "")
  bucket_name <- "julieta-static"
  path <- aws.s3::put_object(file = "temp.html", object = output_filename, bucket = bucket_name, acl = "public-read")

  url <- paste("https://s3-", Sys.getenv('AWS_DEFAULT_REGION'), ".amazonaws.com/", bucket_name, "/", output_filename, sep = "")

  return(url)
}

