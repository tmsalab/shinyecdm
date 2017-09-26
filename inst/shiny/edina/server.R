library("ecdm")

function(input, output) {

  data_set <- reactive({
    # req(input$file1)
    #
    # read.csv(input$file1$datapath,
    #           header = input$header)

    switch(input$dataset,
           "trial_matrix" = as.matrix(tmsadata::trial_matrix))

  })



  model_info = eventReactive(input$go, {
     auto_edina(data_set(),
           k = c(input$startk:input$endk),
           burnin = input$burnin, chain_length = input$chain_length)
  })

  output$regPlot <- renderPlot({
    autoplot(model_info())
  })

  output$downloadReport <- downloadHandler(
    filename = function() {
      paste('my-report', sep = '.', switch(
        input$format, PDF = 'pdf', HTML = 'html', Word = 'docx'
      ))
    },

    content = function(file) {
      src <- normalizePath(system.file("shiny", "edina", 'report.Rmd', package = "shinyecdm"))

      # temporarily switch to the temp dir, in case you do not have write
      # permission to the current working directory
      owd <- setwd(tempdir())
      on.exit(setwd(owd))
      file.copy(src, 'report.Rmd', overwrite = TRUE)

      library(rmarkdown)
      out <- render('report.Rmd',
                  switch(
                    input$format,
                    PDF  = pdf_document(),
                    HTML = html_document(),
                    Word = word_document()
      ))
      file.rename(out, file)
    }
  )

}
