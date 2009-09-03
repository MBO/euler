#!/bin/sh 
set -x
set -e

cd java/
rm *.class || true
javac *.java
cd ../scala/
rm *.class || true
scalac *.scala
cd ..
