##### Player O: TRADITIONAL #####

output$player_off_traditional <- renderDataTable({
  
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

##### Player O: ADVANCED #####

output$player_off_advanced <- renderDataTable({
  
  
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

##### Player O: SCORING #####

output$player_off_scoring <- renderDataTable({
  
  
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

##### Player O: By Zone #####

output$player_off_byzone <- renderDataTable({
  
  
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

output$xPTS <- renderDataTable({
  
  datatable(
    xPTS_data(),
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

##### Shot-chart #####

observe({
  req(players())
  
  updateSelectInput(session, inputId = 'player_name',
                    choices = players(), selected = 'LARKIN, SHANE - EFS')
  updateSelectInput(session, inputId = 'with',
                    choices = players())
  updateSelectInput(session, inputId = 'without',
                    choices = players())
})

observeEvent(input$plot, {
  ### Against LA ###
  
  if (input$against == 'League Avg.') {
    
    la <- shots_data() %>%
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
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  any_vars(. %in% input$with)) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  all_vars(!. %in% input$without))
      
    } else if (!is.null(input$without)) {
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  all_vars(!. %in% input$without))
      
    } else if (!is.null(input$with)) {
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  any_vars(. %in% input$with))
    } else {
      
      player_shots <-player_shots <- shots_data() %>%
        # mutate(players_caps = paste0(LastName, ', ', FirstName)) %>%
        filter(PLAYER_TEAM == input$player_name)
    }
    
    player_avgs <- player_shots %>%
      group_by(SHOT_ZONE_BASIC, SHOT_ZONE_AREA_2) %>%
      summarize(
        x = mean(coord_x_adj),
        y = mean(coord_y_adj),
        fg_pct = round(100 * (sum(FGM_FLAG) / n()), 1)
      )
    
    hex_data <- calculate_hexbins_from_shots(player_shots, la)
    
    output$Hexchart <- renderPlot({
      plotShothexbinLA(hex_data$hex_data) +
        geom_label(
          data = player_avgs %>%
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
        labs(title = paste(input$player_name),
             subtitle = '2024-25 Regular Season') +
        annotate('text', x = 0, y = 0.6, label = '@Hooplytics',
                 size = 8)
    }
    , height = 740
    )
    
  }
  
### Against TA ###
  else if (input$against == 'Team Avg.') {
    
    if ((!is.null(input$without)) & (!is.null(input$with))) {
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  any_vars(. %in% input$with)) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  all_vars(!. %in% input$without))
      
    } else if (!is.null(input$without)) {
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  all_vars(!. %in% input$without))
      
    } else if (!is.null(input$with)) {
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  any_vars(. %in% input$with))
    } else {
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name)
    }
    
    tm <- shots_data() %>%
      select(PLAYER_TEAM, CODETEAM) %>%
      filter(PLAYER_TEAM == input$player_name) %>%
      pull(CODETEAM) %>%
      unique()
    
    ta <- shots_data() %>%
      filter(CODETEAM == tm) %>%
      group_by(SHOT_ZONE_BASIC, SHOT_ZONE_AREA_2, SHOT_ZONE_DIST) %>%
      summarize(
        fga = n(),
        fgm = sum(FGM_FLAG),
        fg_pct = round(sum(FGM_FLAG) / n(), 3)
      ) %>%
      mutate(
        shot_value = case_when(
          SHOT_ZONE_BASIC %in% c('Above the Break 3', 'Corner 3') ~ 3,
          TRUE ~ 2)
      )
    
    player_avgs <- player_shots %>%
      group_by(SHOT_ZONE_BASIC, SHOT_ZONE_AREA_2) %>%
      summarize(
        x = mean(coord_x_adj),
        y = mean(coord_y_adj),
        fg_pct = round(100 * (sum(FGM_FLAG) / n()), 1)
      )
    
    hex_data <- calculate_hexbins_from_shots(player_shots, ta)
    
    output$Hexchart <- renderPlot({
      plotShothexbinTA(hex_data$hex_data) + 
        geom_label(
          data = player_avgs %>%
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
        labs(title = paste(input$player_name),
             subtitle = '2024-25 Regular Season') +
        annotate('text', x = 0, y = 0.6, label = '@Hooplytics',
                 size = 8)
    }
    , height = 740
    )
    
  }
  
  ### Against PA ###
  else {
    
    if ((!is.null(input$without)) & (!is.null(input$with))) {
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  any_vars(. %in% input$with)) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  all_vars(!. %in% input$without))
      
    } else if (!is.null(input$without)) {
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  all_vars(!. %in% input$without))
      
    } else if (!is.null(input$with)) {
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name) %>%
        filter_at(vars(Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
                       Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5),
                  any_vars(. %in% input$with))
    } else {
      
      player_shots <- shots_data() %>%
        filter(PLAYER_TEAM == input$player_name)
    }
    
    player_avgs <- player_shots %>%
      group_by(SHOT_ZONE_BASIC, SHOT_ZONE_AREA_2) %>%
      summarize(
        x = mean(coord_x_adj),
        y = mean(coord_y_adj),
        fg_pct = round(100 * (sum(FGM_FLAG) / n()), 1)
      )
    
    position <- shots_data() %>%
      select(PLAYER_TEAM, Position) %>%
      filter(PLAYER_TEAM == input$player_name) %>%
      pull(Position) %>%
      unique()
    
    pa <- shots_data() %>%
      filter(Position == position) %>%
      group_by(SHOT_ZONE_BASIC, SHOT_ZONE_AREA_2, SHOT_ZONE_DIST) %>%
      summarize(
        fga = n(),
        fgm = sum(FGM_FLAG),
        fg_pct = round(sum(FGM_FLAG) / n(), 3)
      ) %>%
      mutate(
        shot_value = case_when(
          SHOT_ZONE_BASIC %in% c('Above the Break 3', 'Corner 3') ~ 3,
          TRUE ~ 2)
      )
    
    hex_data <- calculate_hexbins_from_shots(player_shots, pa)
    
    output$Hexchart <- renderPlot({
      plotShothexbinPA(hex_data$hex_data) + 
        geom_label(
          data = player_avgs %>%
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
        labs(title = paste(input$player_name),
             subtitle = '2024-25 Regular Season') +
        annotate('text', x = 0, y = 0.6, label = '@Hooplytics',
                 size = 8)
    }
    , height = 740
    )
    
  }
  
})