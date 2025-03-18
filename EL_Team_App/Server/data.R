##### Team O: TRADITIONAL #####

output$team_off_traditional <- renderDataTable({
  
  datatable(
    traditional_off_agg(),
    class = 'display compact order-column', # no wrap
    filter = 'top',
    rownames = F,
    
    options = list(
      paging = T,
      pageLength = 20,
      autoWidth = T,
      scrollX = T
    )
  )
  
})

##### Team O: ADVANCED #####

output$team_off_advanced <- renderDataTable({
  
  
  datatable(
    advanced_off_agg(),
    class = 'display compact order-column', # no wrap
    filter = 'top',
    rownames = F,
    
    options = list(
      paging = T,
      pageLength = 20,
      autoWidth = T,
      scrollX = T
    )
  )
  
})

##### Team O: SCORING #####

output$team_off_scoring <- renderDataTable({
  
  
  datatable(
    scoring_off_agg(),
    class = 'display compact order-column', # no wrap
    filter = 'top',
    rownames = F,
    
    options = list(
      paging = T,
      pageLength = 20,
      autoWidth = T,
      scrollX = T
    )
  )
  
})

##### Team O: By Zone #####

output$team_off_byzone <- renderDataTable({
  
  
  datatable(
    byzone_off_agg(),
    class = 'display compact order-column', # no wrap
    filter = 'top',
    rownames = F,
    
    options = list(
      paging = T,
      pageLength = 20,
      autoWidth = T,
      scrollX = T
    )
  )
  
})

##### xPTS: PTS ABOVE EXPECTED #####

# output$xPTS <- renderDataTable({
#   
#   datatable(
#     xPTS_data(),
#     class = 'display compact order-column', # no wrap
#     filter = 'top',
#     rownames = F,
#     
#     options = list(
#       paging = T,
#       pageLength = 20,
#       autoWidth = T,
#       scrollX = T
#     )
#   )
#   
# })


##### Shot-chart #####

selected_team <- reactiveVal('EFS')

observe({
  req(teams())
  req(input$possBox)
  
  updateSelectInput(session, inputId = 'team_name',
                    choices = teams(), selected = 'EFS')
  updateSelectInput(session, inputId = 'with',
                    choices = players())
  updateSelectInput(session, inputId = 'without',
                    choices = players())
})

observeEvent(input$plot, {
  
  selected_team(input$team_name)
  ### Against LA ###
  la <- shots_data() %>%
    filter(
      poss_val_cat %in% input$possBox,
      CODETEAM != input$team_name
    ) %>%
    group_by(SHOT_ZONE_BASIC, SHOT_ZONE_AREA_2, SHOT_ZONE_DIST) %>%
    summarize(
      fga = n(),
      fgm = sum(FGM_FLAG),
      fg_pct = round(sum(FGM_FLAG) / n(), 3)
    ) %>%
    ungroup() %>%
    mutate(
      shot_value = case_when(
        SHOT_ZONE_BASIC %in% c('Above the Break 3', 'Corner 3') ~ 3,
        TRUE ~ 2)
    )
  
  if ((!is.null(input$without)) & (!is.null(input$with))) {
    
    team_shots <- shots_data() %>%
      filter(CODETEAM == input$team_name 
             & poss_val_cat %in% input$possBox) %>%
      filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                     Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                any_vars(. %in% input$with)) %>%
      filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                     Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                all_vars(!. %in% input$without))
    
  } else if (!is.null(input$without)) {
    
    team_shots <- shots_data() %>%
      filter(CODETEAM == input$team_name 
             & poss_val_cat %in% input$possBox) %>%
      filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                     Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                all_vars(!. %in% input$without))
    
  } else if (!is.null(input$with)) {
    
    team_shots <- shots_data() %>%
      filter(CODETEAM == input$team_name  
             & poss_val_cat %in% input$possBox) %>%
      filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                     Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                any_vars(. %in% input$with))
  } else {
    
    team_shots <- shots_data() %>%
      filter(CODETEAM == input$team_name 
             & poss_val_cat %in% input$possBox)
  }
  
  team_avgs <- team_shots %>%
    group_by(SHOT_ZONE_BASIC, SHOT_ZONE_AREA_2) %>%
    summarize(
      x = mean(coord_x_adj),
      y = mean(coord_y_adj),
      fg_pct = round(100 * (sum(FGM_FLAG) / n()), 1)
    )
  
  hex_data <- calculate_hexbins_from_shots(team_shots, la)
  
  output$Hexchart <- renderPlot({
    plotShothexbinLA(hex_data$hex_data) +
      geom_label(
        data = team_avgs %>%
          filter(
            SHOT_ZONE_BASIC %in% c('Above the Break 3', 'Corner 3') |
              (SHOT_ZONE_BASIC %in% c('Mid-Range')) & (SHOT_ZONE_AREA_2 %in% c('Left Center', 'Center', 'Right Center')) |
              (SHOT_ZONE_BASIC == 'Paint (non-RA)') & (SHOT_ZONE_AREA_2 %in% c('Left', 'Center', 'Right')) |
              (SHOT_ZONE_BASIC == 'Restricted Area') & (SHOT_ZONE_AREA_2 == 'Center')
          ),
        aes(
          x = x,
          y = y,
          label = paste0(as.character(fg_pct), '%')
        ),
        alpha = .75,
        size = 5
      ) +
      labs(title = paste(selected_team()),
           subtitle = '2024-25 Regular Season') +
      annotate('text', x = 0, y = 0.6, label = '@Hooplytics',
               size = 8)
  }
  , height = 740
  )
  
})

# ##### Team D: TRADITIONAL #####
# 
# output$team_def_traditional <- renderDataTable({
#   
#   datatable(
#     traditional_def_agg(),
#     class = 'display compact order-column', # no wrap
#     filter = 'top',
#     rownames = F,
#     
#     options = list(
#       paging = T,
#       pageLength = 20,
#       autoWidth = T,
#       scrollX = T
#     )
#   )
#   
# })
# 
# ##### Team D: ADVANCED #####
# 
# output$team_def_advanced <- renderDataTable({
#   
#   
#   datatable(
#     advanced_def_agg(),
#     class = 'display compact order-column', # no wrap
#     filter = 'top',
#     rownames = F,
#     
#     options = list(
#       paging = T,
#       pageLength = 20,
#       autoWidth = T,
#       scrollX = T
#     )
#   )
#   
# })
# 
# ##### Team D: SCORING #####
# 
# output$team_def_scoring <- renderDataTable({
#   
#   
#   datatable(
#     scoring_def_agg(),
#     class = 'display compact order-column', # no wrap
#     filter = 'top',
#     rownames = F,
#     
#     options = list(
#       paging = T,
#       pageLength = 20,
#       autoWidth = T,
#       scrollX = T
#     )
#   )
#   
# })
# 
# ##### Team D: By Zone #####
# 
# output$team_def_byzone <- renderDataTable({
#   
#   
#   datatable(
#     byzone_def_agg(),
#     class = 'display compact order-column', # no wrap
#     filter = 'top',
#     rownames = F,
#     
#     options = list(
#       paging = T,
#       pageLength = 20,
#       autoWidth = T,
#       scrollX = T
#     )
#   )
#   
# })