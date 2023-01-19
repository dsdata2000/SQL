use test;
select * from test.dccclient limit 5;
drop table if exists test.DCCCL1;
CREATE TABLE `DCCCL1` (
  `FIELD1` int NOT NULL,
  `ID` int NOT NULL,
  `LIMIT_BAL` int NOT NULL,
  `SEX` int NOT NULL,
  `SEX1` varchar(30) not null,
  `EDUCATION` int NOT NULL,
  `EDUCATION1` varchar(30) not null,
  `MARRIAGE` int NOT NULL,
  `MARRIAGE1` varchar (30) not null,
  `AGE` int NOT NULL,
  `PAY_1` int NOT NULL,
  `PAY_2` int NOT NULL,
  `PAY_3` int NOT NULL,
  `PAY_4` int NOT NULL,
  `PAY_5` int NOT NULL,
  `PAY_6` int NOT NULL,
  `BILL_AMT1` int NOT NULL,
  `BILL_AMT2` int NOT NULL,
  `BILL_AMT3` int NOT NULL,
  `BILL_AMT4` int NOT NULL,
  `BILL_AMT5` int NOT NULL,
  `BILL_AMT6` int NOT NULL,
  `PAY_AMT1` int NOT NULL,
  `PAY_AMT2` int NOT NULL,
  `PAY_AMT3` int NOT NULL,
  `PAY_AMT4` int NOT NULL,
  `PAY_AMT5` int NOT NULL,
  `PAY_AMT6` int NOT NULL,
  `DPNM` bit(1) NOT NULL,
  `DPNM1` varchar(20) not null
); 
-- ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

insert into test.DCCCL1(
  `FIELD1`,
  `ID`,
  `LIMIT_BAL`,
  `SEX`,
  `SEX1`,
  `EDUCATION`,
  `EDUCATION1`,
  `MARRIAGE`,
  `MARRIAGE1`,
  `AGE`,
  `PAY_1`,
  `PAY_2`,
  `PAY_3`,
  `PAY_4`,
  `PAY_5`,
  `PAY_6`,
  `BILL_AMT1`,
  `BILL_AMT2`,
  `BILL_AMT3`,
  `BILL_AMT4`,
  `BILL_AMT5`,
  `BILL_AMT6`,
  `PAY_AMT1`,
  `PAY_AMT2`,
  `PAY_AMT3`,
  `PAY_AMT4`,
  `PAY_AMT5`,
  `PAY_AMT6`,
  `DPNM`,
  `DPNM1`) 
  
(select
  `FIELD1`,
  `ID`,
  `LIMIT_BAL`,
  `SEX`,
  case 
  when `SEX`=1 then 'male'
  else 'female' end as `SEX1`,
  `EDUCATION`,
  case 
  when `EDUCATION`=1 then 'grad'
  when `EDUCATION`=2 then 'undergrad' 
  when `EDUCATION`=3 then 'high_school' 
  else 'other' end as `EDUCATION1`,
  `MARRIAGE`,
  case 
  when `MARRIAGE`=1 then 'married'
  when `MARRIAGE`=2 then 'single'
  else 'other' end as `MARRIAGE1`,
  `AGE`,
  `PAY_1`,
  `PAY_2`,
  `PAY_3`,
  `PAY_4`,
  `PAY_5`,
  `PAY_6`,
  `BILL_AMT1`,
  `BILL_AMT2`,
  `BILL_AMT3`,
  `BILL_AMT4`,
  `BILL_AMT5`,
  `BILL_AMT6`,
  `PAY_AMT1`,
  `PAY_AMT2`,
  `PAY_AMT3`,
  `PAY_AMT4`,
  `PAY_AMT5`,
  `PAY_AMT6`,
  `DPNM`,
  case 
  when `DPNM` = 1 then 'not-default'
  else 'default' end as `DPNM1`
from test.dccclient);

set @n=(select count(*) from DCCCL1);

select distinct `DPNM1`, count(`DPNM1`)/@n from DCCCL1
group by `DPNM1`;



select distinct (`education1`), count('education1')/@n as `ct` from DCCCL1
group by `education1` order by count(`education1`) desc;

drop procedure if exists view_tab;
select @n;
delimiter //
create procedure view_tab()
begin
  select * from test.DCCCL1 limit 5 offset 51;
end
//
delimiter ;

select  `education1`, `sex1`, `marriage1`, count(`education1`)/@n as `ct_m` 
from test.DCCCL1 group by `education1`, `sex1`, `marriage1` 
having `sex1` like 'male' and `education1` like 'grad';


call view_tab();  

-- select * from DCCCL1;


use test;
drop table if exists test.DCCCL1_join;
CREATE TABLE `DCCCL1_join` (
  `FIELD1` int NOT NULL,
  `ID` int NOT NULL,
  `LIMIT_BAL` int NOT NULL,
  `SEX1` varchar(30) NOT NULL,
  `EDUCATION1` varchar(30) NOT NULL,
  `MARRIAGE1` varchar(30) NOT NULL,
  `AGE` int NOT NULL,
  `PAY_1` int NOT NULL,
  `PAY_2` int NOT NULL,
  `PAY_3` int NOT NULL,
  `PAY_4` int NOT NULL,
  `PAY_5` int NOT NULL,
  `PAY_6` int NOT NULL,
  `DPNM1` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into test.DCCCL1_join
(`FIELD1`,`ID`,`LIMIT_BAL`,`SEX1`,`EDUCATION1`,`MARRIAGE1`,`AGE`,`PAY_1`,`PAY_2`,`PAY_3`,`PAY_4`,`PAY_5`,`PAY_6`,`DPNM1`)
(select `FIELD1`,`ID`,`LIMIT_BAL`,`SEX1`,`EDUCATION1`,`MARRIAGE1`,`AGE`,`PAY_1`,`PAY_2`,`PAY_3`,`PAY_4`,`PAY_5`,`PAY_6`,`DPNM1`
from test.DCCCL1 limit 10 offset 51);
select * from test.DCCCL1_join;


use test;
drop table if exists test.DCCCL1_join_s;
CREATE TABLE `DCCCL1_join_s` (
  `FIELD1` int NOT NULL,
  `ID` int NOT NULL,
  `LIMIT_BAL` int NOT NULL,
  `SEX1` varchar(30) NOT NULL,
  `EDUCATION1` varchar(30) NOT NULL,
  `MARRIAGE1` varchar(30) NOT NULL,
  `AGE` int NOT NULL,
  `PAY_1` int NOT NULL,
  `PAY_2` int NOT NULL,
  `PAY_6` int NOT NULL,
  `DPNM1` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into test.DCCCL1_join_s
(`FIELD1`,`ID`,`LIMIT_BAL`,`SEX1`,`EDUCATION1`,`MARRIAGE1`,`AGE`,`PAY_1`,`PAY_2`,`PAY_6`,`DPNM1`)
(select `FIELD1`,`ID`,`LIMIT_BAL`,`SEX1`,`EDUCATION1`,`MARRIAGE1`,`AGE`,`PAY_1`,`PAY_2`,`PAY_6`,`DPNM1`
from test.DCCCL1 limit 4 offset 54);


select * from test.DCCCL1_join;
select * from test.DCCCL1_join_s;



use test;
select * from test.DCCCL1 limit 100 offset 40; 
select * from test.DCCCL1_join; 



-- inner join is like intercept
-- inner join. test.DCCCL1 D     test.DCCCL1_join J    
select 
D.SEX1,
D.EDUCATION1,
D.MARRIAGE1,
D.AGE,
D.ID as id_number_DCCCL1,
J.PAY_1,
J.PAY_2,
J.ID as id_number_DCCCL1_join from test.DCCCL1_join J 
inner join test.DCCCL1 D 
on D.ID=J.ID;



-- left join  test.DCCCL1 b  test.DCCCL1_join s        
select 
b.EDUCATION1,
b.SEX1,
b.MARRIAGE1,
b.ID as id_b,
s.ID as id_s,
s.PAY_1,
s.PAY_3 from test.DCCCL1 b 
left join test.DCCCL1_join s  using(ID)
 where s.ID is not null;
 
 
-- cross join  test.DCCCL1_join b   test.DCCCL1_join_s s     
select 
b.LIMIT_BAL,
b.AGE,
b.EDUCATION1,
b.SEX1,
b.ID as id_b,
s.ID as id_s,
s.MARRIAGE1,
s.PAY_1,
s.DPNM1 from test.DCCCL1_join b 
cross join test.DCCCL1_join_s s;


use test;
drop table if exists test.DCCCL2;
CREATE TABLE `DCCCL2` (
  `FIELD1` int NOT NULL,
  `ID` int NOT NULL,
  `LIMIT_BAL` int NOT NULL,
  `SEX` int NOT NULL,
  `SEX1` varchar(30) NOT NULL,
  `EDUCATION` int NOT NULL,
  `EDUCATION1` varchar(30) NOT NULL,
  `MARRIAGE` int NOT NULL,
  `MARRIAGE1` varchar(30) NOT NULL,
  `AGE` int NOT NULL,
  `PAY_1` int NOT NULL,
  `PAY_2` int NOT NULL,
  `PAY_3` int NOT NULL,
  `PAY_4` int NOT NULL,
  `PAY_5` int NOT NULL,
  `PAY_6` int NOT NULL,
  `PAY_1v` varchar(30) not null,
  `PAY_2v` varchar(30) not null,
  `PAY_3v` varchar(30) not null,
  `PAY_4v` varchar(30) not null,
  `PAY_5v` varchar(30) not null,
  `PAY_6v` varchar(30) not null,
  `BILL_AMT1` int NOT NULL,
  `BILL_AMT2` int NOT NULL,
  `BILL_AMT3` int NOT NULL,
  `BILL_AMT4` int NOT NULL,
  `BILL_AMT5` int NOT NULL,
  `BILL_AMT6` int NOT NULL,
  `PAY_AMT1` int NOT NULL,
  `PAY_AMT2` int NOT NULL,
  `PAY_AMT3` int NOT NULL,
  `PAY_AMT4` int NOT NULL,
  `PAY_AMT5` int NOT NULL,
  `PAY_AMT6` int NOT NULL,
  `last_login` datetime,
  `DPNM` bit(1) NOT NULL,
  `DPNM1` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
insert into test.DCCCL2(
  `FIELD1`,`ID`,`LIMIT_BAL`,`SEX`,`SEX1`,`EDUCATION`,`EDUCATION1`,`MARRIAGE`,`MARRIAGE1`,`AGE`,
  `PAY_1`,`PAY_2`,`PAY_3`,`PAY_4`,`PAY_5`,`PAY_6`,`PAY_1v`,`PAY_2v`,`PAY_3v`,`PAY_4v`,`PAY_5v`,`PAY_6v`,
  `BILL_AMT1`,`BILL_AMT2`,`BILL_AMT3`,`BILL_AMT4`,`BILL_AMT5`,`BILL_AMT6`,
  `PAY_AMT1`,`PAY_AMT2`,`PAY_AMT3`,`PAY_AMT4`,`PAY_AMT5`,`PAY_AMT6`,`last_login`,`DPNM`,`DPNM1`
  )
  (
  select 
  `FIELD1`,`ID`,
  `LIMIT_BAL`,`SEX`,`SEX1`,`EDUCATION`,`EDUCATION1`,`MARRIAGE`,`MARRIAGE1`,`AGE`,
  `PAY_1`,`PAY_2`,`PAY_3`,`PAY_4`,`PAY_5`,`PAY_6`,
  case when `PAY_1`<=-1 then 'ontime' else 'late' end as `PAY_1v`,
  case when `PAY_2`<=-1 then 'ontime' else 'late' end as `PAY_2v`,
  case when `PAY_3`<=-1 then 'ontime' else 'late' end as `PAY_3v`,
  case when `PAY_4`<=-1 then 'ontime' else 'late' end as `PAY_4v`,
  case when `PAY_5`<=-1 then 'ontime' else 'late' end as `PAY_5v`,
  case when `PAY_6`<=-1 then 'ontime' else 'late' end as `PAY_6v`,
  `BILL_AMT1`,`BILL_AMT2`,`BILL_AMT3`,`BILL_AMT4`,`BILL_AMT5`,`BILL_AMT6`,
  `PAY_AMT1`,`PAY_AMT2`,`PAY_AMT3`,`PAY_AMT4`,`PAY_AMT5`,`PAY_AMT6`,
  case when `ID`=1 then now() else date_sub(now(), interval ID hour) end as `last_login`,
  `DPNM`,`DPNM1`
  from test.DCCCL1
  );  
select distinct `PAY_1v`, count(`PAY_1v`)/30000 from test.DCCCL2
group by `PAY_1v`;
select * from test.DCCCL2 order by  rand() limit 10;


-- 5002, $500K 
 select LIMIT_BAL, EDUCATION1, MARRIAGE1, AGE, DPNM1 from DCCCL2
 where MARRIAGE1 like 'married' and DPNM1 like 'not-default' and AGE>33
 group by LIMIT_BAL, EDUCATION1, MARRIAGE1, AGE, DPNM1
 having EDUCATION1 like 'grad'
 order by LIMIT_BAL desc limit 5 offset 4;
 
 
 SELECT * FROM test.investment;
 select company_city, funded_at, count(company_city) from test.investment
 where funded_at > '1500-12-13' and funded_at < '2010-01-12'
 group by company_city, funded_at
 order by count(company_city) desc;
 
 
 use test;
 select * from test.DCCCL2 limit 10;
 


use test;
drop table if exists test.temp;
CREATE TABLE `temp` (
`ID` int auto_increment primary key,
`last_login` datetime not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
insert into test.temp(`last_login`)
(select `last_login`  from test.DCCCL2 order by rand() );

alter table test.temp rename column `last_login` to `rate_evalauted`;

select * from test.DCCCL2 limit 10;
select * from test.temp limit 10;


drop table if exists test.DCCCL3; 
CREATE TABLE test.`DCCCL3` as  
(select 
  `FIELD1`,
  `ID`,
  `LIMIT_BAL`,
  `SEX`,
  `SEX1`,
  `EDUCATION`,
  `EDUCATION1`,
  `MARRIAGE`,
  `MARRIAGE1`,
  `AGE`,
  `PAY_1`,
  `PAY_2`,
  `PAY_3`,
  `PAY_4`,
  `PAY_5`,
  `PAY_6`,
  `PAY_1v`,
  `PAY_2v`,
  `PAY_3v`,
  `PAY_4v`,
  `PAY_5v`,
  `PAY_6v`,
  `BILL_AMT1`,
  `BILL_AMT2`,
  `BILL_AMT3`,
  `BILL_AMT4`,
  `BILL_AMT5`,
  `BILL_AMT6`,
  `PAY_AMT1`,
  `PAY_AMT2`,
  `PAY_AMT3`,
  `PAY_AMT4`,
  `PAY_AMT5`,
  `PAY_AMT6`,
  `last_login`,
  `DPNM`,
  `DPNM1`,
  `rate_evalauted` from test.DCCCL2 left join test.temp using(ID));

select * from test.DCCCL3 limit 20;


-- alter table test.DCCCL3 rename column rate_evalauted to rate_evaluated;

use test;
drop procedure if exists test.some_pro;
delimiter \\
create procedure some_pro(in edu1 varchar(30))
begin
	select max(`rate_evaluated`) from test.DCCCL3
    where `SEX1`='female' or `EDUCATION1`='edu1';
end 
\\
delimiter ;
call some_pro('grad');




use test;
drop function if exists some_function;
delimiter //
create function some_function()
returns int
deterministic
begin
 declare bal_max int;
	select avg(`LIMIT_BAL`) into bal_max from test.DCCCL3;
 return bal_max;
end// 
delimiter ;
set @xd = (select some_function());

select @xd;

drop table if exists test.test_func;
create table test_func(`bal` int);
insert into test.test_func(`bal`) values ( (@xd) );

select * from test.test_func;

