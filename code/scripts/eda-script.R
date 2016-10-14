# Read in the advertising data
advertising = read.csv("data/Advertising.csv")
# Create a summary table for TV budget
tv_sum = summary(advertising$TV)
# Create summary table for Radio budget
radio_sum = summary(advertising$Radio)
# Create summary table for Newspaper budget
news_sum = summary(advertising$Newspaper)
# Create summary table for sales
sales_sum = summary(advertising$Sales)

# Correlation matrix
cor_mat = cor(advertising[, -1], advertising[, -1])

# Write the summaries to output file
sink("data/eda-output.txt")
writeLines("TV Budget (in thousands of dollars) Summary\n")
tv_sum
writeLines("\nRadio Budget (in thousands of dollars) Summary\n")
radio_sum
writeLines("\nNewspaper Budget (in thousands of dollars) Summary\n")
news_sum
writeLines("\nSales (in thousands of units) Summary\n")
sales_sum
writeLines("\nCorrelation Matrix\n")
cor_mat
sink()

# Save histogram of sales as a png
png("images/histogram-sales.png")
hist(advertising$Sales, xlab="Sales (thousands of units)", ylab="Number of Markets", main="Sales for 200 Different Markets")
dev.off()
# Save histogram of TV budget as a png
png("images/histogram-tv.png")
hist(advertising$TV, xlab="TV Budgets (thousands of dollars)", ylab="Number of Markets", main="TV Budgets for 200 Different Markets")
dev.off()
# Save histogram of TV budget as a png
png("images/histogram-radio.png")
hist(advertising$Radio, xlab="Radio Budgets (thousands of dollars)", ylab="Number of Markets", main="Radio Budgets for 200 Different Markets")
dev.off()
# Save histogram of Newspaper budget as a png
png("images/histogram-newspaper.png")
hist(advertising$Radio, xlab="Newspaper Budgets (thousands of dollars)", ylab="Number of Markets", main="Newspaper Budgets for 200 Different Markets")
dev.off()

# Save scatterplot matrix as a png
png("images/scatterplot-matrix.png")
pairs(advertising[, -1], main="Correlations Between TV, Radio, Newspaper, and Sales")
dev.off()

# Save the correlation matrix to RData file
save(cor_mat, file="data/correlation-matrix.RData")

