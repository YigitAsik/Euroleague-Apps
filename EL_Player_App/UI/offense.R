tags$head(HTML("
<script async src='https://www.googletagmanager.com/gtag/js?id=G-9EW9TWZLN0'></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-9EW9TWZLN0');
</script>
"))

tabPanel(
  'Offense',
  
  fluidRow(
    column(
      width = 12,
      
      tabsetPanel(
        type='tabs',
        
        tabPanel(
          'Traditional',
          
          dataTableOutput('player_off_traditional'),
          
          tags$style(type = 'text/css', '.noUi-connect {background: #014cfd;}'),
          tags$head(tags$style('#player_off_traditional thead th{background-color: #014cfd; color: #fffffa;')),
          tags$head(tags$style('#player_off_traditional tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}'))
        ),
        
        tabPanel(
          'Advanced',
          
          dataTableOutput('player_off_advanced'),
          
          tags$style(type = 'text/css', '.noUi-connect {background: #014cfd;}'),
          tags$head(tags$style('#player_off_advanced thead th{background-color: #014cfd; color: #fffffa;')),
          tags$head(tags$style('#player_off_advanced tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}'))
        ),
        
        tabPanel(
          'Scoring',
          
          dataTableOutput('player_off_scoring'),
          
          tags$style(type = 'text/css', '.noUi-connect {background: #014cfd;}'),
          tags$head(tags$style('#player_off_scoring thead th{background-color: #014cfd; color: #fffffa;')),
          tags$head(tags$style('#player_off_scoring tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}'))
        ),
        
        tabPanel(
          'By Zone',
          
          dataTableOutput('player_off_byzone'),
          
          tags$style(type = 'text/css', '.noUi-connect {background: #014cfd;}'),
          tags$head(tags$style('#player_off_byzone thead th{background-color: #014cfd; color: #fffffa;')),
          tags$head(tags$style('#player_off_byzone tbody td {border-top: 0.1px solid grey;border-left: 0.1px solid grey;border-right: 0.1px solid grey;}'))
        )
      )
    )
  )
)