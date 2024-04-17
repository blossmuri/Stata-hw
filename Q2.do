import delimited "C:\Code_data\Stata hw\pizza_delivery.csv", clear

* a. Calculate the mean, median, minimum, maximum, first quartile, and third quartile for all quantitative variables.
summarize time temperature bill 

* b.
summarize time, detail
local time99 = r(p99)
display "99th percentile of delivery time: `time99'"

summarize temperature, detail
local temp99 = r(p99)
display "99th percentile of temperature: `temp99'"

* c.

summarize temperature
local mean_temp = r(mean)
gen abs_dev_mean = abs(temperature - `mean_temp')
summarize abs_dev_mean
local mean_abs_dev = r(mean)
display "Mean Absolute Deviation about the mean: `mean_abs_dev'"

summarize temperature, detail
local median_temp = r(p50)
gen abs_dev_median = abs(temperature - `median_temp')
summarize abs_dev_median
local median_abs_dev = r(mean)
display "Median Absolute Deviation about the median: `median_abs_dev'"


* d.
graph box time temperature, nooutsides

* e.
scatter temperature time
pwcorr temperature time
spearman temperature time
local time99 = r(p99)  
display "99th percentile of time: `time99'"
