#
# This is the server code that handles application logic for Iris Dataset Visualizer web application. 
#
# This code has been developed as part of the Coursera's Developing Data Products Assignment.
# 
# Author: Anang Hudaya bin Muhamad Amin
#
# Date: 27th of April 2018
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  dataset <- reactive( {
    iris[sample(nrow(iris), input$sampleSize),]
  })
  dataset2 <- iris

  
  output$plot <- reactivePlot(function() {
  p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point(aes(color=Species, shape=Species))
    
    
  if (input$setosa)
      p <- p + geom_smooth(data = subset(dataset2, dataset2$Species == "setosa"), method="gam", formula= y~s(x, bs="cs"))
  if (input$virginica)
    p <- p + geom_smooth(data = subset(dataset2, dataset2$Species == "virginica"), method="gam", formula= y~s(x, bs="cs"))
  if (input$versicolor)
    p <- p + geom_smooth(data = subset(dataset2, dataset2$Species == "versicolor"), method="gam", formula= y~s(x, bs="cs"))
  
    
    print(p)
    
  }, height=600
  )
  
})