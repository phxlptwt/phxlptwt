# this is build.sh

echo "build started"

mkdir PhilipTjuatja524370990065
cd PhilipTjuatja524370990065

echo "building folders"
mkdir hw1
mkdir hw2
mkdir hw3
mkdir hw4

mkdir lab1
mkdir lab2
mkdir lab3
mkdir lab4
mkdir lab5
mkdir lab6

touch Readme.md

echo "building files"
cd hw1
touch ex1.m
touch ex2.m
touch ex3.m
touch ex4.m
touch ex5.m
touch ex6.m
touch ex7.m
touch Readme.md

cd ../hw2
touch ex1.m
touch ex2.m
touch ex3.m
touch ex4.m
touch ex5.m
touch ex6.m
touch ex7.m
touch Readme.md

cd ../hw3
touch ex1.m
touch ex2.m
touch ex3.m
touch ex4.m
touch ex5.m
cd ../hw4
touch Readme.md

cd ../lab2
touch ex1.m
touch ex2.m
touch ex3.m
touch ex4.m
touch ex5.m
touch ex6.m
touch Readme.md

cd ../lab3
touch ex1.m
touch ex2.m
touch ex3.m
touch ex4.m
touch ex5.m
touch ex6.m
touch Readme.md

cd ../lab4
touch ex1.m
touch ex2.m
touch ex3.m
touch ex4.m
touch directionVector.m
touch gravity.m
touch evolve.m
touch main.m
touch Readme.md

cd ../lab5
touch ex1.m
touch directionVector.m
touch gravity.m
touch evolve.m
touch main.m
touch mutualCrash.m
touch boundaryCrash.m
touch view.m
touch Readme.md

cd ../..
echo "build finished"

echo 'build cheater repo'
mkdir Cheater
cp -r PhilipTjuatja524370990065 Cheater