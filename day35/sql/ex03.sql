--서브쿼리 
--메인쿼리문장 안에 들어가는 또 다른 하나의 쿼리문장
select ename,(select ename from emp b where b.empno=a.mgr) from emp a;
--DML,DDL 등의 다양한 메인 쿼리문에서 서브쿼리는 메인쿼리문장 안의 다양한 위치에 들어갈 수 있다. 
--select (2.sub query) from (1.sub query) where (3.sub query) 각각의 포지션에 따라 올 수 있는 문장이 있다. 

--1. 테이블 자리의 서브쿼리:거의 모든 쿼리 문장이 다 들어갈 수 있다.하지만 select에 의의를 둔다
select * from (select * from dept);
select * from (select dname,loc from dept);
--입력 삭제 수정이 가능하지만 실제 존재하는 테이블이 아니기때문에 의미가 없다. 
select * from (select 'add',dname from dept);
--2.필드 자리에 오는 서브쿼리: 
select ename,deptno from emp; 
select ename,(select loc from dept where dept.deptno=emp.deptno)from emp;--join과 같은 효과

--필드는 하나씩만 된다. 이때는 dname 서브쿼리를 하나 더 해야한다.
--필드자리에 오는 서부쿼리는 단일결과값이어야한다. (컬럼도 하나 결과도 하나여야 한다.== 단일 컬럼& 레코드)
select ename,(select loc from dept where dept.deptno=emp.deptno)from emp;
select ename,(select dname,loc from dept where dept.deptno>emp.deptno )from emp;

select 'test' from dept;--row 갯수만큼 인자 출력
--3. 조건 자리에 오는 서브쿼리: 상황에 따라 위의 두가지 속성을 따른다. 
select ename, sal from emp where sal>=(select avg(sal) from emp);
select avg(sal) from emp;
select ename,deptno from emp where deptno in (10,20)
select 1020 from dual;
select * from ex02;

insert into ex02(select 6666,'대구' from dual);
insert into ex02(select 7777,'수원' from dept);
select * from ex02;
drop table ex03;
create table ex03 as (select * from dept);
select * from ex03;
insert into ex02 values(50,'test','test');
select * from dept;
drop table ex05;
create table ex05 as (select deptno,loc from dept);
select * from ex05;
drop table ex06;
create table ex06 as(select deptno,loc from dept where 0>1);
select * from ex06;

 --select (insert into ex05 values (111.'test')) from ex06; select 문 안에서 insert update delete는 안됨











