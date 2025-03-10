# TEAM OFF STATS

traditional_off_agg <- reactive({
  read.csv('Data/traditional_off_df_20250310.csv') %>%
    select(-X)
})

advanced_off_agg <- reactive({
  read.csv('Data/advanced_off_df_20250310.csv') %>%
    select(-X) %>%
    mutate(POSS_IMP = factor(POSS_IMP,
                             c('Low', 'Medium', 'High', 'Very High', 'All'))) %>%
    arrange(Team, -POSS)
})

scoring_off_agg <- reactive({
  read.csv('Data/scoring_off_df_20250310.csv') %>%
    select(-X) %>%
    mutate(POSS_IMP = factor(POSS_IMP,
                             c('Low', 'Medium', 'High', 'Very High')))
})

byzone_off_agg <- reactive({
  read.csv('Data/byzone_off_df_20250310.csv') %>%
    select(-X) %>%
    mutate(SHOT_ZONE_BASIC = as.factor(SHOT_ZONE_BASIC),
           SHOT_ZONE_AREA = as.factor(SHOT_ZONE_AREA))
})