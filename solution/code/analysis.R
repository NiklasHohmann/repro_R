library(admtools)
library(StratPal)

# constants
set.seed(42)
n_rep = 10000 # no of bootstrap repetitions

# read data
data = read.csv("data/raw/dummy_data.csv")

## helper functions
bootstrap_mean = function(x, rep){
  #' @description bootstraps mean values from a sample
  #' @param x sample
  #' @param rep no of bootstrap repetitions
  y = rep(NA, rep) # initialize storage
  for (i in seq_len(rep)){
    sam = sample(x, replace = TRUE)
    y[i] = mean(sam)
  }
  return(y)
}

bootstrap_sd = function(x, rep){
  #' @description bootstraps standard deviation values from a sample
  #' @param x sample
  #' @param rep no of bootstrap repetitions
  y = rep(NA, rep)
  for (i in seq_len(rep)){
    sam = sample(x, replace = TRUE)
    y[i] = sd(sam)
  }
  return(y)
}

conf_interval = function(x){
  #' @description determines 95 % confidence interval from bootstrap samples
  #' @param x bootstrap sample
  low_bound = quantile(x, 0.025)
  up_bound = quantile(x, 0.975)
  interval = c(low_bound, up_bound)
  return(interval)
}

# bootstrap means from sample
x1_bs_mean = bootstrap_mean(x = data$x1,
                            rep = n_rep)
x2_bs_mean = bootstrap_mean(x = data$x2,
                            rep = n_rep)
x3_bs_mean = bootstrap_mean(x = data$x3,
                            rep = n_rep)
# determine and store confidence intervals
conf_intervals_mean = list("x1" = conf_interval(x1_bs_mean),
                           "x2" = conf_interval(x2_bs_mean),
                           "x3" = conf_interval(x3_bs_mean))

## bootstrap standard deviation from samples
x1_bs_sd = bootstrap_sd(x = data$x1,
                        rep = n_rep)
x2_bs_sd = bootstrap_sd(x = data$x2,
                        rep = n_rep)
x3_bs_sd = bootstrap_sd(x = data$x3,
                        rep = n_rep)
# determine and store confidence intervals
conf_intervals_sd = list("x1" = conf_interval(x1_bs_sd),
                         "x2" = conf_interval(x2_bs_sd),
                         "x3" = conf_interval(x3_bs_sd))

save(x1_bs_sd,
     x2_bs_sd,
     x3_bs_sd,
     file = "data/bootstrap_sd.RData")