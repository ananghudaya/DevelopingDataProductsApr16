#
# This is the user-interface definition of Iris Dataset Visualizer web application. 
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

dataset <- iris

shinyUI(pageWithSidebar(
  
  headerPanel("Iris Dataset Visualizer"),
  #sidebar panel
  sidebarPanel(
    br(),
    h4("About this App:"),
    p("This App visualizes the entire Iris dataset with generalized additive model(GAM) feature."),
    br(),
    selectInput('x', label = "1. Select the first variable:", names(dataset[1:4])),
    selectInput('y', label = "2. Select the second variable:", names(dataset[1:4])),
    sliderInput('sampleSize', 'Number of Bins', min=1, max=150, value=75),
    br(),
    h5("3. Please select data for modelling:"),
    checkboxInput('setosa', 'Setosa'),
    checkboxInput('virginica', 'Virginica'),
    checkboxInput('versicolor', 'Versicolor'),
    br(),
    h4("Info about Iris Dataset in R:"),
    br(),
    p("A data frame with 150 observations on 5 variables. It is a multivariate data set introduced by the British statistician and biologist Ronald Fisher in his 1936 paper."),
    p("The use of multiple measurements in taxonomic problems as an example of linear discriminant analysis.[1]"),
    tags$div(
      tags$ul(
        tags$li("Sepal.Length"),
        tags$li("Sepal.Width"),
        tags$li("Petal.Length"),
        tags$li("Petal.Width"),
        tags$li("Species")
      )
    ),
    h4("Source:"),
    code("[1] R. A. Fisher (1936). The use of multiple measurements in taxonomic problems. Annals of Eugenics. 7 (2): 179???188. doi:10.1111/j.1469-1809.1936.tb02137.x")
  ),
  #main panel
  mainPanel(
    plotOutput('plot')
  )
))




