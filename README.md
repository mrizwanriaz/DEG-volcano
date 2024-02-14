# RShiny app for visualizing differentially expressed genes

<img width="1567" alt="Screenshot 2024-02-05 at 1 25 19 AM" src="https://github.com/mrizwanriaz/DEG-volcano/assets/77746474/635c501b-783c-4275-84bb-10f7c62d4416">

RShiny app is live at https://rizwanriaz.shinyapps.io/DEGs/

This RShiny app is designed to visualize differentially expressed genes using volcano plots. The app takes a _CSV_ file as input, which should contain three columns, i.e., _gene_, _log2FoldChange_, _padj_. The app then generates volcano plots to visualize the gene expression. 

Local Installation:
1. Install R on your system.
2. Install the required packages by running the following command in the R console:
   install.packages(c("shiny", "ggplot2", "dplyr"))
3. Download the RShiny app code from the GitHub repository.

Usage:
1. Run the R code file in the R/RStudio.
3. The app will open in the default web browser.
4. Upload the input CSV file in the app.
5. Customize the plot as per your requirements using the options provided.
6. Save the plot for future use.

Note: The input CSV file should have the exact column names as mentioned above. 

License:
This project is licensed under the MIT License. You can find more information in the LICENSE file in the GitHub repository.
