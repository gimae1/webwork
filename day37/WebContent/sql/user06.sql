drop table user06;
drop sequence user06_seq;

create table user06(
	num number primary key,
	id varchar2(30) unique not null,
	pw varchar2(30) not null,
	name varchar2(30) not null,
	age number(3)
);

create sequence user06_seq;

insert into user06 values(user06_seq.nextval,'user01','1234','홍길동',41);
insert into user06 values(user06_seq.nextval,'user02','1234','김길동',21);
insert into user06 values(user06_seq.nextval,'user03','1234','박길동',36);
commit;
--
select * from user06;