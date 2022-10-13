SELECT * FROM test1.bookingsI;

alter table test1.bookingsI drop column  memid1;
alter table test1.bookingsI add column memid1 int not null after slots;
select memid from test1.bookings limit 8;


select distinct(memid), count(memid) as n from test1.bookingsI
group by memid order by memid asc;

select count(*) from test1.MembersI;

select sum(n) from
(
select distinct(memid), count(memid) as n from test1.bookingsI
group by memid order by memid asc
) sub; 

select distinct(memid), count(memid) from test1.MembersI
group by memid order by memid desc;
-- select * from test1.employeeI limit 5;


drop table if exists test1.employeeI;

create table if not exists test1.employeeI(
memid1 int not null 
, firstname varchar(9)
, surname varchar(17)
, zipcode int
, joindate varchar(19)
, telephone varchar(14)
, bookid int
, starttime varchar(19)
, slots int
); 
insert into test1.employeeI(
memid1
, firstname 
, surname 
, zipcode 
, joindate 
, telephone 
, bookid 
, starttime 
, slots
) 
select memid1 
, firstname 
, surname 
, zipcode 
, joindate 
, telephone 
, bookid 
, starttime 
, slots 
from test1.bookingsI
inner  join test1.MembersI on 
(test1.MembersI.memid=test1.bookingsI.memid);

select * from test1.employeeI;



 

-- select 4043*31 from test1.Members limit 1;  -- 125,333




