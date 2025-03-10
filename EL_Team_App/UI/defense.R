tabPanel(
  'Defense',
  
  fluidRow(
    column(
      width = 12,
      
      tabsetPanel(
        type='tabs',
        
        tabPanel(
          'Traditional',
          
          dataTableOutput('team_def_traditional'),
          
          tags$style(type = 'text/css', '.noUi-connect {background: #014cfd;}'),
          tags$head(tags$style('#team_def_traditional thead th{background-color: #014cfd; color: #fffffa;')),
          tags$head(tags$style('#team_def_traditional tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}'))
        ),
        
        tabPanel(
          'Advanced',
          
          dataTableOutput('team_def_advanced'),
          
          tags$style(type = 'text/css', '.noUi-connect {background: #014cfd;}'),
          tags$head(tags$style('#team_def_advanced thead th{background-color: #014cfd; color: #fffffa;')),
          tags$head(tags$style('#team_def_advanced tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}'))
        ),
        
        tabPanel(
          'Scoring',
          
          dataTableOutput('team_def_scoring'),
          
          tags$style(type = 'text/css', '.noUi-connect {background: #014cfd;}'),
          tags$head(tags$style('#team_def_scoring thead th{background-color: #014cfd; color: #fffffa;')),
          tags$head(tags$style('#team_def_scoring tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}'))
        ),
        
        tabPanel(
          'By Zone',
          
          dataTableOutput('team_def_byzone'),
          
          tags$style(type = 'text/css', '.noUi-connect {background: #014cfd;}'),
          tags$head(tags$style('#team_def_byzone thead th{background-color: #014cfd; color: #fffffa;')),
          tags$head(tags$style('#team_def_byzone tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}'))
        )
      )
    )
  )
)