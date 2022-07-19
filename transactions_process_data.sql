
use python_sql;
-- show tables;
select * from transactionI limit 10;
-- alter table transactionI rename column Month to Month1; 
-- alter table transactionI rename column VisitorType to VisitorType1; 
-- alter table transactionI rename column Weekend to Weekend1; 
-- alter table transactionI rename column Revenue  to Revenue1;

describe transactionI;

-- select distinct Month, count(Month) from transactionI 
-- group by Month order by count(Month) desc; 

-- ['Administrative', 'Administrative_Duration', 'Informational', 'Informational_Duration', 'ProductRelated',
-- 'ProductRelated_Duration', 'BounceRates', 'ExitRates', 'PageValues', 'SpecialDay', 'Month', 'OperatingSystems', 'Browser',
-- 'Region', 'TrafficType', 'VisitorType', 'Weekend', 'Revenue']
drop table if exists temp;
create table temp (FIELD1 int not null primary key, 
Administrative decimal(4,1), Administrative_Duration decimal(13,9), 
Informational decimal(4,1), Informational_Duration decimal(13,9), 
ProductRelated decimal(5,1),ProductRelated_Duration decimal(14,9), 
BounceRates decimal(11,9), ExitRates decimal(11,9), PageValues decimal(12,9), SpecialDay decimal(3,1),
Month1 varchar(4), Month_ int, OperatingSystems int, Browser int, Region int, TrafficType int,
VisitorType1 varchar(17), VisitorType int,  Weekend1 varchar(5), Weekend int, 
Revenue1 varchar(5), Revenue int);

insert into temp(FIELD1,Administrative,Administrative_Duration, Informational, Informational_Duration,
ProductRelated,ProductRelated_Duration,BounceRates,ExitRates,PageValues,SpecialDay,
Month1,Month_, OperatingSystems,Browser,Region,TrafficType,
VisitorType1,VisitorType,Weekend1,Weekend,Revenue1,Revenue)
select FIELD1,Administrative,Administrative_Duration, Informational, Informational_Duration,
ProductRelated,ProductRelated_Duration,BounceRates,ExitRates,PageValues,SpecialDay,Month1,
case 
when Month1 like "Nov" then -4
when Month1 like "May" then -3 
when Month1 like "Mar" then -2
when Month1 like "Dec" then -1
when Month1 like "Oct" then 0
when Month1 like "Sep" then 1
when Month1 like "Aug" then 2
when Month1 like "Jul" then 3
when Month1 like "June" then 4
else 5 end as Month_, 
OperatingSystems,Browser,Region,TrafficType,VisitorType1,
case 
when VisitorType1 like "Returning_Visitor" then 1 
when VisitorType1 like "New_Visitor" then 2
else 3 end as VisitorType, 
Weekend1,
case 
when Weekend1 like "True" then 1 
else 0 end as Weekend,
Revenue1,
case when Revenue1 like "True" then 1 
else 0 end as Revenue
from transactionI;
 
-- select count(*) from temp; -- 1981
select distinct VisitorType, count(VisitorType) as n from temp 
group by VisitorType order by count(VisitorType) desc;

select * from temp limit 5;




