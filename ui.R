library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict chick weight from age and diet"),
  h4("Please use the slider on the left hand panel to select the age of the chick you want to get a
     weight prediction for. You also have the option to show or hide any one (or more) of the predictions
     for the various chick diets 1-4."),
  sidebarLayout(
    sidebarPanel(# sidebarPanel contains the inputs
      sliderInput("sliderTime", "What is the age of the chick in days since birth?", 0, 25, value = 10),
      checkboxInput("ShowDiet1", "Show/Hide prediction for Diet 1", value = TRUE),
      checkboxInput("ShowDiet2", "Show/Hide prediction for Diet 2", value = TRUE),
      checkboxInput("ShowDiet3", "Show/Hide prediction for Diet 3", value = TRUE),
      checkboxInput("ShowDiet4", "Show/Hide prediction for Diet 4", value = TRUE)
    ),
    mainPanel( # mainPanel contains the outputs
      h5("* The following plot uses the ChickWeight dataset from R"),
      plotOutput("plot1"),
      h4("Predicted chick weight based on Diet 1:"),
      textOutput("predDiet1"), # output from prediction Diet 1
      h4("Predicted chick weight based on Diet 2:"),
      textOutput("predDiet2"),  # output from prediction Diet 2,
      h4("Predicted chick weight based on Diet 3:"),
      textOutput("predDiet3"),  # output from prediction Diet 3,
      h4("Predicted chick weight based on Diet 4:"),
      textOutput("predDiet4")  # output from prediction Diet 4
    )
  )
))