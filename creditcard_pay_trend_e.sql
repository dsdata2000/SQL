-- show databases;
use test;
-- show tables from test;

-- describe Creditcard_feature_ext;

-- overall paytrend (time+amount) peaks up from month to month ~ 0.15 to 0.25
-- [ ta0, ta1, ta2, ta3, ta4, ta5 ].  ct = 29134 after data cleaning

-- select count(*) from Creditcard_feature_ext;

-- categorize the pay_trend in terms of education [2, 1, 3]

-- 4248, 1616
-- *******************************************************

drop table if exists pay_trend_e;
create table pay_trend_e
(month_ varchar(6) not null,
n2 float);

insert into pay_trend_e(month_, n2)
select "APR", count(ta0) from (select * from Creditcard_feature_ext where EDUCATION=2) sub
group by ta0  having ta0=1;

insert into pay_trend_e(month_, n2)
select "MAY", count(ta1) from (select * from Creditcard_feature_ext where EDUCATION=2) sub
group by ta1  having ta1=1;

insert into pay_trend_e(month_, n2)
select "JUNE", count(ta2) from (select * from Creditcard_feature_ext where EDUCATION=2) sub
group by ta2  having ta2=1;

insert into pay_trend_e(month_, n2)
select "JULY", count(ta3) from (select * from Creditcard_feature_ext where EDUCATION=2) sub
group by ta3  having ta3=1;

insert into pay_trend_e(month_, n2)
select "AUG", count(ta4) from (select * from Creditcard_feature_ext where EDUCATION=2) sub
group by ta4  having ta4=1;

insert into pay_trend_e(month_, n2)
select "SEPT", count(ta5) from (select * from Creditcard_feature_ext where EDUCATION=2) sub
group by ta5  having ta5=1;

-- *****************************
alter table pay_trend_e add column n1 float not null after n2; 

insert into pay_trend_e(month_, n2, n1)
select "APR", 0, count(ta0) from (select * from Creditcard_feature_ext where EDUCATION=1) sub
group by ta0  having ta0=1;

insert into pay_trend_e(month_, n2, n1)
select "MAY", 0, count(ta1) from (select * from Creditcard_feature_ext where EDUCATION=1) sub
group by ta1  having ta1=1;

insert into pay_trend_e(month_, n2, n1)
select "JUNE", 0, count(ta2) from (select * from Creditcard_feature_ext where EDUCATION=1) sub
group by ta2  having ta2=1;

insert into pay_trend_e(month_, n2, n1)
select "JULY", 0, count(ta3) from (select * from Creditcard_feature_ext where EDUCATION=1) sub
group by ta3  having ta3=1;

insert into pay_trend_e(month_, n2, n1)
select "AUG", 0, count(ta4) from (select * from Creditcard_feature_ext where EDUCATION=1) sub
group by ta4  having ta4=1;

insert into pay_trend_e(month_, n2, n1)
select "SEPT", 0, count(ta5) from (select * from Creditcard_feature_ext where EDUCATION=1) sub
group by ta5  having ta5=1;

-- **********************************************************

alter table pay_trend_e add column n3 float not null after n1; 

insert into pay_trend_e(month_, n2, n1, n3)
select "APR", 0, 0, count(ta0) from (select * from Creditcard_feature_ext where EDUCATION=3) sub
group by ta0  having ta0=1;

insert into pay_trend_e(month_, n2, n1, n3)
select "MAY", 0, 0, count(ta1) from (select * from Creditcard_feature_ext where EDUCATION=3) sub
group by ta1  having ta1=1;

insert into pay_trend_e(month_, n2, n1, n3)
select "JUNE", 0, 0, count(ta2) from (select * from Creditcard_feature_ext where EDUCATION=3) sub
group by ta2  having ta2=1;

insert into pay_trend_e(month_, n2, n1, n3)
select "JULY", 0, 0, count(ta3) from (select * from Creditcard_feature_ext where EDUCATION=3) sub
group by ta3  having ta3=1;

insert into pay_trend_e(month_, n2, n1, n3)
select "AUG", 0, 0, count(ta4) from (select * from Creditcard_feature_ext where EDUCATION=3) sub
group by ta4  having ta4=1;

insert into pay_trend_e(month_, n2, n1, n3)
select "SEPT", 0, 0, count(ta5) from (select * from Creditcard_feature_ext where EDUCATION=3) sub
group by ta5  having ta5=1;


select * from pay_trend_e;