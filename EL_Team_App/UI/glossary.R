tabPanel(
  'Offense',
  
  fluidRow(
    column(
      width = 12,
      
      tabsetPanel(
        type='tabs',
        
        tabPanel(
          'Traditional',
          
          fluidPage(
            # h1('Glossary'),
            
            # div(
            #   
            #   a('A', href = 'A'), " | ",
            #   a('B', href = 'B'), " | ",
            #   a('C', href = 'C')
            #   
            # ),
            
            # Collapsible panels
            bsCollapse(
              id = 'glossaryCollapse', open = 'PHASE', multiple = TRUE,
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_PHASE', 'PHASE')),
                p('Represents the phase of the league:'),
                tags$ul(
                  tags$li('RS: Regular Season'),
                  tags$li('PO: Play-off'),
                  tags$li('FF: Final Four')
                ),
                style = 'info',
                value = 'PHASE'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_CODETEAM', 'CODETEAM')),
                p('Abbreviation for each team.'),
                style = 'info',
                value = 'CODETEAM'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_GP', 'GP')),
                p('Total games played.'),
                style = 'info',
                value = 'GP'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_FG3M', 'FG3M')),
                p('Number of made 3-pointers.'),
                style = 'info',
                value = 'FG3M'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_FG3A', 'FG3A')),
                p('Number of attempted 3-pointers.'),
                style = 'info',
                value = 'FG3A'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_FG2M', 'FG2M')),
                p('Number of made 2-pointers.'),
                style = 'info',
                value = 'FG2M'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_FG2A', 'FG2A')),
                p('Number of attempted 2-pointers.'),
                style = 'info',
                value = 'FG2A'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_FTM', 'FTM')),
                p('Number of made free throws.'),
                style = 'info',
                value = 'FTM'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_FTA', 'FTA')),
                p('Number of attempted free throws.'),
                style = 'info',
                value = 'FTA'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_ASTD', 'ASTD')),
                p('Number of assists, including free throw assists.'),
                style = 'info',
                value = 'ASTD'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_TOV', 'TOV')),
                p('Number of turnovers.'),
                style = 'info',
                value = 'TOV'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_PTS', 'PTS')),
                p('Scored points.'),
                style = 'info',
                value = 'PTS'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_FG3PCT', 'FG3PCT')),
                p('Percentage of made three pointers.'),
                style = 'info',
                value = 'FG3PCT'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_FG2PCT', 'FG2PCT')),
                p('Percentage of made two pointers.'),
                style = 'info',
                value = 'FG2PCT'
              ),
              
              bsCollapsePanel(
                title = tagList(h3(id = 'ID_FTPCT', 'FTPCT')),
                p('Percentage of made free throws.'),
                style = 'info',
                value = 'FTPCT'
              )
            )
            
          )
          
        ),
        
        tabPanel(
          'Advanced',
          
          bsCollapse(
            id = 'glossaryCollapse2', open = 'POSS', multiple = TRUE,
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_PHASE', 'PHASE')),
              p('Represents the phase of the league:'),
              tags$ul(
                tags$li('RS: Regular Season'),
                tags$li('PO: Play-off'),
                tags$li('FF: Final Four')
              ),
              style = 'info',
              value = 'PHASE'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_CODETEAM', 'CODETEAM')),
              p('Abbreviation for each team.'),
              style = 'info',
              value = 'CODETEAM'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_POSSIMP', 'POSSIMP')),
              p(HTML('Represents the <i>possession importance</i>, which is quantified by 
                <i> how much a possession can swing the win probability </i>. 
                Allows you to filter garbage time, see which type of possessions 
                teams or players drive their stats from.')),
              tags$ul(
                tags$li('Low'),
                tags$li('Medium'),
                tags$li('High'),
                tags$li('Very High')
              ),
              style = 'info',
              value = 'POSSIMP'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_POSS', 'POSS')),
              p(HTML('Number of possessions. A <i>possession</i> ends when a team loses 
                the control of the ball either via a made shot, a missed shot followed by a defensive rebound, 
                a turnover. An offensive rebound does not end a possession, rather extends it.')),
              style = 'info',
              value = 'POSS'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_ORTG', 'ORTG')),
              p(HTML('Points per 75 possessions.')),
              style = 'info',
              value = 'ORTG'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_FG3M', 'FG3M')),
              p('Number of made 3-pointers.'),
              style = 'info',
              value = 'FG3M'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_FG3A', 'FG3A')),
              p('Number of attempted 3-pointers.'),
              style = 'info',
              value = 'FG3A'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_FG2M', 'FG2M')),
              p('Number of made 2-pointers.'),
              style = 'info',
              value = 'FG2M'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_FG2A', 'FG2A')),
              p('Number of attempted 2-pointers.'),
              style = 'info',
              value = 'FG2A'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_FTM', 'FTM')),
              p('Number of made free throws.'),
              style = 'info',
              value = 'FTM'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_FTA', 'FTA')),
              p('Number of attempted free throws.'),
              style = 'info',
              value = 'FTA'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_ASTD', 'ASTD')),
              p('Number of assists, including free throw assists.'),
              style = 'info',
              value = 'ASTD'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_PTS', 'PTS')),
              p('Scored points.'),
              style = 'info',
              value = 'PTS'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_FG3PCT', 'FG3PCT')),
              p('Percentage of made three pointers.'),
              style = 'info',
              value = 'FG3PCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_FG2PCT', 'FG2PCT')),
              p('Percentage of made two pointers.'),
              style = 'info',
              value = 'FG2PCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_FTMPCT', 'FTMPCT')),
              p('Percentage of made free throws.'),
              style = 'info',
              value = 'FTMPCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_EFG', 'EFG')),
              p('Effective field goal percentage, gives additional weight to 
                3-pointers since they worth more than 2-pointers.'),
              style = 'info',
              value = 'EFG'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_TSPCT', 'TSPCT')),
              p('True shooting percentage, accounts for free throws as well. It quantifies 
                the field goal percentage under the assumption that all points are made through 2-pointers. 
                In other words, what would the field goal percentage be if a player or team found them through 
                2-pointers.'),
              style = 'info',
              value = 'TSPCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_ASTPP', 'ASTPP')),
              p('Assists per possession.'),
              style = 'info',
              value = 'ASTPP'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_TOVPP', 'TOVPP')),
              p('Turnovers per possession.'),
              style = 'info',
              value = 'TOVPP'
            ),
            
            bsCollapsePanel(
              title = tagList(h3(id = 'ID_ASTTOTOV', 'ASTTOTOV')),
              p('Assist to turnover ratio.'),
              style = 'info',
              value = 'ASTTOTOV'
            )
          )
          
        )

        ),
        
        tabPanel(
          'Scoring',
          
        ),
        
        tabPanel(
          'By Zone',
          
        )
      )
    )
  )