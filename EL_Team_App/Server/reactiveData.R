# TEAM OFF STATS

traditional_off_agg <- reactive({
  read.csv('Data/traditional_off_df_20250414.csv') %>%
    select(-X) %>%
    mutate(CODETEAM = as.factor(CODETEAM)) %>%
    arrange(CODETEAM)
})

advanced_off_agg <- reactive({
  read.csv('Data/advanced_off_df_20250414.csv') %>%
    select(-X) %>%
    mutate(POSS_IMP = factor(POSS_IMP,
                             c('Low', 'Medium', 'High', 'Very High', 'All')),
           CODETEAM = as.factor(CODETEAM)) %>%
    arrange(CODETEAM, POSS_IMP)
})

scoring_off_agg <- reactive({
  read.csv('Data/scoring_off_df_20250414.csv') %>%
    select(-X) %>%
    mutate(POSS_IMP = factor(POSS_IMP,
                             c('Low', 'Medium', 'High', 'Very High')),
           CODETEAM = as.factor(CODETEAM)) %>%
    arrange(CODETEAM, POSS_IMP)
})

byzone_off_agg <- reactive({
  read.csv('Data/byzone_off_df_20250414.csv') %>%
    select(-X) %>%
    mutate(SHOT_ZONE_BASIC = as.factor(SHOT_ZONE_BASIC),
           SHOT_ZONE_AREA = as.factor(SHOT_ZONE_AREA),
           CODETEAM = as.factor(CODETEAM)) %>%
    arrange(CODETEAM)
})

ff_agg <- reactive({
  read.csv('Data/ff_teams_20250508.csv') %>%
    select(-X) %>%
    mutate(POSS_IMP = factor(POSS_IMP,
                             c('Low', 'Medium', 'High', 'Very High', 'All')),
           CODETEAM = as.factor(CODETEAM),
           FT_RATE = round(FT_RATE, 3),
           OPP_FT_RATE = round(OPP_FT_RATE, 3)) %>%
    filter(POSS_IMP %in% c('Low', 'Medium', 'High', 'Very High', 'All')) %>%
    arrange(CODETEAM, desc(PHASE), desc(POSS_IMP))
})

# xPTS - PTS Above Expected

# xPTS_data <- reactive({
#   read.csv('Data/xPTS_tm_20250414.csv', stringsAsFactors = FALSE) %>% 
#     select(
#       CODETEAM,
#       tot_FGA, tot_PTS, tot_xPTS, eFG, xeFG, SM, PTS_Added
#     ) %>% 
#     mutate(
#       CODETEAM = as.factor(CODETEAM),
#       tot_xPTS = round(tot_xPTS, 1)
#     ) %>%
#     arrange(-PTS_Added) %>%
#     rename(
#       TEAM = CODETEAM,
#       # POSITION = Position,
#       FGA = tot_FGA,
#       SCORED_PTS = tot_PTS,
#       EXPECTED_PTS = tot_xPTS,
#       EFG_PCT = eFG,
#       xEFG_PCT = xeFG,
#       PTS_ABOVE_X = SM,
#       PTS_ADDED = PTS_Added
#     )
# })

shots_data <- reactive({
  read.csv('Data/df_fin_shots_20250414.csv') %>%
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
      !(REMAINING_TIME_IN_SECS <= 2 & shot_dist_ft > 40), 
      (shot_dist_ft < 40)
    )
})

players <- reactive({
  read.csv('Data/df_fin_shots_20250414.csv') %>%
    pull(PLAYER_TEAM) %>%
    unique() %>% sort()
})

teams <- reactive({
  read.csv('Data/df_fin_shots_20250414.csv') %>%
    pull(CODETEAM) %>%
    unique() %>% sort()
})

# TEAM DEF STATS

# traditional_def_agg <- reactive({
#   read.csv('Data/traditional_def_df_20250310.csv') %>%
#     select(-X)
# })
# 
# advanced_def_agg <- reactive({
#   read.csv('Data/advanced_def_df_20250310.csv') %>%
#     select(-X) %>%
#     mutate(POSS_IMP = factor(POSS_IMP,
#                              c('Low', 'Medium', 'High', 'Very High', 'All'))) %>%
#     arrange(Team, -POSS)
# })
# 
# scoring_def_agg <- reactive({
#   read.csv('Data/scoring_def_df_20250310.csv') %>%
#     select(-X) %>%
#     mutate(POSS_IMP = factor(POSS_IMP,
#                              c('Low', 'Medium', 'High', 'Very High')))
# })
# 
# byzone_def_agg <- reactive({
#   read.csv('Data/byzone_def_df_20250310.csv') %>%
#     select(-X) %>%
#     mutate(SHOT_ZONE_BASIC = as.factor(SHOT_ZONE_BASIC),
#            SHOT_ZONE_AREA = as.factor(SHOT_ZONE_AREA))
# })