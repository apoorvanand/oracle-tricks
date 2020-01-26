/*Sequence*/ 
CREATE TABLE SEQUENCE
   (	SNO NUMBER
   );

insert into sequence(sno) values(1);   
insert into sequence(sno) values(2);
insert into sequence(sno) values(4);
insert into sequence(sno) values(5);
insert into sequence(sno) values(7);
insert into sequence(sno) values(10999);
insert into sequence(sno) values(10);

/*Find Missing number*/ 
SELECT (min_sno - 1 + level) missing_number
FROM ( SELECT MIN(sno) min_sno
, MAX(sno) max_sno
 FROM sequence
  )
 CONNECT BY level <= max_sno - min_sno + 1
  minus
 SELECT sno
 FROM sequence OFFSET 2000 ROWS FETCH NEXT 1000 ROWS ONLY;
 
 
 
 /*Drop table*/ 
 Drop table sequence;
