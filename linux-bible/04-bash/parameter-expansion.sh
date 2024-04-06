
THIS="Example"

THIS=${THIS:-"Not Set"}

THAT=${THAT:-"Not Set"}

echo $THIS  # ->>>  Example

echo $THAT  # ->>> Not Set


MYFILENAME=/home/digby/myfile.txt: # Sets the value of MYFILENAME
FILE=${MYFILENAME##*/}:            # FILE becomes myfile.txt
DIR=${MYFILENAME%/*}:              # DIR becomes /home/digby
NAME=${FILE%.*}:                   # NAME becomes myfile
EXTENSION=${FILE##*.}:             # EXTENSION becomes txt

