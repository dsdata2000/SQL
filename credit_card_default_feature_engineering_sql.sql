show databases;
use test;
select count(*) from Def_Credit_Card_Cl;

drop table if exists temp;

create table temp(ID int, 
BILL_AMT1 int, BILL_AMT2 int, BILL_AMT3 int, BILL_AMT4 int, BILL_AMT5 int, BILL_AMT6 int,
PAY_1 int, PAY_2 int, PAY_3 int, PAY_4 int, PAY_5 int, PAY_6 int,
PAY_AMT1 int, PAY_AMT2 int, PAY_AMT3 int, PAY_AMT4 int, PAY_AMT5 int, PAY_AMT6 int,
bb1 int, bb2 int, bb3 int, bb4 int, bb5 int, bb6 int,
t1 int, t2 int, t3 int, t4 int, t5 int, t6 int,
p1 int, p2 int, p3 int, p4 int, p5 int, p6 int);

insert into temp(ID, 
				 BILL_AMT1, BILL_AMT2, BILL_AMT3, BILL_AMT4, BILL_AMT5, BILL_AMT6,
                 PAY_1, PAY_2, PAY_3, PAY_4, PAY_5, PAY_6,
                 PAY_AMT1, PAY_AMT2, PAY_AMT3, PAY_AMT4, PAY_AMT5, PAY_AMT6,
				 bb1, bb2, bb3, bb4, bb5, bb6, 
                 t1, t2, t3, t4, t5, t6,
                 p1, p2, p3, p4, p5, p6)

select ID, 
	BILL_AMT1,BILL_AMT2,BILL_AMT3,BILL_AMT4,BILL_AMT5,BILL_AMT6, 
	PAY_1, PAY_2, PAY_3, PAY_4, PAY_5, PAY_6,
    PAY_AMT1, PAY_AMT2, PAY_AMT3, PAY_AMT4, PAY_AMT5, PAY_AMT6,
	case when BILL_AMT1=0 then 0 else 1 end as bb1,
	case when BILL_AMT2=0 then 0 else 1 end as bb2,
    case when BILL_AMT3=0 then 0 else 1 end as bb3,
	case when BILL_AMT4=0 then 0 else 1 end as bb4,
	case when BILL_AMT5=0 then 0 else 1 end as bb5,
	case when BILL_AMT6=0 then 0 else 1 end as bb6,
    case when PAY_1>0 then 0 else 1 end as t0,
    case when PAY_2>0 then 0 else 1 end as t2,
    case when PAY_3>0 then 0 else 1 end as t3,
    case when PAY_4>0 then 0 else 1 end as t4,
    case when PAY_5>0 then 0 else 1 end as t5,
    case when PAY_6>0 then 0 else 1 end as t6,
    case when PAY_AMT1>=BILL_AMT1 then 1 else 0 end as p1,
    case when PAY_AMT2>=BILL_AMT2 then 1 else 0 end as p2,
    case when PAY_AMT3>=BILL_AMT3 then 1 else 0 end as p3,
    case when PAY_AMT4>=BILL_AMT4 then 1 else 0 end as p4,
    case when PAY_AMT5>=BILL_AMT5 then 1 else 0 end as p5,
    case when PAY_AMT6>=BILL_AMT6 then 1 else 0 end as p6
	from Def_Credit_Card_Cl; 
    
alter table temp drop  BILL_AMT1;   
alter table temp drop  BILL_AMT2;
alter table temp drop  BILL_AMT3;
alter table temp drop  BILL_AMT4;
alter table temp drop  BILL_AMT5;
alter table temp drop  BILL_AMT6;

alter table temp drop  PAY_1;
alter table temp drop  PAY_2;
alter table temp drop  PAY_3;
alter table temp drop  PAY_4;
alter table temp drop  PAY_5;
alter table temp drop  PAY_6; 

alter table temp drop PAY_AMT1;
alter table temp drop PAY_AMT2;
alter table temp drop PAY_AMT3;
alter table temp drop PAY_AMT4;
alter table temp drop PAY_AMT5;
alter table temp drop PAY_AMT6;  


select * from temp limit 10;


drop table if exists temp1;

create table temp1(
ID int,
bb1 int, bb2 int, bb3 int, bb4 int, bb5 int, bb6 int,
t1 int, t2 int, t3 int, t4 int, t5 int, t6 int,
p1 int, p2 int, p3 int, p4 int, p5 int, p6 int,
tp1 int, tp2 int, tp3 int, tp4 int, tp5 int, tp6 int,
btp1 int, btp2 int, btp3 int, btp4 int, btp5 int, btp6 int,
SC int);

insert into temp1(ID,
bb1, bb2, bb3, bb4, bb5, bb6,
t1, t2, t3, t4, t5, t6,
p1, p2, p3, p4, p5, p6,
tp1, tp2, tp3, tp4, tp5, tp6,
btp1, btp2, btp3, btp4, btp5, btp6,
SC)

select ID,
bb1, bb2, bb3, bb4, bb5, bb6,
t1, t2, t3, t4, t5, t6,
p1, p2, p3, p4, p5, p6,
case when (t1=1 and p1=1) then 1 else 0 end as tp1,
case when (t2=1 and p2=1) then 1 else 0 end as tp2,
case when (t3=1 and p3=1) then 1 else 0 end as tp3,
case when (t4=1 and p4=1) then 1 else 0 end as tp4,
case when (t5=1 and p5=1) then 1 else 0 end as tp5,
case when (t6=1 and p6=1) then 1 else 0 end as tp6,
case when (t1=1 and p1=1 and bb1=1) then 1 else 0 end as btp1,
case when (t2=1 and p2=1 and bb2=1) then 1 else 0 end as btp2,
case when (t3=1 and p3=1 and bb3=1) then 1 else 0 end as btp3,
case when (t4=1 and p4=1 and bb4=1) then 1 else 0 end as btp4,
case when (t5=1 and p5=1 and bb5=1) then 1 else 0 end as btp5,
case when (t6=1 and p6=1 and bb6=1) then 1 else 0 end as btp6,
case when (t1=1 and t2=1 and t3=1 and t4=1 and t5=1 and t6=1 and 
           p1=1 and p2=1 and p3=1 and p4=1 and p5=1 and p6=1 and 
           bb1=1 and bb2=1 and bb3=1 and bb4=1 and bb5=1 and t6=1) then 1 else 0 end as SC
 from temp;
 
 select * from temp1 limit 5;

select distinct SC, count(SC) from temp1
group by SC order by SC asc;

Select LIMIT_BAL, SEX, EDUCATION, MARRIAGE, AGE, 
PAY_1, PAY_2, PAY_3, PAY_4, PAY_5, PAY_6,
BILL_AMT1, BILL_AMT2, BILL_AMT3, BILL_AMT4, BILL_AMT5, BILL_AMT6,
PAY_AMT1, PAY_AMT2, PAY_AMT3, PAY_AMT4, PAY_AMT5, PAY_AMT6,
bb1, bb2, bb3, bb4, bb5, bb6,
t1, t2, t3, t4, t5, t6,
p1, p2, p3, p4, p5, p6,
tp1, tp2, tp3, tp4, tp5, tp6,
btp1, btp2, btp3, btp4, btp5, btp6,
SC from Def_Credit_Card_Cl
 join temp1 on temp1.ID = Def_Credit_Card_Cl.ID;


# Next ML