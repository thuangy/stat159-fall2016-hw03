
# Read in the advertising data
advertising = read.csv("data/Advertising.csv")

# Perform the simple linear regression of Sales onto TV
tv_regression = lm(Sales~TV, advertising)
tv_reg_summary = summary(tv_regression)

# Save plot as png file
png("images/scatterplot-tv-sales.png", width = 800, height = 600)
plot(Sales~TV, advertising, pch=16, col="red", xlab="TV Budget (thousands of dollars)", ylab="Sales (thousands of units)", main="Sales Vs TV Budget for 200 Markets")
abline(tv_regression, col="blue")
dev.off()

# Perform the simple linear regression of Sales onto Radio
radio_regression = lm(Sales~Radio, advertising)
radio_reg_summary = summary(radio_regression)

# Save plot as png file
png("images/scatterplot-radio-sales.png", width = 800, height = 600)
plot(Sales~Radio, advertising, pch=16, col="red", xlab="Radio Budget (thousands of dollars)", ylab="Sales (thousands of units)", main="Sales Vs Radio Budget for 200 Markets")
abline(radio_regression, col="blue")
dev.off()

# Perform the simple linear regression of Sales onto Newspaper
news_regression = lm(Sales~Newspaper, advertising)
news_reg_summary = summary(news_regression)

# Save plot as png file
png("images/scatterplot-newspaper-sales.png", width = 800, height = 600)
plot(Sales~Newspaper, advertising, pch=16, col="red", xlab="Newspaper Budget (thousands of dollars)", ylab="Sales (thousands of units)", main="Sales Vs Newspaper Budget for 200 Markets")
abline(news_regression, col="blue")
dev.off()


# Multiple Regression
mult_regression = lm(Sales~TV+Radio+Newspaper, advertising)
mult_regression_summary = summary(mult_regression)

# Save residual plot as png file
png("images/residual-plot.png", width = 800, height = 600)
plot(mult_regression, which=1)
dev.off()

# Save scale-location plot as png file
png("images/scale-location-plot.png", width = 800, height = 600)
plot(mult_regression, which=3)
dev.off()

# Save scale-location plot as png file
png("images/normal-qq-plot.png", width = 800, height = 600)
plot(mult_regression, which=2)
dev.off()


# Save the regression objects to RData file
save(tv_regression, tv_reg_summary, radio_regression, radio_reg_summary, news_regression, news_reg_summary, file="data/regression.RData")
