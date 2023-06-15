fluidPage(
  sidebarLayout(
    sidebarPanel(
      numericInput("input1", "First Name Combo:", value = NULL, min = 100, max = 999),
      numericInput("input2", "Surname Combo:", value = NULL, min = 100, max = 999),
      p('Fore more information, please see:'),
      a(href="http://miracleofnames.org/fna/fnaframes.htm", "Miracle of Names")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("First names", dataTableOutput("filteredTable1")),
        tabPanel("Surnames", dataTableOutput("filteredTable2"))#,
        #tabPanel("Combined names", dataTableOutput("filteredTableCombined"))
      )
    )
  )
)