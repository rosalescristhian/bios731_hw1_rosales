#install.packages("tidyquant")
library(tidyquant)

# Define variables (FRED Codes)
# GDPC1    = Real Gross Domestic Product (Quarterly)
# GDPDEF   = GDP Implicit Price Deflator (Quarterly)
# FEDFUNDS = Federal Funds Effective Rate (Monthly)
tickers <- c("GDPC1", "GDPDEF", "FEDFUNDS")


# Download data starting from 1960
raw_data <- tq_get(tickers,
                   get = "economic.data",
                   from = "1960-01-01")

# Save raw data
save(raw_data, file = here::here("data", "raw.Rdata"))
