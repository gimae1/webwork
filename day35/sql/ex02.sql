--old join 
--cross join
drop table ex01;
drop table ex02;
create table ex01(
	idx number,
	name varchar2(10),
	num number
);

create table ex02(
	num number,
	loc varchar2(10)
);

insert into ex01 values(1,'user1',1111);
insert into ex01 values(2,'user2',2222);
insert into ex01 values(3,'user3',3333);
insert into ex01 values(4,'user4',4444);

insert into ex02 values(1111,'서울');
insert into ex02 values(2222,'부산');
insert into ex02 values(3333,'대전');
insert into ex02 values(5555,'제주');
commit;
select *from ex01,ex02;
--outer join
select * from ex01,ex02;

select * from ex01,ex02 where ex01.num=ex02.num;


select * from ex01,ex02 where ex01.num=ex02.num(+);--ex01은 다 나오고 ex02는 일치하는 부분만 나온다. 

select a.idx,a.name,a.num,b.num,b.loc from ex01 A,ex02 B where a.num=b.num;--테이블에 별칭 부여 가능하다
--self join(별칭부여 필수 )
select * from emp a, emp b; 
select a.ename,b.ename from emp a, emp b where a.mgr=b.empno;
select a.idx,a.name,a.num,b.num,b.loc from ex01 A,ex02 B where a.num=b.num and b.loc='부산';
--ANSI 조인
-- 1.select * from ex01 cross join ex02;
-- 2.select * from ex01 inner join ex02 on ex01.num=ex02.num;↓ 아래와 동일한 명령문임
-- 2-1 select * from ex01 inner join ex02 using (num); 두개 테이블의 컬럼 명이 서로 같다면 using 사용 가능하다(0중복된 컬럼명 하나이상 필수 
-- 2-2 select * from ex01 natural join ex02; 두개의 테이블에 컬럼명이 일치하는것이 존재하고  단 하나만 있다면 natural join 가능 
-- 4-1outer join  select * from ex01 left outer join ex02 on ex01.num=ex02.num;
-- 4-2			  select * from ex01 right outer join ex02 on ex01.num=ex02.num;
-- 4-3			  select * from ex01 full outer join ex02 on ex01.num=ex02.num;
--
--
select * from ex01 cross join ex02 where ex01.num=ex02.num;--==select * from ex01 inner join ex02 on ex01.num=ex02.num;
select * from ex01 left outer join ex02 on ex01.num=ex02.num;
select * from ex01 right outer join ex02 on ex01.num=ex02.num;
select * from ex01 a left outer join ex02 b on a.num=b.num where b.num is null;
select * from ex01 a right outer join ex02 b on a.num=b.num where a.num is null;
select * from ex01 a full join ex02 b on a.num=b.num where a.num is null or b.num is null;
--sub query 
select ename,(select ename from emp b where b.empno=a.mgr) from emp a;





