--create table 테이블명 (컬럼명 자료형. 컬럼명 자료형, ...);
create table ex03(
	num1 number,
	name varchar2(3),
	num2 number(2),
	num3 number(3,1)
);
select * from ex03;
insert into ex03 values(1,'aaa',11,12.3); 
insert into ex03 values(2,'bbb',222,12.3); 
insert into ex03 values(1.1,'bbb',66,12.3); 
insert into ex03 values(5,'bbb',55,123.4);--등록 안됨 

--포함되지 않는 자리수는 소수점아래 숫자를 날린다
insert into ex03 values(2,'bbb',33.33,12.3);--소수점아래 자리는 자릿수에 포함되지 않으므로 오류가 안남 
insert into ex03 values(2,'bbb',44,12.34); 

insert into ex03 values(6,'한',66,12.3);
insert into ex03 values(7,'한글',77,12.3);

create table ex04(
	num number,
	name char(4),
	nalja date
);
select * from ex04;
insert into ex04 values (1, 'abc','2022/01/19');
insert into ex04 values (2, 'abc','2022-01-19');
insert into ex04 values (3, 'abc','20220119');
insert into ex04 values (4, 'now', sysdate);


create table ex05 (num number);
select * from ex55;
insert into ex05 values (1111);
insert into ex05 values (2222);
insert into ex05 values (3333);

alter table ex05 add name varchar2(3);
insert into ex05 values(4444,'abc');
alter table ex05 modify name varchar2(6);
alter table ex05 drop column name;

drop table ex55;
alter table ex05 rename to ex55;
TRUNCATE table ex55;
select tname from tab;

select * from tab;










