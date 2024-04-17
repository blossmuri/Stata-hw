
input minutes
53 
49 
42 
26 
6 
39 
60 
10 
47 
2 
38 
74 
18 
52 
29 
11 
24 
21 
57 
42 
37 
17 
12 
18 
77 
25 
30 
2 
84 
20 
47 
15 
31 
11 
27 
95 
68 
42 
20 
15 
75 
27 
8 
31 
5 
4 
60 
30 
2 
end
gsort minutes
gen cum_count = _n

* a. Calculate ECDF for minute
gen total = _N
gen ecdf_minutes = cum_count / total



foreach t in 30 45 60 {
    summarize ecdf_minutes if minutes <= `t', detail
    local ecdf_value = r(max)
    display "ECDF at `t' minutes: `ecdf_value'"
}



* b. Calculate mean, median, quartiles
summarize minutes, detail

* c. Calculate Interquartile Range (IQR) and Var
egen q25 = pctile(minutes), p(25)
egen q75 = pctile(minutes), p(75)
generate iqr = q75 - q25
display "Interquartile Range (IQR): " iqr

local variance = r(Var)
display "Variance of minutes: " `variance'

* d. Plotting the Histogram
histogram minutes, title("Histogram of Time to First Goal")

* Plotting the ECDF
twoway (line ecdf_minutes minutes), title("Empirical CDF of Time to First Goal")

* Plotting the Box Plot
graph box minutes, title("Box Plot of Time to First Goal")
