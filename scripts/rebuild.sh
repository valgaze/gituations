#!/usr/bin/env bash

cd ..


## Need some way to guarantee we're in a folder called gituationks
## Also check if git is installed
echo $PWD -----we need to do something about this-----
echo 1234

root=$PWD

function gl() {
  git log
}

function gaa() {
  git add . && git commit -m "$@"
}
function gco() {
  git checkout $@
}

function killBranch() {
  git branch -D $1
}

function amplify() {
  echo "################################################"
  echo "#"
  echo "#"
  echo "#  $@"
  echo "#"
  echo "#"
  echo "################################################"
}

## Clear existing
killBranch ex/1
killBranch ex/2
killBranch ex/3

amplify "Generating ex1..."
gco master && gco -b ex/1

cat > $root/ex1.txt <<EOL

A bunch of wonderful example 1 stuff

EOL
gaa "Ex1, fix thizzz typo!"


amplify "Generating ex2..."
gco master && gco -b ex/2
touch $root/ex2.txt
array=( a b c d e)
target=c
for i in "${array[@]}"
do
echo $i >>$root/ex2.txt
if [ "$i" == "$target" ]; then
  gaa "Added $i, there is something important on this commit"
else
  gaa "Added $i"
fi
done
echo "Ex2, squash commits up to a and replace the final commit message with 'Ex2, Added a bunch of letters'" >> $root/ex2.txt
gaa "Ex2, squash those commits"

amplify "Generating ex3..."
gco master && gco -b ex/3

cat > $root/ex3.js <<EOL

let num = 1;

if (num === 2) {
  console.log('Fires correctly?');
}

EOL
gaa "Ex3, initial scaffolding"


cat > $root/ex3.js <<EOL

let num = 1;
num++;
if (num === 2) {
  console.log('Fires correctly?');
}

EOL
gaa "Ex3, working version"

cat > $root/ex3.js <<EOL

let num = 1;
num + 100;
if (num === 2) {
  console.log('Fires correctly?');
}

EOL
gaa "Ex3, Something's broken..."
echo WOrk DUDE

gco master
amplify "Operation Complete. Run $ git branch to see all branches"

git branch -a
