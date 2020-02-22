#!/bin/bash
# Christian Peter
for (( i=0; i<1000000; i++ ))
do
(cat /dev/urandom | tr -dc '[:digit:]' | head -c 22;
echo -n " ";
cat /dev/urandom | tr -dc '[:alpha:]' | head -c 22;
echo) >> numRand.txt
done

cat numRand.txt | awk '{print $1 " " $2 " " $2}' > tabla_A.txt