# Read in the advertising data
advertising = read.csv("data/Advertising.csv")
# Create a summary table for TV budget
tv_sum = summary(advertising$TV)
# Create summary table for sales
sales_sum = summary(advertising$Sales)

# Write the summaries to output file
sink("data/eda-output.txt")
writeLines("TV Budget (in thousands of dollars) Summary\n")
tv_sum
writeLines("\nSales (in thousands of units) Summary\n")
sales_sum
sink()

# Save histogram of sales as a png
png("images/histogram-sales.png")
hist(advertising$Sales, xlab="Sales (thousands of units)", ylab="Number of Markets", main="Sales for 200 Different Markets")
dev.off()
# Save histogram of sales as a pdf
pdf("images/histogram-sales.pdf")
hist(advertising$Sales, xlab="Sales (thousands of units)", ylab="Number of Markets", main="Sales for 200 Different Markets")
dev.off()
# Save histogram of TV budget as a png
png("images/histogram-tv.png")
hist(advertising$TV, xlab="TV Budgets (thousands of dollars)", ylab="Number of Markets", main="TV Budgets for 200 Different Markets")
dev.off()
# Save histogram of TV budget as a pdf
pdf("images/histogram-tv.pdf")
hist(advertising$TV, xlab="TV Budgets (thousands of dollars)", ylab="Number of Markets", main="TV Budgets for 200 Different Markets")
dev.off()
