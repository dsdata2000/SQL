

SELECT * FROM test1.bookings limit 8;
drop table if exists test1.temp;
create table if not exists test1.temp(
bookid int not null primary key,
facid int not null,
memid int not null,
memid1 int not null,
starttime varchar(19),
slots int not null
);
insert into test1.temp(bookid,facid,memid,memid1,starttime,slots)
select bookid,facid,memid,memid,starttime,slots from test1.bookings;

select * from test1.temp;

drop table if exists test1.team;

create table if not exists test1.team(
bookid int not null primary key,
facid int not null,
memid1 int not null,
starttime varchar(19),
slots int not null,
surname varchar(17),
firstname varchar(9),
address varchar(39),
zipcode int,
telephone varchar(14),
recommendedby varchar(2),
joindate varchar(19)
);
insert into test1.team(bookid,facid,memid1,starttime,slots,
surname,firstname,address,zipcode,telephone,recommendedby,joindate)
select bookid,facid,memid1,starttime,slots,
surname,firstname,address,zipcode,telephone,recommendedby,joindate
from test1.temp 
join test1.Members on 
test1.Members.memid=test1.temp.memid;

drop table if exists test1.temp;

select count(*) from test1.team;

select * from test1.team limit 20;


