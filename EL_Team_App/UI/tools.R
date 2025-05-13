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
          
          div(id = 'three',
              div(id = 'team', 
                  selectInput(inputId = 'team_name', label = 'Team', 
                              choices = 'EFS')),
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
         )
        )
      )
    )
  )