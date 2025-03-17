install.packages("admtools")
install.packages("StratPal")

library(admtools)
library(StratPal)

setwd("C:/Users/JohnDoe/Documents/Sci/my_code")

data = read.csv("dummy_data.csv")

# bootstrapping means from sample
x = c()
for (i in 1:10000){
  da = data$x1
  sam = sample(da, replace = TRUE)
  m = mean(sam)
  x = c(x, m)
}
# 95 % confidence interval on bootstrap mean
low_bound = quantile(x, 0.025)
up_bound = quantile(x, 0.975)


x = c()
for (i in 1:10000){
  da = data$x2
  sam = sample(da, replace = TRUE)
  m = mean(sam)
  x = c(x, m)
}
# 95 % confidence interval on bootstrap mean
low_bound = quantile(x, 0.025)
up_bound = quantile(x, 0.975)

x = c()
for (i in 1:10000){
  da = data$x3
  sam = sample(da, replace = TRUE)
  m = mean(sam)
  x = c(x, m)
}
# 95 % confidence interval on bootstrap mean
low_bound = quantile(x, 0.025)
up_bound = quantile(x, 0.975)

# bootstrap standard deviation
x = c()
for (i in 1:10000){
  da = data$x1
  sam = sample(da, replace = TRUE)
  m = sd(sam)
  x = c(x, m)
}
pdf("sd_x1.pdf")
hist(x,
     xlab = "sd",
     main = "bootstrap standard deviation")
dev.off()
low_bound = quantile(x, 0.025)
up_bound = quantile(x, 0.975)


x = c()
for (i in 1:10000){
  da = data$x2
  sam = sample(da, replace = TRUE)
  m = sd(sam)
  x = c(x, m)
}
pdf("sd_x2.pdf")
hist(x,
     xlab = "sd",
     main = "bootstrap standard deviation")
dev.off()
low_bound = quantile(x, 0.025)
up_bound = quantile(x, 0.975)

x = c()
for (i in 1:10000){
  da = data$x3
  sam = sample(da, replace = TRUE)
  m = sd(sam)
  x = c(x, m)
}
pdf("sd_x3.pdf")
hist(x,
     xlab = "sd",
     main = "bootstrap standard deviation")
dev.off()
low_bound = quantile(x, 0.025)
up_bound = quantile(x, 0.975)


## plot a random walk
t = seq(0,2, by = 0.01)
rw = random_walk(t, sigma = 2)

pdf("random_walk.pdf")
plot(rw,
     type = "l",
     xlab = "Time [Myr]",
     ylab = "y",
     main = "Random Walk")
dev.off()

## plot age-depth model
adm = tp_to_adm(t = scenarioA$t_myr, h = scenarioA$h_m[,"2km"],
                T_unit = "Myr",
                L_unit = "m")
pdf("age-depth model.pdf")
plot(adm,
     col_destr = NA,
     lwd_acc = 3)
T_axis_lab()
L_axis_lab()
title(main = "Age-depth model")
dev.off()
