"
temp for practice

"
rm(list = ls())
library(shiny)
library(shinysky)

server <- shinyServer(function(input, output, session) {
  
  # Initiate your table
  previous <- reactive({mtcars[1:10,]})
  
  MyChanges <- reactive({
    if(is.null(input$hotable1)){return(previous())}
    else if(!identical(previous(),input$hotable1)){
      # hot.to.df function will convert your updated table into the dataframe
      as.data.frame(hot.to.df(input$hotable1))
    }
  })
  output$hotable1 <- renderHotable({MyChanges()}, readOnly = F)
  output$tbl = DT::renderDataTable(MyChanges())
})

ui <- basicPage(
  mainPanel(
    
    column(6,hotable("hotable1")),
    column(6,DT::dataTableOutput('tbl')
           )
           )
  
  )
shinyApp(ui, server)
