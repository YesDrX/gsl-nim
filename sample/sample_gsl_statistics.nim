import gsl/gsl_statistics
import strformat

var
    data = @[17.2, 18.1, 16.5, 18.3, 12.6]
    mean, variance, largest, smallest : cdouble

mean = gsl_stats_mean(data[0].addr, 1, 5)
variance = gsl_stats_variance(data[0].addr, 1, 5)
largest = gsl_stats_max(data[0].addr, 1, 5)
smallest = gsl_stats_min(data[0].addr, 1, 5)

echo fmt"data = {data}"
echo fmt"max = {largest}"
echo fmt"min = {smallest}"
echo fmt"variance = {variance}"
echo fmt"mean = {mean}"