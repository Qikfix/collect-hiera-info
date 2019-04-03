#!/bin/bash

list_files=$(locate *.pp | grep manifests)
DIR="/tmp/stage_hiera"
FILE="$DIR/standard.log"
RESULT="/tmp/custom-hiera-params.txt"

dir_call()
{
rm -rf $DIR
mkdir $DIR
>$FILE
}

csplit_call()
{
for b in $list_files
do
  echo "File $b" >>$FILE
  grep -E '(^class |^  \$)' $b >>$FILE
done

cd $DIR
csplit $FILE /^File/ {*}
}


no_class_call()
{
for b in $(ls -1 $DIR/xx*)
do
  grep ^class $b
  if [ $? -ne 0 ]; then
    echo "no class on file $b"
    echo "removing $b ..."
    rm -rf $b
  fi
done
}

no_char_call()
{
for b in $(ls -1 $DIR/xx*)
do
  grep ^class $b | grep \($
  if [ $? -ne 0 ]; then
    echo "Ending with { .. $b"
    echo "removing $b ..."
    rm -rf $b
  fi
done
}

parse_call()
{
for b in $(ls -1 $DIR/xx*)
do
  class_name=$(grep ^class $b | awk '{print $2}' | sed -e 's/($//g')
  sed -i '1i---' $b
  sed -i '3i Class name: '"$class_name"'' $b
  sed -i '4i-' $b
  sed -i 's/^  \$/'"${class_name}"'::/g' $b
  sed -i 's/  .*= /: /g' $b
  sed -i 's/ = /: /g' $b
  sed -i 's/,$//g' $b
  sed -i '/^class/d' $b
done
}

concat_call()
{
cat $DIR/xx* >$RESULT
echo "Check the result here - $RESULT"
}

# Main

dir_call
csplit_call
no_class_call
no_char_call
parse_call
concat_call
