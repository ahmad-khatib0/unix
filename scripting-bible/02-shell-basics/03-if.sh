#!/bin/bash
#

# If the command completes successfully (zero status code)
if pwd
then
  echo "it worked"
fi

user=$USER

if grep $user /etc/passwd; then
  echo "user is existed"
else 
  echo "user is not existed"
fi 

if grep $user /etc/passwd; then
  if [ 5 -gt 4 ]; then
    echo ls -al /home/$user/*.sh
  fi 
else
  echo "user is not existed"
fi

# else if
if [ 1 -gt 4 ]; then
  echo "how it come?" 
elif [4 -eq 4 ]; then
  echo "yes its 4"
else 
  echo "will not execute"
fi 


my_variable="Full"

if test $my_variable
then
  echo "The my_variable variable has content and returns a True."
  echo "The my_variable variable content is: $my_variable"
else
  echo "The my_variable variable doesn't have content,"
  echo "and returns a False."
fi

value1=10
value2=11
if [ $value1 -gt 5 ]; then
  echo "The test value $value1 is greater than 5."
fi

if [ $value1 -eq $value2 ]; then
  echo "The values are equal."
else
  echo "The values are different."
fi


# Keep in mind that the test comparison takes all punctuation and
# capitalization into account when comparing strings for equality.
testuser=christine
if [ $testuser = christine ]; then
  echo "The testuser variable contains: christine"
else
  echo "The testuser variable contains: $testuser"
fi

# Misusing string comparisons
string1=soccer
string2=zorbfootball
if [ $string1> $string2 ]; then
  echo "$string1 is greater than $string2"
else
  echo "$string1 is less than $string2"
fi
# ->>>> soccer is greater than zorbfootball
# why? The script interpreted the greater-than symbol as an output redirection
# Thus, it created a file called zorbfootball, So Because the redirection completed successfully, 
# the test condition returns a zero exit status code, which the if statement evaluates as though 
# things completed successfully!

# the solution is to escape >: if [ $string1 \> $string2 ]; then 

# another problem is that lowercase letters treated as bigger 
string1=Soccer
string2=soccer
if [ $string1 \> $string2 ]; then
  echo "$string1 is greater than $string2"
else
  echo "$string1 is less than $string2"
fi
# ->>> Soccer is less than soccer


string1=Soccer
string2=''
if [ -n $string1 ]; then
  echo "The string '$string1' is NOT empty"
else
  echo "The string '$string1' IS empty"
fi

if [ -z $string2 ]; then
  echo "The string '$string2' IS empty"
else
  echo "The string '$string2' is NOT empty"
fi

# NOTE: undefined variable is 0 in length!
if [ -z $string3 ]; then
  echo "The string '$string3' IS empty"
else
  echo "The string '$string3' is NOT empty"
fi

# Using file comparisons

jump_directory=/home/Torfa
if [ -d $jump_directory ]; then
  echo "The $jump_directory directory exists."
  cd $jump_directory
  ls
else
  echo "The $jump_directory directory does NOT exist."
fi

# Checking whether an object exists ( file or dir or ...)
location=$HOME
file_name="sentinel"
#
if [ -d $location ]; then
  echo "OK on the $location directory"
  echo "Now checking on the file, $file_name..."
  if [ -e $location/$file_name ]; then
    echo "OK on the file, $file_name."
    echo "Updating file's contents."
    date>> $location/$file_name
  else
    echo "File, $location/$file_name, does NOT exist."
    echo "Nothing to update."
  fi
else 
  echo "Directory, $location, does NOT exist."
  echo "Nothing to update."
fi 


if [ -d $HOME ] && [ -w $HOME/newfile ]; then
  echo "The file exists and you can write to it."
else
  echo "You cannot write to the file."
fi

# Single parentheses: allow you to use subshells in your if statement comparisons
# 
echo $BASH_SUBSHELL
if (echo $BASH_SUBSHELL)
then
  echo "The subshell command operated successfully."
else
  echo "The subshell command was NOT successful."
fi

# The double parentheses command allows you to incorporate advanced math formulas in your comparisons
val1=10
if (( $val1 ** 2> 90 )); then
  (( val2 = $val1 ** 2 ))
  echo "The square of $val1 is $val2,"
  echo "which is greater than 90."
fi

# Using double brackets for pattern matching
# 
if [[ $BASH_VERSION == 5.* ]]; then
  echo "You are using the Bash Shell version 5 series."
fi


case $USER in
rich | ahmad-khatib)
  echo "Welcome $USER"
  echo "Please enjoy your visit.";;
barbara | tim)
  echo "Hi there, $USER"
  echo "We're glad you could join us.";;
testing)
  echo "Please log out when done with test.";;
*)
  echo "Sorry, you are not allowed here."
esac



# If the package manager is found, a special Boolean variable for that
# particular manager is set to TRUE (1), and if not found, it is set to FALSE (0)
if (which rpm &> /dev/null); then
  item_rpm=1
  echo "You have the basic rpm utility."
else
  item_rpm=0
fi

if (which flatpak &> /dev/null); then
  item_flatpak=1
  echo "You have the flatpak application container."
else
  item_flatpak=0
fi

if (which dnf &> /dev/null); then
  item_dnfyum=1
  echo "You have the dnf package manager."
elif (which yum &> /dev/null); then
  item_dnfyum=1
  echo "You have the yum package manager."
else
  item_dnfyum=0
fi

redhatscore=$[$item_rpm + $item_dnfyum + $item_flatpak]
echo redhatscore is $redhatscore

if (which dpkg &> /dev/null); then
  item_dpkg=1
  echo "You have the basic dpkg utility."
else
  item_dpkg=0
fi
if (which apt &> /dev/null); then
  item_aptaptget=1
  echo "You have the apt package manager."
elif (which apt-get &> /dev/null); then
  item_aptaptget=1
  echo "You have the apt-get/apt-cache package manager."
else
  item_aptaptget=0
fi
if (which snap &> /dev/null); then
  item_snap=1
  echo "You have the snap application container."
else
  item_snap=0
fi

debianscore=$[$item_dpkg + $item_aptaptget + $item_snap]

if [ $debianscore -gt $redhatscore ]; then
  echo "Most likely your Linux distribution is Debian-based."
elif [ $redhatscore -gt $debianscore ]; then
  echo "Most likely your Linux distribution is RedHat-based."
else
  echo "Unable to determine Linux distribution base."
fi
