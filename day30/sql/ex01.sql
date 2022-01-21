--DML (select insert update delete)- CRUD
select *from dept;
--insert into table_name (column1,column2,...) values(,,...);
insert into dept (deptno, dname,loc) values (50,'add1','aaa');--column name 갯수와 column value 갯수는 동일해야한다

--delete from table_name where condition;
delete from dept where deptno=50;--조건 주지 않으면 다 날아간다 조심!

--update table_name set column name =values... where condition;
update dept set dname='AA', loc='BB' where deptno=50;
----------------------------------------------------------------------------------
insert into dept  values (80,'FF','');--* 처리 했을때의 column 이름으로 value 주면 column name 을 따로 정해주지 않아도 
--순서대로 들어간다 만약 자료타입을 맞게 쓰지않거나 전체 column의 갯수를 맞추지 않는다면 오류가 됨 null을 넣더라도 갯수는 맞춰줘야함
--null 
-- java와는 다르게 null 과 '' 빈문자열은 동일하게 null로 처리한다. 

delete from dept where deptno>60;
delete from dept where deptno in (50,60);--any type
delete from dept where deptno between 50 and 60;--number only 
delete from dept where dname like '__';-- delete when dname have 2alphabet
	

