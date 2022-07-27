
use python_sql;
show tables;
-- select * from temp limit 5;

describe temp;

-- ['FIELD1', 'Administrative', 'Administrative_Duration', 'Informational', 'Informational_Duration', 'ProductRelated',
-- 'ProductRelated_Duration', 'BounceRates', 'ExitRates', 'PageValues', 'SpecialDay', 'Month_', 'OperatingSystems', 'Browser',
-- 'Region', 'TrafficType', 'VisitorType', 'Weekend', 'Revenue']

select * from temp limit 10;

set @n1 = (select count(*) from (select * from temp where VisitorType=1 and Revenue=1) sub);   -- 1760 
set @n2 = (select count(*) from (select * from temp where VisitorType=2 and Revenue=1) sub);   -- 217 

set @n3 = (select count(*) from (select * from temp where VisitorType=3) sub);

drop table if exists tr_month_vtype;
create table tr_month_vtype(time_of_the_year int not null, 
                            Returning_Visitor float not null,
							New_Visitor float not null);
insert into tr_month_vtype(time_of_the_year, Returning_Visitor, New_Visitor)                             
select distinct month_ as time_of_the_year,  count(month_)/@n1 as Returning_Visitor, 0 as New_Visitor
from (select * from temp where VisitorType=1) sub group by month_ order by month_ asc;

insert into tr_month_vtype(time_of_the_year, Returning_Visitor, New_Visitor) 
select distinct month_ as time_of_the_year, 0 as Returning_Visitor, count(month_)/@n2 as New_Visitor from (select * from temp
where VisitorType=2) sub group by month_ order by month_ asc;

select * from tr_month_vtype;

-- how the transaction changes from month to month
set @ntrwd = (select count(*) from temp where Revenue=1 and Weekend=0);
set @ntrwe = (select count(*) from temp where Revenue=1 and Weekend=1);

drop table if exists trans_month; 
create table trans_month
(month_of_the_year int not null, 
monthly_tr_wd float not null, 
monthly_tr_we float not null);

insert into trans_month(month_of_the_year, monthly_tr_wd, monthly_tr_we) 
select distinct month_ as month_of_the_year, 
count(month_)/@ntrwd as monthly_tr_wd,
0 as  monthly_tr_we
from (select * from temp where Revenue=1 and Weekend=0) 
sub group by month_ order by month_ asc; 

insert into trans_month(month_of_the_year, monthly_tr_wd, monthly_tr_we)
select distinct month_ as month_of_the_year,
0 as monthly_tr_wd, count(month_)/@ntrwe as monthly_tr_we 
from (select * from temp where Revenue=1 and Weekend=1) 
sub group by month_ order by month_ asc;
 
select * from trans_month;


