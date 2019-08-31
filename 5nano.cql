CREATE KEYSPACE nano WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };

use nano;

CREATE TABLE nano.measures (id_assay int, id_experiment int, time timestamp, measures text, PRIMARY KEY((id_test,id_plant), time));
