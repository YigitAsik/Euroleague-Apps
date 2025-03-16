# PLAYER OFF STATS

traditional_off_agg <- reactive({
  read.csv('Data/player_traditional_off_df_20250315.csv') %>%
    select(-X) %>%
    mutate(
      PHASE = as.factor(PHASE),
      CODETEAM = as.factor(CODETEAM),
      PLAYER = as.factor(PLAYER)
    )
})

advanced_off_agg <- reactive({
  read.csv('Data/player_advanced_off_df_20250315.csv') %>%
    select(-X) %>%
    mutate(
      PHASE = as.factor(PHASE),
      CODETEAM = as.factor(CODETEAM),
      PLAYER = as.factor(PLAYER),
      poss_val_cat = factor(poss_val_cat,
                            c('Low', 'Medium', 'High', 'Very High', 'All'))
    ) %>%
    rename(POSS = raw_USG,
           POSS_IMP = poss_val_cat) %>%
    arrange(PLAYER, -POSS)
})

scoring_off_agg <- reactive({
  read.csv('Data/player_scoring_off_df_20250315.csv') %>%
    select(-X) %>%
    mutate(
      PHASE = as.factor(PHASE),
      CODETEAM = as.factor(CODETEAM),
      PLAYER = as.factor(PLAYER),
      poss_val_cat = factor(poss_val_cat,
                            c('Low', 'Medium', 'High', 'Very High'))
    ) %>%
    rename(POSS_IMP = poss_val_cat)
})

byzone_off_agg <- reactive({
  read.csv('Data/player_byzone_off_df_20250315.csv') %>%
    select(-X) %>%
    mutate(
      PHASE = as.factor(PHASE),
      CODETEAM = as.factor(CODETEAM),
      PLAYER = as.factor(PLAYER),
      SHOT_ZONE_BASIC = as.factor(SHOT_ZONE_BASIC),
      SHOT_ZONE_AREA = as.factor(SHOT_ZONE_AREA)
    )
})

# xPTS - PTS Above Expected

xPTS_data <- reactive({
  read.csv('Data/xPTS_20250315.csv', stringsAsFactors = FALSE) %>% 
    select(
      PLAYER, TEAM, # Position,
      tot_FGA, tot_PTS, tot_xPTS, eFG, xeFG, SM, PTS_Added
    ) %>% 
    mutate(
      PLAYER = as.factor(PLAYER),
      TEAM = as.factor(TEAM)
    ) %>%
    arrange(-PTS_Added) %>%
    rename(
      PLAYER = PLAYER,
      TEAM = TEAM,
      # POSITION = Position,
      FGA = tot_FGA,
      SCORED_PTS = tot_PTS,
      EXPECTED_PTS = tot_xPTS,
      EFG_PCT = eFG,
      xEFG_PCT = xeFG,
      PTS_ABOVE_X = SM,
      PTS_ADDED = PTS_Added
    )
})

# SHOTS DATA

shots_data <- reactive({
  read.csv('Data/df_fin_shots_20250315.csv') %>%
    filter(!is.na(shot_value)) %>%
    select(
      Gamecode, CODETEAM, PLAYER_ID, PLAYTYPE.x, REMAINING_TIME_IN_SECS,
      COORD_X, COORD_Y, coord_x_adj, coord_y_adj, shot_dist_ft,
      SHOT_ZONE_BASIC, SHOT_ZONE_AREA, SHOT_ZONE_DIST, SHOT_ZONE_AREA_2, 
      SHOT_TYPE, SHOT_ANGLE, PLAYER, Position, PLAYER_TEAM, POSS_FOR_PLAYER_TEAM,
      Team_A, Lineup_A1, Lineup_A2, Lineup_A3, Lineup_A4, Lineup_A5,
      Team_B, Lineup_B1, Lineup_B2, Lineup_B3, Lineup_B4, Lineup_B5,
      OFF_AST, AST_PLAYER, FGA_FLAG, FGM_FLAG, shot_value, poss_val_cat
    ) %>%
    filter(
      !(REMAINING_TIME_IN_SECS <= 2 & shot_dist_ft > 40)
    )
})

players <- reactive({
  read.csv('Data/df_fin_shots_20250315.csv') %>%
    pull(PLAYER_TEAM) %>%
    unique() %>% sort()
})