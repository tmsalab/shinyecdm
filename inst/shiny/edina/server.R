library("edina")

# By default, the file size limit is 5MB. Change it via:
# options(shiny.maxRequestSize = 9*1024^2)
# So, 9 MB is the new limit

function(input, output) {

  data_set = eventReactive(input$go, {
    infile = input$datafile

    # No file detected
    if (is.null(infile)) {
      return(NULL)
    }
    d = edmcore::read_item_matrix(infile$datapath,
                         header = input$header,
                         sep = input$sep)
  })

  model_info = eventReactive(input$go, {
    auto_edina(
        data_set(),
        k = c(input$startk:input$endk),
        burnin = input$burnin,
        chain_length = input$chain_length
      )
  })

  output$regPlot = renderPlot({
    edina:::autoplot.auto_edina(model_info())
  })

  output$downloadReport = downloadHandler(
    filename = function() {
      paste('my-report', sep = '.', switch(
        input$format, PDF = 'pdf', HTML = 'html', Word = 'docx'
      ))
    },

    content = function(file) {
      src = normalizePath(system.file("shiny", "edina", 'report.Rmd', package = "shinyecdm"))

      # temporarily switch to the temp dir, in case you do not have write
      # permission to the current working directory
      owd = setwd(tempdir())
      on.exit(setwd(owd))
      file.copy(src, 'report.Rmd', overwrite = TRUE)

      library(rmarkdown)
      out = render('report.Rmd',
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
