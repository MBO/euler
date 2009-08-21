#!/bin/sh 
set -x
set -e

cd java/
rm *.class
javac *.java
cd ../scala/
rm *.class
scalac *.scala
cd ..
