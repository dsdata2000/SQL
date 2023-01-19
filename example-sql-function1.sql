drop function if exists f1;
delimiter //
create function f1()
returns float
deterministic
begin
 declare r1 float;
	select max(PageValues) into r1 from transactionI where Administrative=(select min(Administrative) from transactionI);
    return r1;
end//
set @x1 = (select f1());
select @x1;

drop table if exists test;
create table test(freq float, time1 float);
insert into test(freq, time1) values((select f1()), (select max(ProductRelated_Duration) from transactionI));

select * from test;
