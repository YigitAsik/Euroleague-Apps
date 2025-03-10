##### Team O: TRADITIONAL #####

output$team_off_traditional <- renderDataTable({
  
  datatable(
    traditional_off_agg(),
    class = 'display compact order-column', # no wrap
    filter = 'top',
    rownames = F,
    
    options = list(
      paging = T,
      pageLength = 25,
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
      pageLength = 25,
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
      pageLength = 25,
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
      pageLength = 25,
      autoWidth = T,
      scrollX = T
    )
  )
  
})