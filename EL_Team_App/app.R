# Dependencies -----------------------------------------------------------------
source('Library.R')

# Global -----------------------------------------------------------------------
source('Global.R')

# Front End --------------------------------------------------------------------

ui <- fluidPage(
  
  # CSS
  tags$head(
    tags$link(rel = 'stylesheet', type = 'text/css', href = 'shinycss.css')
  ),
  
  # Navbar
  navbarPage(
    title = tagList(
      div(id = 'nameApp', h3('EuroLeague Shiny App')),
      div(id = 'information', p(paste('Most recent update: ', '2025-05-13'))),
      div(id = 'signature', p('@Hooplytics'))
    ),
    
    tabPanel(
      'Four Factors',
      source('UI/ff.R', local = TRUE, encoding = 'UTF-8')$value
    ),
    tabPanel(
      'Offense',
      source('UI/offense.R', local = TRUE, encoding = 'UTF-8')$value
    ),
    tabPanel(
      'Defense',
      source('UI/defense.R', local = TRUE, encoding = 'UTF-8')$value
    ),
    tabPanel(
      'Tools',
      source('UI/tools.R', local = TRUE, encoding = 'UTF-8')$value
    ),
    tabPanel(
      'Glossary',
      source('UI/glossary.R', local = TRUE, encoding = 'UTF-8')$value
    )
  )
  
)

# Server -----------------------------------------------------------------------

server <- function(input, output, session){
  
  source(file.path('Server', 'reactiveData.R'),  
         local = TRUE, encoding = 'UTF-8')$value
  source(file.path('Server', 'data.R'),  
         local = TRUE, encoding = 'UTF-8')$value
  
}
# Shiny App ------------------------------------------------------------
shinyApp(ui = ui, server = server)