library(shiny)
library(markdown)

navbarPage(
  title = 'Well-Being comparison between OECD Countries',
  tabPanel(p(icon("line-chart"), 'Plot'),
           sidebarPanel(
             helpText("Pick up two countries and then click Submit."),
             selectInput("country1", "Country 1:", wb$country, selected=wb$country[[1]]),
             selectInput("country2", "Country 2:", wb$country, selected=wb$country[[2]]),
             submitButton("Submit"),
             hr(),
             tags$div(
               HTML(paste("Data from ", tags$a("OECD Regional Well-Being", href="https://www.oecdregionalwellbeing.org/", target="_blank"), sep = ""))
             )
           ),
           mainPanel(align="center",
                     plotOutput("wbPlot", width = "100%")  
           )
  ),
  tabPanel(p(icon("table"), 'Data'),
           mainPanel(
                     dataTableOutput('wbData')  
           )	
  ),
  tabPanel('About',
           mainPanel(
             includeMarkdown("./about.md")  
           )	
  )
)
