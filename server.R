library(shiny)
library(ggplot2)

function(input, output) {
  output$wbPlot <- renderPlot({
    validate(
      need(input$country1 != input$country2, "Pick up two different countries!")
    )
    
    wb2 <- wb[wb$country==input$country1 | wb$country==input$country2,]
    
    ggplot(wb2, aes(x=topic, y=value, col=country, group=country)) + 
      ylim(0,10) + geom_polygon(fill=NA) + geom_point(size=2) + 
      coord_polar() + theme(text = element_text(size=15))
  }, height = 600, width = 600)
  output$wbData <- renderDataTable(
    wb0, options = list(pageLength = 50)
  )
}
