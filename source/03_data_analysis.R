# install.packages(c("vars", "stargazer"))
library(vars)
library(stargazer)

load(here::here("data", "clean_data.Rdata"))

# 1. Summary Statistics Table
# Select variables for the model
var_vars <- final_ts_data %>%
  dplyr::select(gdp_growth, inflation, rate)

# Create a summary dataframe
summary_stats <- data.frame(
  Variable = names(var_vars),
  Mean = apply(var_vars, 2, mean),
  SD = apply(var_vars, 2, sd),
  Min = apply(var_vars, 2, min),
  Max = apply(var_vars, 2, max)
)

write_csv(summary_stats, here::here("results", "summary_stats.csv"))


# 2. VAR Setup
# Convert to Time Series Object (ts) for the 'vars' package
ts_data <- ts(var_vars, start = c(1960, 2), frequency = 4)

# 3. Lag Selection
lag_select <- VARselect(ts_data, lag.max = 8, type = "const")
optimal_lag <- lag_select$selection["SC(n)"]

# 4. Estimate the VAR
var_model <- VAR(ts_data, p = optimal_lag, type = "const")

# 5. Compute Impulse Response Functions (IRF)
irf_rate <- irf(var_model, impulse = "rate", response = c("gdp_growth", "inflation"),
                n.ahead = 12, boot = TRUE, runs = 100)

save(var_model, irf_rate, lag_select, file = here::here("results","model_results.RData"))
