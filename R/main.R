#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


# ggplotly(ggplot(iris, aes(x = Sepal.Length, y = Petal.Width, color = Species)) + geom_point())


ggs3plotly <- function(plotblob) {
  temp_name <- "temp.html"
  plot <- plotly::ggplotly(plotblob)
  html <- htmlwidgets::saveWidget(plot, temp_name)
  output_filename <- paste("plots/" ,uuid::UUIDgenerate(), ".html", sep = "")
  bucket_name <- "julieta-static"
  path <- aws.s3::put_object(file = temp_name, object = output_filename, bucket = bucket_name, acl = "public-read")

  url <- paste("https://s3-", Sys.getenv('AWS_DEFAULT_REGION'), ".amazonaws.com/", bucket_name, "/", output_filename, sep = "")
  if (file.exists(temp_name)) file.remove(temp_name)
  return(url)
}

