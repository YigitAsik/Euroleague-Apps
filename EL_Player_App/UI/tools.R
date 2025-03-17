tabPanel(
  'Tools',
  
  fluidRow(
    column(
      width = 12,
      
      tabsetPanel(
        type='tabs',
        
        tabPanel(
          'Shot-chart',
          
          div(
            id = 'checkBox',
            checkboxGroupInput(inputId = 'possBox', label = 'Poss. to Include',
                               choices = c('Low', 'Medium', 'High', 'Very High'),
                               selected = c('Medium', 'High', 'Very High'),
                               inline = T)
            ),
          
          div(id = 'relativeTo',
              radioButtons(inputId = 'against', label = 'Relative to: ', 
                           choices = c('League Avg.', 'Team Avg.', 'Position Avg.'),
                           selected = 'League Avg.', inline = T)),
          
          div(id = 'four',
              div(id = 'player', 
                  selectInput(inputId = 'player_name', label = 'Interested Player', 
                              choices = NULL)),
              div(id = 'onWith',
                  selectInput(inputId = 'with', label = 'On With', 
                              choices = NULL, multiple = T)),
              div(id = 'onWithout',
                  selectInput(inputId = 'without', label = 'Without', 
                              choices = NULL, multiple = T))
          ),
          
          div(id = 'buttonPlot',
              actionButton(inputId = 'plot', label = 'Plot', width = 200)),
          
          hr(),
          plotOutput('Hexchart', width = '100%')
         ),
        
        tabPanel(
          'xPTS',
          
          dataTableOutput('xPTS'),
          
          tags$style(type = 'text/css', '.noUi-connect {background: #014cfd;}'),
          tags$head(tags$style('#xPTS thead th{background-color: #014cfd; color: #fffffa;')),
          tags$head(tags$style('#xPTS tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}'))
        )
      )
    )
  )
)