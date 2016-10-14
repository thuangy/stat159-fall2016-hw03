# Calculates the residual sum of squares
# Takes in an lm object x and returns its rss
residual_sum_squares = function(x) {
  y = unname(x$model[,1])
  sum((y-unname(x$fitted.values))^2)
}

# Calculates the total sum of squares
# Takes in an lm object x and returns its tss
total_sum_squares = function(x) {
  y = unname(x$model[,1])
  sum((y - mean(y))^2)
}

# Calculates the R-squared statistic
# Takes in an lm object x and returns its R-squared statistic
r_squared = function(x) {
  1 - residual_sum_squares(x)/total_sum_squares(x)
}

# Calculates the F-Statistic
# Takes in an lm object x and returns the value of the F-statistic
f_statistic = function(x) {
  n = nrow(x$model)
  p = ncol(x$model) - 1
  ((total_sum_squares(x) - residual_sum_squares(x))/p)/(residual_sum_squares(x)/(n-p-1))
}

# Calculates the residual standard error
# Takes in an lm object x and returns its rse
residual_std_error = function(x) {
  n = nrow(x$model)
  p = ncol(x$model) - 1
  sqrt((1/(n-p-1)) * residual_sum_squares(x))
}

