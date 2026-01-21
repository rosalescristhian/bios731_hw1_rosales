# Macroeconomic Analysis of US Monetary Policy

This project conducts a simple analysis of the dynamic relationship between US monetary policy (Federal Funds Rate) and real economic activity (GDP and Inflation) as an exercise for the BIOS 731: Advanced Statistical Computing class at Emory University. It utilizes a Vector Autoregression (VAR) framework to estimate Impulse Response Functions (IRFs) using quarterly data from 1960 to the present.

## 1. Dataset Description

The data is sourced directly from the **Federal Reserve Bank of St. Louis (FRED)** API.

* **Source:** [FRED Economic Data](https://fred.stlouisfed.org/)
* **Time Range:** 1960 Q1 – Present
* **Variables:**
    * **`GDPC1`**: Real Gross Domestic Product.
    * **`GDPDEF`**: GDP Implicit Price Deflator.
    * **`FEDFUNDS`**: Effective Federal Funds Rate.

## 2. Project Structure

The project is organized into modular scripts to ensure reproducibility.

### Folders
* **`source/`**: Contains all R scripts for the workflow.
* **`data/`**: Stores raw and processed data files.
* **`results/`**: Stores model outputs, summary statistics tables, and saved model objects.

### Scripts (`source/`)
* **`01_data_download.R`**: Downloads raw data from FRED and saves it to `data/raw_data.RData`.
* **`02_data_cleaning.R`**:
    * Aligns monthly interest rates to quarterly frequency (taking the mean).
    * Transforms GDP and Prices into Annualized Growth Rates.
* **`03_data_analysis.R`**:
    * Computes descriptive statistics.
    * Selects optimal lags using the Schwarz Criterion (SC).
    * Estimates the VAR model.
    * Calculates Orthogonalized Impulse Response Functions (IRF).
* **`04_data_visualization.R`**: Generatesm visualizations for the time series history and IRF results.

## 3. Session Info

To ensure exact reproducibility, the analysis was performed using the following environment.

<details>
<summary><strong>Click to expand Session Info</strong></summary>

R version 4.4.1 (2024-06-14 ucrt)

Platform: x86_64-w64-mingw32/x64 

Running under: Windows 11 x64 (build 26200)

Matrix products: default

Locale: 

[1] LC_COLLATE=Spanish_Ecuador.utf8   LC_CTYPE=Spanish_Ecuador.utf8    
[3] LC_MONETARY=Spanish_Ecuador.utf8  LC_NUMERIC=C                    
[5] LC_TIME=Spanish_Ecuador.utf8    

Time zone: America/New_York

Tzcode source: internal

Attached base packages:

[1] stats     graphics  grDevices utils     datasets  methods   base     

Other attached packages:

 [1] gridExtra_2.3              vars_1.6-1                 lmtest_0.9-40              
 [4] urca_1.3-4                 strucchange_1.5-4          sandwich_3.1-1             
 [7] MASS_7.3-60.2              timetk_2.9.1               PerformanceAnalytics_2.0.8 
[10] quantmod_0.4.28            TTR_0.24.4                 xts_0.14.1                 
[13] zoo_1.8-15                 tidyquant_1.0.11           lubridate_1.9.3           
[16] forcats_1.0.0              stringr_1.5.1              dplyr_1.1.4                
[19] purrr_1.0.2                readr_2.1.5                tidyr_1.3.1                
[22] tibble_3.2.1               ggplot2_3.5.1              tidyverse_2.0.0           

Loaded via a namespace (and not attached):

 [1] tidyselect_1.2.1    timeDate_4051.111   fastmap_1.2.0       digest_0.6.37       
 [5] rpart_4.1.23        timechange_0.3.0    lifecycle_1.0.4     survival_3.6-4      
 [9] magrittr_2.0.3      compiler_4.4.1      rlang_1.1.7         tools_4.4.1         
[13] utf8_1.2.4          yaml_2.3.10         data.table_1.16.0   knitr_1.48          
[17] bit_4.5.0           curl_7.0.0          here_1.0.2          withr_3.0.2         
[21] nnet_7.3-19         grid_4.4.1          fansi_1.0.6         colorspace_2.1-1    
[25] future_1.69.0       globals_0.18.0      scales_1.3.0        cli_3.6.5          
[29] crayon_1.5.3        rmarkdown_2.28      generics_0.1.3      rstudioapi_0.16.0   
[33] future.apply_1.20.1 tzdb_0.5.0          splines_4.4.1       parallel_4.4.1      
[37] vctrs_0.6.5         hardhat_1.4.2       Matrix_1.7-0        hms_1.1.3           
[41] bit64_4.0.5         RobStatTM_1.0.11    listenv_0.10.0      gower_1.0.2         
[45] recipes_1.3.1       glue_1.7.0          parallelly_1.46.1   codetools_0.2-20    
[49] rsample_1.3.1       stringi_1.8.4       gtable_0.3.5        quadprog_1.5-8      
[53] munsell_0.5.1       pillar_1.9.0        furrr_0.3.1         htmltools_0.5.8.1  
[57] ipred_0.9-15        lava_1.8.2          R6_2.6.1            rprojroot_2.1.1     
[61] vroom_1.6.5         evaluate_1.0.5      lattice_0.22-6      class_7.3-22        
[65] Rcpp_1.1.1          nlme_3.1-164        prodlim_2025.04.28  xfun_0.47           
[69] pkgconfig_2.0.3

</details>
