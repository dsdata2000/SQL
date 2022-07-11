-- show databases;
use test;
-- show tables;
-- describe Creditcard_feature_ext;

-- alter table Creditcard_feature_ext rename column if exists ta0  to PAYB_0;
-- alter table Creditcard_feature_ext rename column  ta1 to PAYB_1;
-- alter table Creditcard_feature_ext rename column ta2 to PAYB_2;
-- alter table Creditcard_feature_ext rename column ta3 to PAYB_3;
-- alter table Creditcard_feature_ext rename column ta4 to PAYB_4;
-- alter table Creditcard_feature_ext rename column ta5 to PAYB_5;

describe Creditcard_feature_ext; 

set @a1 = (select count(*) from Creditcard_feature_ext where (AGE<=35 and EDUCATION=2));
set @a2 = (select count(*) from Creditcard_feature_ext where (AGE>35 and AGE<=55 and EDUCATION=2));
set @a3 = (select count(*) from Creditcard_feature_ext where (AGE>55 and EDUCATION=2));

-- AGE-GROUP-I ---------------------------------------
drop table if exists trend_age_edu;
create table trend_age_edu
(month_ varchar(20) not null, n float);  -- cant make month_ primary key ..
insert into trend_age_edu(month_, n)
select "APR", count(PAYB_0)/@a1 from (select * from Creditcard_feature_ext where (AGE<=35 and EDUCATION=2)) sub 
group by PAYB_0 having PAYB_0=1; 
insert into trend_age_edu(month_, n)
select "MAY", count(PAYB_1)/@a1 from (select * from Creditcard_feature_ext where (AGE<=35 and EDUCATION=2)) sub
group by PAYB_1 having PAYB_1=1;
insert into trend_age_edu(month_, n)
select "JUNE", count(PAYB_2)/@a1 from (select * from Creditcard_feature_ext where (AGE<=35 and EDUCATION=2)) sub
group by PAYB_2 having PAYB_2=1;
insert into trend_age_edu(month_, n)
select "JULY", count(PAYB_3)/@a1 from (select * from Creditcard_feature_ext where (AGE<=35 and EDUCATION=2)) sub
group by PAYB_3 having PAYB_3=1;
insert into trend_age_edu(month_, n)
select "AUG", count(PAYB_4)/@a1 from (select * from Creditcard_feature_ext where (AGE<=35 and EDUCATION=2)) sub
group by PAYB_4 having PAYB_4=1;
insert into trend_age_edu(month_, n)
select "SEPT", count(PAYB_5)/@a1 from (select * from Creditcard_feature_ext where (AGE<=35 and EDUCATION=2)) sub
group by PAYB_5 having PAYB_5=1;

-- AGE-GROUP-II ---------------------------------------------------------
alter table trend_age_edu add column m float not null after n;
insert into trend_age_edu(month_, n, m)
select "APR", 0, count(PAYB_0)/@a2 from (select * from Creditcard_feature_ext where (AGE>35 and AGE<=55 and EDUCATION=2)) sub
group by PAYB_0 having PAYB_0=1; 
insert into trend_age_edu(month_, n, m)
select "MAY", 0, count(PAYB_1)/@a2 from (select * from Creditcard_feature_ext where (AGE>35 and AGE<=55 and EDUCATION=2)) sub
group by PAYB_1 having PAYB_1=1;
insert into trend_age_edu(month_, n, m)
select "JUNE", 0, count(PAYB_2)/@a2 from (select * from Creditcard_feature_ext where (AGE>35 and AGE<=55 and EDUCATION=2)) sub
group by PAYB_2 having PAYB_2=1;
insert into trend_age_edu(month_, n, m)
select "JULY", 0, count(PAYB_3)/@a2 from (select * from Creditcard_feature_ext where (AGE>35 and AGE<=55 and EDUCATION=2)) sub
group by PAYB_3 having PAYB_3=1;
insert into trend_age_edu(month_, n, m)
select "AUG", 0, count(PAYB_4)/@a2 from (select * from Creditcard_feature_ext where (AGE>35 and AGE<=55 and EDUCATION=2)) sub
group by PAYB_4 having PAYB_4=1;
insert into trend_age_edu(month_, n, m)
select "SEPT", 0, count(PAYB_5)/@a2 from (select * from Creditcard_feature_ext where (AGE>35 and AGE<=55 and EDUCATION=2)) sub
group by PAYB_5 having PAYB_5=1;

-- AGE-GROUP-II --------------------------------------------------

alter table trend_age_edu add column q float not null after m;
insert into trend_age_edu(month_, n, m, q)
select "APR", 0, 0, count(PAYB_0)/@a3 from (select * from Creditcard_feature_ext where (AGE>55 and EDUCATION=2)) sub
group by PAYB_0 having PAYB_0=1;
insert into trend_age_edu(month_, n, m, q)
select "MAY", 0, 0, count(PAYB_1)/@a3 from (select * from Creditcard_feature_ext where (AGE>55 and EDUCATION=2)) sub
group by PAYB_1 having PAYB_1=1;
insert into trend_age_edu(month_, n, m, q)
select "JUNE", 0, 0, count(PAYB_2)/@a3 from (select * from Creditcard_feature_ext where (AGE>55 and EDUCATION=2)) sub
group by PAYB_2 having PAYB_2=1;
insert into trend_age_edu(month_, n, m, q)
select "JULY", 0, 0, count(PAYB_3)/@a3 from (select * from Creditcard_feature_ext where (AGE>55 and EDUCATION=2)) sub
group by PAYB_3 having PAYB_3=1;
insert into trend_age_edu(month_, n, m, q)
select "AUG", 0, 0, count(PAYB_4)/@a3 from (select * from Creditcard_feature_ext where (AGE>55 and EDUCATION=2)) sub
group by PAYB_4 having PAYB_4=1;
insert into trend_age_edu(month_, n, m, q)
select "SEPT", 0, 0, count(PAYB_5)/@a3 from (select * from Creditcard_feature_ext where (AGE>55 and EDUCATION=2)) sub
group by PAYB_5 having PAYB_5=1;

-- result ----------

select * from trend_age_edu;




