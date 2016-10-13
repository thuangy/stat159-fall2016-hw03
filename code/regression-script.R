
# Read in the advertising data
advertising = read.csv("data/Advertising.csv")

# Perform the simple linear regression
regression = lm(Sales~TV, advertising)
reg_summary = summary(regression)

# Save plot as png file
png("images/scatterplot-tv-sales.png", width = 800, height = 600)
plot(Sales~TV, advertising, pch=16, col="red", xlab="TV Budget (thousands of dollars)", ylab="Sales (thousands of units)", main="Sales Vs TV Budget for 200 Markets")
abline(regression, col="blue")
dev.off()

# Save plot as a pdf file
pdf("images/scatterplot-tv-sales.pdf")
plot(Sales~TV, advertising, pch=16, col="red", xlab="TV Budget (thousands of dollars)", ylab="Sales (thousands of units)", main="Sales Vs TV Budget for 200 Markets")
abline(regression, col="blue")
dev.off()

# Save the regression objects to RData file
save(regression, reg_summary, file="data/regression.RData")
