-- sum avg max min count stddev vriance
--SUM
select sum(sal) from emp;
--select ename, sum(sal) from emp; 는 불가
select sum(sal), avg(sal) from emp; --는 가능
--count :그룹함수 중 유일하게 * 허용한다. counting 할 때 null값은 제외한다. 
select count(ename) from emp;
select * from emp;
--GROUP BY
select sum(sal) from emp where deptno=10;
select sum(sal) from emp where deptno=20;
select sum(sal) from emp where deptno=30;

select sum(sal) from emp group by deptno;
select deptno,sum(sal) from emp group by deptno;--deptno으로 group 지었기 때문에 이름이 다 같아진다. 따라서 group by 사용할때
-- 위와 같은 문법 사용 가능해짐 뒤에 group by 한 그 column만 가능

--HAVING : GROUP BY 의 조건문 
--부서별 평균 연봉이 2000 이상인 부서의 평균 연봉
select deptno, avg(sal) from emp group by deptno having avg(sal)>=2000;

--2 트랜잭션
--commit rollback savepoint
--commit: DML의 적용 (커밋 대상 :insert update delete) ex) create table 은 commit 의 대상 아니다
--rollback: 마지막 커밋 시점으로 돌아가는 명령
--따라서 한번 커밋을 하면 그 이전 커밋 이전으로는 돌아갈 방법은 없다. 

--savepoint 

--시퀀스

create table test01(
num number,
name varchar2(10)
);
--create table test02(
--num number --1
--
--);
--insert into test02 values(0);
create sequence test01_seq;

insert into test01 values (test01_seq.nextval,'test1');-- 이 한 문장만 실행을 해도 num 이 순차적으로 insert 된다. 

select * from test01;

select test01_seq.nextval from dual;


















