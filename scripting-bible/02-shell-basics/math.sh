#!/bin/bash

# Performing Math
# 
# You have two ways to perform mathematical operations in your shell scripts.
# Using the expr command
expr 1 + 5
expr 4 \* 4

var1=10
var2=20
var3=$(expr $var2 / $var1)
echo The result is $var3
# so To assign the result of a mathematical equation to a variable, you have to
# use command substitution to extract the output from the expr command! 

# Fortunately, the Bash shell has an improvement for processing mathematical operators: 
# Using brackets   ($[ operation ])
#

var1=$[4 * 5]
echo $var1

var4=$[$var1 * ($var2 - $var3)]
echo $var4

# The Bash shell mathematical operators support only integer arithmetic. This is a huge 
# limitation if you're trying to do any sort of real-world mathematical calculations.
var1=100
var2=45
var3=$[$var1 / $var2]
echo $var3  # ->>>  2  only! 


# A floating-point solution
# $ bc -q
# 3.44 / 5
# 0
# scale=4
# 3.44 / 5
# .6880
#
# In addition to normal numbers, the Bash calculator understands variables:
# bc -q
# var1=10
# var1 * 4           ->> 40
# var2 = var1 / 5
# print var2         ->> 2
#

# Using bc in scripts
var1=$(echo " scale=4; 3.44 / 5" | bc)
echo "using bc: \$(echo \" scale=4; 3.44 / 6\" | bc)  ->>> output is: " $var1

var3=$(echo "scale=4; $var1 / $var2" | bc)
echo $var3

# long calculation
var1=10.46
var2=43.67
var3=33.2
var4=71

var5=$(bc << EOF
scale=4
a1=($var1 * $var2)
b1=($var3 * $var4)
a1 + b1
EOF
)

# NOTE: the indention, otherwise it won't work
echo The final answer for the long calculation mess is $var5


# exit code 
# You should be careful with this feature, however — the exit status codes
# can only go up to 255. Watch what happens in this example:
var1=10
var2=30
var3=$[ $var1 * var2 ]

# exit $var3
# 
# then: $ echo $?   ->>>>  44
# The exit status code is reduced to fit in the 0 to 255 range. The shell does this by using 
# modulo arithmetic. The modulo of a value is the remainder after a division. The resulting 
# number is the remainder of the specified number divided by 256. In the case of 300 (the result), 
# the remainder is 44, which is what appears as the exit status code. 

# a Practical Example
#
date1="Jan 1, 2020"
date2="May 1, 2020"

time1=$(date -d "$date1" +%s)  # -d epoch in seconds
time2=$(date -d "$date2" +%s)

# then
# (we could use the bc, but since we're working with integer values expr will work just fine for us)

diff=$(expr $time2 - $time1)
secondsinday=$(expr 24 \* 60 \* 60)
days=$(expr $diff / $secondsinday)
echo "The difference between $date2 and $date1 is $days days"
# The difference between May 1, 2020 and Jan 1, 2020 is 120 days
