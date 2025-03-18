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
            
            # Collapsible panels
            bsCollapse(
              id = 'glossaryCollapse', open = 'PHASE', multiple = TRUE,
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_PHASE', 'PHASE')),
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
                title = tagList(h4(id = 'ID_CODETEAM', 'CODETEAM')),
                p('Abbreviation for each team.'),
                style = 'info',
                value = 'CODETEAM'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_GP', 'GP')),
                p('Total games played.'),
                style = 'info',
                value = 'GP'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_FG3M', 'FG3M')),
                p('Number of made 3-pointers.'),
                style = 'info',
                value = 'FG3M'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_FG3A', 'FG3A')),
                p('Number of attempted 3-pointers.'),
                style = 'info',
                value = 'FG3A'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_FG2M', 'FG2M')),
                p('Number of made 2-pointers.'),
                style = 'info',
                value = 'FG2M'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_FG2A', 'FG2A')),
                p('Number of attempted 2-pointers.'),
                style = 'info',
                value = 'FG2A'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_FTM', 'FTM')),
                p('Number of made free throws.'),
                style = 'info',
                value = 'FTM'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_FTA', 'FTA')),
                p('Number of attempted free throws.'),
                style = 'info',
                value = 'FTA'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_ASTD', 'ASTD')),
                p('Number of assists, including free throw assists.'),
                style = 'info',
                value = 'ASTD'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_TOV', 'TOV')),
                p('Number of turnovers.'),
                style = 'info',
                value = 'TOV'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_PTS', 'PTS')),
                p('Scored points.'),
                style = 'info',
                value = 'PTS'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_FG3PCT', 'FG3_PCT')),
                p('Percentage of made three pointers.'),
                style = 'info',
                value = 'FG3_PCT'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_FG2PCT', 'FG2_PCT')),
                p('Percentage of made two pointers.'),
                style = 'info',
                value = 'FG2_PCT'
              ),
              
              bsCollapsePanel(
                title = tagList(h4(id = 'ID_FTPCT', 'FT_PCT')),
                p('Percentage of made free throws.'),
                style = 'info',
                value = 'FT_PCT'
              )
            )
            
          )
          
        ),
        
        tabPanel(
          'Advanced',
          
          bsCollapse(
            id = 'glossaryCollapse2', multiple = TRUE,
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PHASE', 'PHASE')),
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
              title = tagList(h4(id = 'ID_CODETEAM', 'CODETEAM')),
              p('Abbreviation for each team.'),
              style = 'info',
              value = 'CODETEAM'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_POSSIMP', 'POSS_IMP')),
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
              value = 'POSS_IMP'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_POSS', 'POSS')),
              p(HTML('Number of possessions. A <i>possession</i> ends when a team loses 
                the control of the ball either via a made shot, a missed shot followed by a defensive rebound, 
                a turnover. An offensive rebound does not end a possession, rather extends it.')),
              style = 'info',
              value = 'POSS'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_ORTG', 'ORTG')),
              p(HTML('Points per 75 possessions.')),
              style = 'info',
              value = 'ORTG'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG3M', 'FG3M')),
              p('Number of made 3-pointers.'),
              style = 'info',
              value = 'FG3M'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG3A', 'FG3A')),
              p('Number of attempted 3-pointers.'),
              style = 'info',
              value = 'FG3A'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG2M', 'FG2M')),
              p('Number of made 2-pointers.'),
              style = 'info',
              value = 'FG2M'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG2A', 'FG2A')),
              p('Number of attempted 2-pointers.'),
              style = 'info',
              value = 'FG2A'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FTM', 'FTM')),
              p('Number of made free throws.'),
              style = 'info',
              value = 'FTM'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FTA', 'FTA')),
              p('Number of attempted free throws.'),
              style = 'info',
              value = 'FTA'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_ASTD', 'ASTD')),
              p('Number of assists, including free throw assists.'),
              style = 'info',
              value = 'ASTD'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PTS', 'PTS')),
              p('Scored points.'),
              style = 'info',
              value = 'PTS'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG3PCT', 'FG3_PCT')),
              p('Percentage of made three pointers.'),
              style = 'info',
              value = 'FG3_PCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG2PCT', 'FG2_PCT')),
              p('Percentage of made two pointers.'),
              style = 'info',
              value = 'FG2_PCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FTMPCT', 'FTM_PCT')),
              p('Percentage of made free throws.'),
              style = 'info',
              value = 'FTM_PCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_EFG', 'EFG_PCT')),
              p('Effective field goal percentage, gives additional weight to 
                3-pointers since they worth more than 2-pointers.'),
              style = 'info',
              value = 'EFG_PCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_TSPCT', 'TS_PCT')),
              p('True shooting percentage, accounts for free throws as well. It quantifies 
                the field goal percentage under the assumption that all points are made through 2-pointers. 
                In other words, what would the field goal percentage be if a player or team found them through 
                2-pointers.'),
              style = 'info',
              value = 'TS_PCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_ASTPP', 'AST_PP')),
              p('Assists per possession.'),
              style = 'info',
              value = 'AST_PP'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_TOVPP', 'TOV_PP')),
              p('Turnovers per possession.'),
              style = 'info',
              value = 'TOV_PP'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_ASTTOTOV', 'AST_TOV')),
              p('Assist to turnover ratio.'),
              style = 'info',
              value = 'AST_TOV'
            )
          )
          
        ),
        
        tabPanel(
          'Scoring',
          
          bsCollapse(
            id = 'glossaryCollapse3', multiple = TRUE,
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PHASE', 'PHASE')),
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
              title = tagList(h4(id = 'ID_CODETEAM', 'CODETEAM')),
              p('Abbreviation for each team.'),
              style = 'info',
              value = 'CODETEAM'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_POSSIMP', 'POSS_IMP')),
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
              value = 'POSS_IMP'
            ),
            
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG3M', 'FG3M')),
              p('Number of made 3-pointers.'),
              style = 'info',
              value = 'FG3M'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG3A', 'FG3A')),
              p('Number of attempted 3-pointers.'),
              style = 'info',
              value = 'FG3A'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG3PCT', 'FG3_PCT')),
              p('Percentage of made three pointers.'),
              style = 'info',
              value = 'FG3_PCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PCTASTD3', 'PCT_ASTD_3')),
              p('Percentage of assisted made 3-pointers.'),
              style = 'info',
              value = 'PCT_ASTD_3'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG2M', 'FG2M')),
              p('Number of made 2-pointers.'),
              style = 'info',
              value = 'FG2M'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG2A', 'FG2A')),
              p('Number of attempted 2-pointers.'),
              style = 'info',
              value = 'FG2A'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG2PCT', 'FG2_PCT')),
              p('Percentage of made two pointers.'),
              style = 'info',
              value = 'FG2_PCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PCTASTD3', 'PCT_ASTD_2')),
              p('Percentage of assisted made 2-pointers.'),
              style = 'info',
              value = 'PCT_ASTD_2'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PCTFB', 'PCT_FASTBREAK')),
              p('Percentage of made field goals from fastbreak.'),
              style = 'info',
              value = 'PCT_FASTBREAK'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PCT2ND', 'PCT_2ND_CHANCE')),
              p('Percentage of made field goals from second chance.'),
              style = 'info',
              value = 'PCT_2ND_CHANCE'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PCTOFFTOV', 'PCT_OFF_TOV')),
              p('Percentage of made field goals off turnover.'),
              style = 'info',
              value = 'PCT_OFF_TOV'
            )
            
          )
        ),
        
        tabPanel(
          'By Zone',
          
          bsCollapse(
            id = 'glossaryCollapse4', multiple = TRUE,
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PHASE', 'PHASE')),
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
              title = tagList(h4(id = 'ID_CODETEAM', 'CODETEAM')),
              p('Abbreviation for each team.'),
              style = 'info',
              value = 'CODETEAM'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_SHOTZONEBASIC', 'SHOT_ZONE_BASIC')),
              p('Shot zones: '),
              tags$ul(
                tags$li('Above the Break 3'),
                tags$li('Corner 3'),
                tags$li('Mid-Range'),
                tags$li('Paint (non-RA)'),
                tags$li('Restricted Area')
              ),
              style = 'info',
              value = 'SHOT_ZONE_BASIC'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_SHOTZONEAREA', 'SHOT_ZONE_AREA')),
              p('Shot angles to the basket: '),
              tags$ul(
                tags$li('Center'),
                tags$li('Left'),
                tags$li('Left Center'),
                tags$li('Right'),
                tags$li('Right Center')
              ),
              style = 'info',
              value = 'SHOT_ZONE_AREA'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG3M', 'FG3M')),
              p('Number of made 3-pointers.'),
              style = 'info',
              value = 'FG3M'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG3A', 'FG3A')),
              p('Number of attempted 3-pointers.'),
              style = 'info',
              value = 'FG3A'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG3PCT', 'FG3_PCT')),
              p('Percentage of made three pointers.'),
              style = 'info',
              value = 'FG3_PCT'
            ),
            
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG2M', 'FG2M')),
              p('Number of made 2-pointers.'),
              style = 'info',
              value = 'FG2M'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG2A', 'FG2A')),
              p('Number of attempted 2-pointers.'),
              style = 'info',
              value = 'FG2A'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_FG2PCT', 'FG2_PCT')),
              p('Percentage of made two pointers.'),
              style = 'info',
              value = 'FG2_PCT'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_ASTDTOT', 'ASTD_TOT')),
              p('Number of assisted field goals.'),
              style = 'info',
              value = 'ASTD_TOT'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PCTASTD', 'PCT_ASTD')),
              p('Percentage of assisted field goals.'),
              style = 'info',
              value = 'PCT_ASTD'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PCTFB', 'PCT_FASTBREAK')),
              p('Percentage of made field goals from fastbreak.'),
              style = 'info',
              value = 'PCT_FASTBREAK'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PCT2ND', 'PCT_2ND_CHANCE')),
              p('Percentage of made field goals from second chance.'),
              style = 'info',
              value = 'PCT_2ND_CHANCE'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_PCTOFFTOV', 'PCT_OFF_TOV')),
              p('Percentage of made field goals off turnover.'),
              style = 'info',
              value = 'PCT_OFF_TOV'
            )
            
          )
        ),
        
        tabPanel(
          'Tools',
          
          bsCollapse(
            id = 'glossaryCollapse5', multiple = T,
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_SHOTCHART', 'HEX-BINNED_SHOT_CHART')),
              p('Quantifies the shot frequency with the size of the hexagons while colors express relative percentage versus the league average (position average, team average -- depending on your selection). With the selection of `On With` and/or `Without` features, you can restrict the plot to shots with certain players on the court and/or off the court. In addition, you can also filter possession importance for the shots as well by using the checkbox.'),
              style = 'info',
              value = 'ID_SHOTCHART'
            ),
            
            bsCollapsePanel(
              title = tagList(h4(id = 'ID_xPTS', 'EXPECTED_PTS')),
              p('Allows the user to see how many points a player adds compared to the league average. `PTS_ABOVE_X` expresses how many points a player scores, per shot attempt, over expected while `PTS_ADDED` quantifies the sum of total points scored over expected.'),
              style = 'info',
              value = 'ID_xPTS'
            )
          )
        )
        
        )
        
        
      )
    )
  )