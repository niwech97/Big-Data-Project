#
# simulate data
#

nA <- 40 # has to be an even number
nB <- 40 # this can be any positive integer

# step 1 the data
A <- c(rnorm(nA/2, 5, 2), rnorm(nA/2, 15, 2))
hist(A)
mean(A)
abline(v=mean(A), col = "red")
# bimodal distribution!
B <- rnorm(40, 20, 2)
hist(B)
mean(B)

# add to data frame
data <- cbind.data.frame(rep(c("A", "B"), c(nA, nB)), c(A, B))
colnames(data) <- c("group", "size")
str(data)

model.1 <- lm(data$size ~ data$group)
summary(model.1)
model.1$coefficients
model.1$coefficients[1]
# look at different model assumptions
plot(model.1)

#
#
#

# look at regression
A.sort <- sort(A,decreasing = FALSE)
B.sort <- sort(B,decreasing = FALSE)
plot(A.sort, B.sort, col = "red", pch = 16, las = 1 )
# regression analysis, assuming A is the explanatory variable, B is the response
model.regr.1 <- lm(B.sort ~ A.sort)
summary(model.regr.1)
# plot the regression line through the plot
abline(model.regr.1)


