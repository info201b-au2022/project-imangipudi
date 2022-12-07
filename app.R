library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  tabsetPanel(
    tabPanel(
      title = "Page 1"
    ),
    tabPanel(
      title = "Page 2"
    ),
    tabPanel(
      title = "Page 3"
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    }

# Run the application 
shinyApp(ui = ui, server = server)
