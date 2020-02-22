CREATE DATABASE IF NOT EXISTS Data;
USE Data;
CREATE TABLE tabla_B (bld INT NOT NULL, bCadenaUnica VARCHAR(22) UNIQUE, bCadenaIndex VARCHAR(22), bCadenaSinIndex VARCHAR(22), PRIMARY KEY (bld));
CREATE TABLE tabla_A (ald INT NOT NULL, aCadenaUnica VARCHAR(22) UNIQUE, aCadenaIndex VARCHAR(22), aCadenaSinIndex VARCHAR(22), aIdClaveAjena int NOT NULL, PRIMARY KEY (ald), FOREIGN KEY (aIdClaveAjena) REFERENCES tabla_B (bld));
