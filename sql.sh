#!/bin/bash
for ((j=1;j<1000000;j++));do
	echo '("'$j'","'${aCadenaUnica[$j]}'","'${aCadenaIndex[$j]}'","'${aCadenaIndex[$j]}'","'$(($j % 100 + 1))'"),'
done >> datos.sql
echo "CREATE TABLE tabla_A (ald INT NOT NULL, aCadenaUnica VARCHAR(22) UNIQUE, aCadenaIndex VARCHAR(22), aCadenaSinIndex VARCHAR(22), aIdClaveAjena int NOT NULL, PRIMARY KEY (ald), FOREIGN KEY (aIdClaveAjena) REFERENCES tabla_B (bld));" >> tablas.sql

for ((j=1;j<100;j++));do
	echo '("'$j'","'${bCadenaUnica[$j]}'","'${aCadenaUnica[$j]}'","'${aCadenaUnica[100 - $j]}'"),'
done >> datos.sql
	echo '("'100'","'${bCadenaUnica[0]}'","'${aCadenaUnica[0]}'","'${aCadenaUnica[0]}'");' >> datos.sql
 
