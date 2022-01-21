----create table
create table stu01(
	num number,
	name varchar2(9),
	kor number(3),
	eng number(3),
	math number(3)
);
--insert dummydata
insert into stu01 values (1,'강길동',90,80,70);
insert into stu01 values (2,'김길동',91,81,71);
insert into stu01 values (3,'이길동',92,82,72);
insert into stu01 values (4,'박길동',93,83,73);

select * from stu01;
commit;