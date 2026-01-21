library(tidyverse)
library(vars)
library(gridExtra)

load(here::here("data", "clean_data.Rdata"))
load(here::here("results", "model_results.RData"))

# 1. Time Series Plot
p1 <- ggplot(final_ts_data, aes(x = date)) +
  geom_line(aes(y = gdp_growth, color = "GDP Growth")) +
  geom_line(aes(y = inflation, color = "Inflation")) +
  geom_line(aes(y = rate, color = "Fed Funds Rate")) +
  theme_minimal() +
  labs(title = "US Macroeconomic Variables (1960-Present)",
       y = "Percent (Annualized)", x = "", color = NULL) +
  scale_color_manual(values = c("blue", "red", "black"))

# 2. Impulse Response Plot
# Helper function to extract IRF data
extract_irf <- function(irf_obj, response_var) {
  period <- 0:(length(irf_obj$irf$rate[, response_var]) - 1)
  est <- irf_obj$irf$rate[, response_var]
  lower <- irf_obj$Lower$rate[, response_var]
  upper <- irf_obj$Upper$rate[, response_var]
  data.frame(period, est, lower, upper, response = response_var)
}

irf_gdp_data <- extract_irf(irf_rate, "gdp_growth")
irf_inf_data <- extract_irf(irf_rate, "inflation")
plot_data <- rbind(irf_gdp_data, irf_inf_data)

p2 <- ggplot(plot_data, aes(x = period, y = est)) +
  geom_line(color = "blue") +
  geom_ribbon(aes(ymin = lower, ymax = upper), alpha = 0.2, fill = "blue") +
  geom_hline(yintercept = 0, linetype = "dashed") +
  facet_wrap(~response, scales = "free_y", ncol = 1) +
  theme_minimal() +
  labs(title = "Response to 1% Shock in Fed Funds Rate",
       y = "Response", x = "Quarters after Shock")
