"
Shiny App for barcode processing.

Author: Xavi Guitart

Description:
Sequence monkey samples without touching anything
"

library(shiny)

#===========================      Organization of App     ===========================#

#displaying master data frame column names
masterColNames <- c("core_files",
                    "i5 Primer",
                    "Sibmission Template Discription",
                    "Biological Description",
                    "Monkey",
                    "Lib ID",
                    "Sort Data",
                    "Output Directory"
                    )



#=====================================================================================#


#navbarPage is a function presented by shiny to allow for navigation pages

ui <- navbarPage(
  
  #Title of app
  title = "Barcode-App",
  #make sure it's fluid so that the tabs and panels all orient correctly
  fluid = T,
  
  #first tab page: input information
  tabPanel(
    title = "Input",
    #organization: maybe change this to fluidRow...
    sidebarLayout(
      sidebarPanel(
        width = 3,
        helpText("Directory holding sequencing files"),
        fileInput(inputId = "fastqs",
                  label = "FastQ Files")
      ),
      mainPanel(
        #name for all columns in the masterColumn
        table
        
      )
    )
  ),
  #end of first tab page
  
  #second tab page
  tabPanel("Log File View...")
  
  
  
)


server = function(input, output){
  
}


shinyApp(ui = ui , server = server)
