# load the source code of the functions to be tested
source("../functions/regression-functions.R")

# context with one test that groups expectations
context("Test for residual sum of squares") 

test_that("rss works as expected", {
  reg <- lm(mpg ~ disp + hp, data = mtcars)
  regsum <- summary(reg)
  
  expect_equal(residual_sum_squares(reg), sum(reg$residuals^2))
  expect_gte(residual_sum_squares(reg), 0)
  expect_type(residual_sum_squares(reg), 'double')
})

test_that("rss only takes in lm objects", {
  
  expect_error(residual_sum_squares(5))
  expect_error(residual_sum_squares(c(1, 2, 3)))
  expect_error(residual_sum_squares('a'))
  expect_error(residual_sum_squares(c('a', 'b', 'c')))
  expect_error(residual_sum_squares(TRUE))
  expect_error(residual_sum_squares(c(TRUE, FALSE, FALSE)))
})


# context with one test that groups expectations
context("Test for total sum of squares") 

test_that("tss works as expected", {
  reg <- lm(mpg ~ disp + hp, data = mtcars)
  regsum <- summary(reg)
  
  expect_equal(total_sum_squares(reg), sum((mtcars$mpg - mean(mtcars$mpg))^2))
  expect_gte(total_sum_squares(reg), 0)
  expect_type(total_sum_squares(reg), 'double')
})

test_that("tss only takes in lm objects", {
  
  expect_error(total_sum_squares(5))
  expect_error(total_sum_squares(c(1, 2, 3)))
  expect_error(total_sum_squares('a'))
  expect_error(total_sum_squares(c('a', 'b', 'c')))
  expect_error(total_sum_squares(TRUE))
  expect_error(total_sum_squares(c(TRUE, FALSE, FALSE)))
})

# context with one test that groups expectations
context("Test for R-squared statistic") 

test_that("r-squared works as expected", {
  reg <- lm(mpg ~ disp + hp, data = mtcars)
  regsum <- summary(reg)
  
  expect_equal(r_squared(reg), regsum$r.squared)
  expect_gte(r_squared(reg), 0)
  expect_lte(r_squared(reg), 1)
  expect_type(r_squared(reg), 'double')
})

test_that("r-squared only takes in lm objects", {
  
  expect_error(r_squared(5))
  expect_error(r_squared(c(1, 2, 3)))
  expect_error(r_squared('a'))
  expect_error(r_squared(c('a', 'b', 'c')))
  expect_error(r_squared(TRUE))
  expect_error(r_squared(c(TRUE, FALSE, FALSE)))
})

# context with one test that groups expectations
context("Test for F-statistic") 

test_that("f statistic works as expected", {
  reg <- lm(mpg ~ disp + hp, data = mtcars)
  regsum <- summary(reg)
  
  expect_equal(f_statistic(reg), unname(regsum$fstatistic[1]))
  expect_gte(f_statistic(reg), 0)
  expect_type(f_statistic(reg), 'double')
})

test_that("f statistic only takes in lm objects", {
  
  expect_error(f_statistic(5))
  expect_error(f_statistic(c(1, 2, 3)))
  expect_error(f_statistic('a'))
  expect_error(f_statistic(c('a', 'b', 'c')))
  expect_error(f_statistic(TRUE))
  expect_error(f_statistic(c(TRUE, FALSE, FALSE)))
})


# context with one test that groups expectations
context("Test for residual standard error") 

test_that("rse works as expected", {
  reg <- lm(mpg ~ disp + hp, data = mtcars)
  regsum <- summary(reg)
  
  expect_equal(residual_std_error(reg), regsum$sigma)
  expect_gte(residual_std_error(reg), 0)
  expect_type(residual_std_error(reg), 'double')
})

test_that("rse only takes in lm objects", {
  
  expect_error(residual_std_error(5))
  expect_error(residual_std_error(c(1, 2, 3)))
  expect_error(residual_std_error('a'))
  expect_error(residual_std_error(c('a', 'b', 'c')))
  expect_error(residual_std_error(TRUE))
  expect_error(residual_std_error(c(TRUE, FALSE, FALSE)))
})