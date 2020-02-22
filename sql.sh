#!/bin/bash
echo "mysql -u root -p"
echo "CREATE DATABASE Data;" > datos.sql
echo "USE Datos;" >> datos.sql
aCadenaUnica=($(shuf -i 1-1000000000 -n 1000000))
aCadenaIndex=($(shuf -i 1-1000000000 -n 1000000))
bCadenaUnica=($(shuf -i 1-1000000000 -n 100))

function table_1 {
	echo "CREATE TABLE tabla_A (ald INT NOT NULL, aCadenaUnica VARCHAR(22) UNIQUE, aCadenaIndex VARCHAR(22), aCadenaSinIndex VARCHAR(22), aIdClaveAjena int NOT NULL, PRIMARY KEY (ald), FOREIGN KEY (aIdClaveAjena) REFERENCES tabla_B (bld));" >> tablas.sql
	echo "INSERT INTO tabla_A (ald, aCadenaUnica, aCadenaIndex, aCadenaSinIndex, aIdClaveAjena) VALUES" >> datos.sql
	for ((j=1;j<1000000;j++));do
		echo '("'$j'","'${aCadenaUnica[$j]}'","'${aCadenaIndex[$j]}'","'${aCadenaIndex[$j]}'","'$(($j % 100 + 1))'"),'
	done >> datos.sql
	echo '("'1000000'","'${aCadenaUnica[0]}'","'${aCadenaIndex[0]}'","'${aCadenaIndex[0]}'","'$(($j % 100 + 1))'");' >> datos.sql
}

function table_2 {
	echo "CREATE TABLE tabla_B (bld INT NOT NULL, bCadenaUnica VARCHAR(22) UNIQUE, bCadenaIndex VARCHAR(22), bCadenaSinIndex VARCHAR(22), PRIMARY KEY (bld));" >> tablas.sql
	echo "INSERT INTO tabla_B (bld, bCadenaUnica, bCadenaIndex, bCadenaSinIndex) VALUES" >> datos.sql
	for ((j=1;j<100;j++));do
		echo '("'$j'","'${bCadenaUnica[$j]}'","'${aCadenaUnica[$j]}'","'${aCadenaUnica[100 - $j]}'"),'
	done >> datos.sql
	echo '("'100'","'${bCadenaUnica[0]}'","'${aCadenaUnica[0]}'","'${aCadenaUnica[0]}'");' >> datos.sql

}

table_2
table_1
echo "CREATE INDEX indiceTablaA ON tabla_A(aCadenaIndex);" >> datos.sql
 
