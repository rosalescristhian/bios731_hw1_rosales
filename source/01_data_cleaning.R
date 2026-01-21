library(timetk)
library(lubridate)
library(tidyverse)

# load raw data
load(here::here("data", "raw.Rdata"))


# 1. Pivot and Aggregate
# We align the monthly Fed Funds Rate to Quarterly by taking the mean of the quarter.
# GDP and Deflator are already quarterly
clean_data <- raw_data %>%
  mutate(quarter_date = floor_date(date, "quarter")) %>%
  pivot_wider(names_from = symbol, values_from = price) %>%
  group_by(quarter_date) %>%
  summarise(
    RealGDP = mean(GDPC1, na.rm = TRUE),
    Deflator = mean(GDPDEF, na.rm = TRUE),
    FedFunds = mean(FEDFUNDS, na.rm = TRUE)
  ) %>%
  drop_na() %>%
  rename(date = quarter_date)

# 2. Variable Transformations for VAR
# We will create Log Levels and Growth Rates (First Differences).
final_ts_data <- clean_data %>%
  mutate(
    ln_gdp = log(RealGDP),
    ln_price = log(Deflator),
    gdp_growth = 400 * (ln_gdp - lag(ln_gdp)),
    inflation  = 400 * (ln_price - lag(ln_price)),
    rate = FedFunds
  ) %>%
  drop_na()

save(final_ts_data, file =  here::here("data", "clean_data.Rdata"))
