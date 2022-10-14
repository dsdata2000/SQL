-- BOOKINGS

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

select distinct(facid) from test1.team order by facid asc;


create table if not exists test1.temp(
bookid int not null primary key,
facid int not null,
facid1 int not null,
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

insert into test1.temp(
bookid,facid,facid1,memid1,starttime,slots,
surname,firstname,address,zipcode,telephone,recommendedby,joindate
)
select
bookid,facid,facid,memid1,starttime,slots,
surname,firstname,address,zipcode,telephone,recommendedby,joindate
from test1.team;

select * from test1.temp limit 20;

-- alter table test1.Facilities rename column name to name1;

-- FACILITIES 

select * from test1.Facilities;
drop table if exists test1.teamIII;

create table if not exists test1.teamIII(
bookid int not null,
facid1 int not null,
memid1 int not null,
starttime varchar(19),
slots int,
surname varchar(17),
firstname varchar(9),
address varchar(39),
zipcode int,
telephone varchar(14),
recommendedby varchar(2),
joindate varchar(19),
name1 varchar(15),
membercost decimal(2,1),
guestcost decimal(3,1),
initialoutlay int,
monthlymaintenance int
);

insert into test1.teamIII(
bookid,facid1,memid1,starttime,slots,surname,firstname,
address,zipcode,telephone,recommendedby,joindate,name1,
membercost,guestcost,initialoutlay,monthlymaintenance
)
select
bookid,facid1,memid1,starttime,slots,surname,firstname,
address,zipcode,telephone,recommendedby,joindate,
name1,membercost,guestcost,initialoutlay,monthlymaintenance
from test1.temp
join test1.Facilities on
test1.Facilities.facid=test1.temp.facid;

select count(*) from test1.teamIII;

show columns from test1.teamIII;

select * from test1.teamIII limit 25;
