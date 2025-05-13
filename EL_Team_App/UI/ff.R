tabPanel(
  'Four Factors',
  
  fluidRow(
    column(
      width = 12,
      
      tabsetPanel(
        type='tabs',
        
        tabPanel(
          'OFF-DEF',
          
          dataTableOutput('team_ff'),
          
          tags$style(type = 'text/css', '.noUi-connect {background: #014cfd;}'),
          tags$head(tags$style('#team_ff thead th{background-color: #014cfd; color: #fffffa;')),
          tags$head(tags$style('#team_ff tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}'))
        )
      )
    )
  )
)