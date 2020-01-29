library(shiny)

shinyServer(function(input, output) {
  model1 <- lm(weight ~ Time, data = ChickWeight[ChickWeight$Diet == 1,])
  model2 <- lm(weight ~ Time, data = ChickWeight[ChickWeight$Diet == 2,])
  model3 <- lm(weight ~ Time, data = ChickWeight[ChickWeight$Diet == 3,])
  model4 <- lm(weight ~ Time, data = ChickWeight[ChickWeight$Diet == 4,])
  
  model1pred <- reactive({
    timeInput <- input$sliderTime
    predict(model1, newdata = data.frame(Time = timeInput))
  })
  
  model2pred <- reactive({
    timeInput <- input$sliderTime
    predict(model2, newdata = data.frame(Time = timeInput))
  })
  
  model3pred <- reactive({
    timeInput <- input$sliderTime
    predict(model3, newdata = data.frame(Time = timeInput))
  })
  
  model4pred <- reactive({
    timeInput <- input$sliderTime
    predict(model4, newdata = data.frame(Time = timeInput))
  })
  output$plot1 <- renderPlot({
    timeInput <- input$sliderTime
    
    plot(ChickWeight$Time, ChickWeight$weight, xlab = "Chick age (days since birth)",
         ylab = "Chick weight (gm)", bty = "n", pch = 16,
         xlim = c(0, 25), ylim = c(0, 400))
    
    if(input$ShowDiet1){
      abline(model1, col = "burlywood1", lwd = 2)
    }
    if(input$ShowDiet2){
      abline(model2, col = "aquamarine4", lwd = 2)
    }
    if(input$ShowDiet3){
      abline(model3, col = "brown", lwd = 2)
    }
    if(input$ShowDiet4){
      abline(model4, col = "blue4", lwd = 2)
    }
    legend(0, 400, c("Diet 1 Prediction", "Diet 2 Prediction", "Diet 3 Prediction", "Diet 4 Prediction"), pch = 16,
           col = c("burlywood1", "aquamarine4", "brown", "blue4"), bty = "n", cex = 1.2)
    points(timeInput, model1pred(), col = "burlywood1", pch = 16, cex = 2)
    points(timeInput, model2pred(), col = "aquamarine4", pch = 16, cex = 2)
    points(timeInput, model3pred(), col = "brown", pch = 16, cex = 2)
    points(timeInput, model4pred(), col = "blue4", pch = 16, cex = 2)
  })
  
  output$predDiet1 <- renderText({
    model1pred()
  })
  
  output$predDiet2 <- renderText({
    model2pred()
  })
  
  output$predDiet3 <- renderText({
    model3pred()
  })
  
  output$predDiet4 <- renderText({
    model4pred()
  })
})