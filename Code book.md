---
title: "Code book"
author: "Marbo87"
date: "31 8 2020"
output: html_document
---

## Description of the tidy data set
The tidy data set 'averages' contains 81 columns (79 features + 2 labels: activity and subject) and 180 rows (observations).

### Row data: 
180 = 6 activities x 30 subjects.

Activities are labeled with a string: walking, walkingupstairs, walkingdownstairs, sitting, standing or laying

Subjects are numbered from 1 to 30.


### Column data:
The 79 variables are labeled as follows:
Measurements in the time domain begin with a 't'.
Measurements in the frequency domain begin with an 'f'.
Next the variables consist of the following abbreviations:
     
| Abbreviation     | Meaning       |
|:-----|:--------|
| acc              | acceleration    |
| gyro             | gyroscope     | 
| mag              | magnitude     | 
| mean             | mean value    | 
| std              | standard deviation | 
| meanfreq         | mean frequency     | 
| 'x', 'y' and 'z' | coordinate directions | 

e.g. tbodyaccmeanx: 
mean value of time signal of body acceleration in x-direction

### units
Variables with 'gyro' in their name have units of radians/second (except it also has 'jerk' in its name, see below).

Variables with 'acc' in their name have standard gravity units 'g' (except it also has 'jerk' in its name, see below).

Variables with 'jerk' have been derived in time, so the corresponding unit has an additional 'second' in the denominator.

This applies to both time and frequency domain variables, since the units do not change by application of an FFT.

More information is available at:
[website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


