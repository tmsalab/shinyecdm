fluidPage(
  title = 'Download a PDF report',
  sidebarLayout(
    sidebarPanel(
      helpText(),

      selectInput(inputId = "dataset",
                  label = "Choose a dataset:",
                  choices = c("trial_matrix")),

      # # Input: Select a file ----
      # fileInput("file1", "Choose CSV File",
      #           multiple = TRUE,
      #           accept = c("text/csv",
      #                      "text/comma-separated-values,text/plain",
      #                      ".csv")),
      # # Input: Checkbox if file has header ----
      # checkboxInput("header", "Header", TRUE),
      # Horizontal line ----
      tags$hr(),
      numericInput(inputId = "startk",
                   label = "Starting k dimension:",
                   value = 2),

      numericInput(inputId = "endk",
                   label = "End k dimension:",
                   value = 4),


      # Horizontal line ----
      tags$hr(),

      numericInput(inputId = "burnin",
                   label = "Burn In Length:",
                   value = 10000),



      numericInput(inputId = "chain_length",
                   label = "Chain Length:",
                   value = 20000),

      actionButton("go", "Model"),

      # Horizontal line ----
      tags$hr(),
      radioButtons('format', 'Document format', c('PDF', 'HTML', 'Word'),
                   inline = TRUE),
      downloadButton('downloadReport')
    ),
    mainPanel(
      plotOutput('regPlot')
    )
  )
)
