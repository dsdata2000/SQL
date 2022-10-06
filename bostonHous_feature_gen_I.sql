
use boston;
show tables;
-- select * from bostonhousing limit 5;
-- create table bostonvw1 as select * from bostonhousing;
select * from bostonvw1 limit 5;

/*
create table if not exists bostonRMptratiovsPRICE
like bostonhousing;
alter table bostonRMptratiovsPRICE drop column CRIM; 
alter table bostonRMptratiovsPRICE drop column ZN;
alter table bostonRMptratiovsPRICE drop column INDUS; 
alter table bostonRMptratiovsPRICE drop column CHAS;
alter table bostonRMptratiovsPRICE drop column NOX; 
alter table bostonRMptratiovsPRICE drop column AGE;
alter table bostonRMptratiovsPRICE drop column DIS;
alter table bostonRMptratiovsPRICE drop column RAD;
alter table bostonRMptratiovsPRICE drop column TAX; 
alter table bostonRMptratiovsPRICE drop column B;
alter table bostonRMptratiovsPRICE drop column LSTAT; 

insert into bostonRMptratiovsPRICE(FIELD1, RM, PTRATIO, PRICE)
select FIELD1, RM, PTRATIO, PRICE from bostonhousing; 
 */ 
set @rm_max = (select max(RM) from bostonRMptratiovsPRICE); 
set @rm_min = (select min(RM) from bostonRMptratiovsPRICE);
set @rm_std = (select std(RM) from bostonRMptratiovsPRICE);
set @n_int = round((select (@rm_max-@rm_min)/@rm_std from bostonRMptratiovsPRICE limit 1));

drop table if exists temp1;
create table temp1(
 FIELD1 int not null primary key
,RM float not null
,RM_ft1 varchar(40) not null);

insert into temp1(FIELD1, RM, RM_ft1) 
select FIELD1, RM as RM1, case 
when (RM>@rm_min and RM<=(@rm_min+3*@rm_std)) then 'rm_a'
when (RM>(@rm_min+3*@rm_std) and RM<=(@rm_min+3.5*@rm_std)) then 'rm_b'
when (RM>(@rm_min+3.5*@rm_std) and RM<=(@rm_min+4*@rm_std)) then 'rm_c'
when (RM>(@rm_min+4*@rm_std) and RM<=(@rm_min+5*@rm_std)) then 'rm_d'
else 'rm_e' end as RM_ft1 from bostonRMptratiovsPRICE;

select distinct(RM_ft1), count(RM_ft1) from temp1
group by RM_ft1 order by count(RM_ft1) desc;

select * from bostonRMptratiovsPRICE limit 10;

alter table temp1 rename column RM to RM1;

select * from temp1 limit 10;

select RM, PTRATIO, PRICE, RM_ft1 from bostonRMptratiovsPRICE
join temp1 on temp1.FIELD1=bostonRMptratiovsPRICE.FIELD1;


select CRIM, ZN, INDUS, CHAS, NOX, RM, AGE, DIS, RAD, TAX, PTRATIO, B, LSTAT, RM_ft1, PRICE
from bostonvw1
join temp1 on 
temp1.FIELD1=bostonvw1.FIELD1;










  








 





