# Euroleague Shiny App

This repo includes some of the source code for the Euroleague Shiny Apps that I currently have:
[Team Stats App](https://hooplytics.shinyapps.io/EL_Team_Stats/) consist of team-level offense and defense stats with four tabs: Traditional, Advanced, Scoring, By Zone.
[Player Stats App](https://hooplytics.shinyapps.io/EL_Player_Stats/) consist of player-level offense and defense stats with the same tabs with [Team Stats App](https://hooplytics.shinyapps.io/EL_Team_Stats/). However, there is also a *Tools* tab, which includes expected points (xPTS) and hex-binned shot chart tools.

## Tabs

### Traditional

Provides totals of traditional metrics such as points, assists etc. GP (games played) allows you to calculate *per game* stats easily.

### Advanced

Provides aggregated data over *possession importance*, which allows you to filter out *garbage time*, see which type of possessions teams drive their metrics from. Along with usual field goal percentages, advanced metrics are also included. Such as ORTG (offensive rating, per 75), TS_PCT (true shooting percentage), AST_PP (assist per possession), TOV_PP (turnover per possession).

### Scoring

Provides aggregated data over *possession importance*, while providing additional information related to scoring such as percentage of fastbreaks, second chance, off turnover field goals.

### By Zone

Provides aggregated data over shot zones and shot areas.

### Tools

Currently only available for players: 
1. Expected points (xPTS), which allows the user to see how many points a player adds per shot attempt compared to the league average player.
2. Hex-binned shot chart,  quantifies the shot frequency with the size of the hexagons while colors express relative percentage versus the league average (position average, team average -- depending on your selection). With the selection of On With and/or Without features, you can restrict the plot to shots with certain players on the court and/or off the court. In addition, you can also filter possession importance for the shots as well by using the checkbox.