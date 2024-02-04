# Load required libraries
library(shiny)
library(EnhancedVolcano)
library(dplyr)

# Define the Shiny app
ui <- fluidPage(
  titlePanel("Visualize Differentially Expressed Genes"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload CSV file (must contain gene, log2FoldChange, padj columns)", accept = ".csv"),
      sliderInput("padj_threshold", "p.adjusted Threshold", min = 0, max = 0.15, value = 0.1, step = 0.01)
    ),
    mainPanel(
      plotOutput("volcano_plot")
    )
  )
)

server <- function(input, output, session) {
  # Reactive function to read uploaded file
  uploaded_data <- reactive({
    req(input$file)
    read.csv(input$file$datapath, stringsAsFactors = FALSE)
  })
  
  filtered_genes_data <- reactive({
    req(uploaded_data())
    uploaded_data() %>%
      filter(padj <= input$padj_threshold)
  })
  
  output$volcano_plot <- renderPlot({
    EnhancedVolcano(filtered_genes_data(),
                    lab = filtered_genes_data()$gene,
                    x = 'log2FoldChange',
                    y = 'padj',
                    title = "Volcano Plot of Differentially Expressed Genes",
                    pCutoff = input$padj_threshold,
                    FCcutoff = 1)
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
