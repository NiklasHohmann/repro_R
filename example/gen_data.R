# create example data set for the dummy code
set.seed(42)

n_samples = 100

norm_mix = function(n, mu1, mu2, sd1, sd2, prop){
  # mixture of normal distrubutions
  lam = rbinom(n, 1, prop)
  x = rnorm(n, mu1, sd1) * lam + rnorm(n, mu2, sd2) * (1-lam)
  return(x)
}

data = data.frame(
  x1 = norm_mix(n = n_samples, mu1 = 1, mu2 = 5, sd1 = 2, sd2 = 1, prop = 0.3),
  x2 = norm_mix(n = n_samples, mu1 = -2, mu2 = 2, sd1 = 0.2, sd2 = 3, prop = 0.5),
  x3 = norm_mix(n = n_samples, mu1 = 3, mu2 = 4.5, sd1 = 2, sd2 = 4, prop = 0.7)
)

write.csv(data, file = "example/dummy_data.csv")
