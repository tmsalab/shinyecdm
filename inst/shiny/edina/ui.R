fluidPage(
  title = 'Download a PDF report',
  sidebarLayout(
    sidebarPanel(
      helpText(),

      # selectInput(inputId = "dataset",
      #             label = "Choose a dataset:",
      #             choices = c("trial_matrix")),

      # # Input: Select a file ----
      fileInput('datafile', 'Choose file to upload',
                accept = c(
                  'text/csv',
                  'text/comma-separated-values',
                  'text/tab-separated-values',
                  'text/plain',
                  '.csv',
                  '.tsv',
                  '.txt'
                )
      ),
      tags$hr(),
      # # Input: Checkbox if file has header ----
      checkboxInput('header', 'Variable Names Included', FALSE),
      # # Input: Radio Buttons if has a separate different than = ' ' ----
      radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';',
                     Tab='\t',
                     Space=' '),
                   ' '),
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
