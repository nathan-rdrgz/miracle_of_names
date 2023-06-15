function(input, output) {
  
  
  # Data -----------------------------------------------------------------------
  # Filtered data for first name filter
  filteredData1 <- reactive({
    req(input$input1)
    firstDT[combo == NumToCombo(input$input1), .(name)]
  })
  
  # Filtered data for surname  filter
  filteredData2 <- reactive({
    req(input$input2)
    lastDT[combo == NumToCombo(input$input2), .(name)]
  })
  
  # Filtered data for first and last combined
  filteredDataCombined <- reactive({
    req(input$input1, input$input2)
    comboDT <- createCombinationTable(filteredData1(), filteredData2())
    comboDT
  })
  
  # Tables ---------------------------------------------------------------------
  # Display first filter table
  output$filteredTable1 <- DT::renderDT({
    filteredData1()[order(name)]
  },
  filter = "top",
  options = list(pageLength = 50,
                 dom = 'ltp'))
  
  # Display second filter table
  output$filteredTable2 <- DT::renderDT({
    filteredData2()[order(name)]
  },
  filter = "top",
  options = list(pageLength = 50,
                 dom = 'ltp'))
  
  # Display combined filters table
  #output$filteredTableCombined <- DT::renderDT({
  #  filteredDataCombined()
  #},
  #filter = "top",
  #options = list(pageLength = 50,
  #               dom = 'ltp'))
}