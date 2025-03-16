# TEAM OFF STATS

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