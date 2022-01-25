
create table ex01(
	 num1 number not null,
	 num2 number,
	 name varchar2(10) not null,
	 sub varchar2(10)
);
--NOT NULL
insert into ex01 values(1000,1111,'test1','test2');
insert into ex01 values(null,null,null,null);--null값이 있어서 오류가 아니라 null 이면 안되는 자리에 null이라 오류
insert into ex01 values(2000,null,'test1',null);
insert into ex01(num2,sub) values (3000,'test2');--value가 나머지 notnull인 부분이 null이라 오류
insert into ex01(num1,name) values(3000,'test2');
insert into ex01 values(4000,4444,'','');--name is null failed 
insert into ex01 values(4000,4444,'null','');--문자열 'null'
insert into ex01 values(5000,'','test1','test2');--숫자도 null가능하다 0은 null아니다. 
insert into ex01 values(6000,0,'test1','test2');
insert into ex01 values('7000','7777','test1','test2');--문자열로 썻지만 문자가 아닌 숫자로 들어감
select * from EX01;

--중복불허 UNIQUE
create table ex02(
	num1 number unique,
	num2 number,
	msg1 varchar2(10) unique,
	msg2 varchar2(10)
);

insert into ex02 values(1111,1111,'test1','test1');
insert into ex02 values(2222,2222,'test2','test2');
insert into ex02 values(3333,3333,'test3','test3');
insert into ex02 values(2222,2222,'test4','test4');--무결성 제약조건에 위배 
insert into ex02 values(4444,4444,'test2','test4');--무결성 제약조건에 위배 
insert into ex02 values(4444,4444,null,'test4');--notnull 아니기때문에 가능, 또한 null은 값이 아니기때문에 중복 가능하다
insert into ex02 values(5555,5555,null,'test5');--unique와 null 같이주면 중복이 가능
select * from ex02;


--primary key:유일키값
--다중primary key 사용할 수 있는 db가 있긴하다. 
create table ex03(
	num1 number primary key,  -- primary key 는 unique&notnull 이다 primary key는 보통 일반적인 db에서는 table당 1개만 부여가능
	num2 number unique not null,
	msg1 varchar2(10) unique not null,
	msg2 varchar2(10) 
);
insert into ex03 values(1111,1111,'test1','test1');
insert into ex03 values(2222,2222,'test2','test2');
insert into ex03 values(3333,3333,'test3','test3');

insert into ex03 values(2222,4444,'test4','test4');--unique notnull 모두 적용받는다 

drop table ex04;
--부모테이블
create table ex04(
	num1 number primary key,
	num2 number
);
--자식테이블 //부모테이블에 있어야 자식테이블에 가능함
create table ex05(
	num1 number primary key,
	num2 number references ex04(num1)
);

insert into ex04 values (1111,1111);
insert into ex04 values (2222,2222);
insert into ex04 values (3333,3333);
insert into ex05 values (1111,1111);
insert into ex05 values (2222,2222);
insert into ex05 values (3333,1111); --ex05의 num2는 ex04의 num1에 있는 값만 가능하다 unique 가 없으면 부모값에서
									 -- 자식에 여러번 가져다 쓸 수 있다.

insert into ex04 values(4444,4444);
insert into ex05 values(4444,4444);--ex05먼저 시행시키면 무결성제약조건 위배(부모키 없음 )이 된다 


select ename, deptno from emp;
select * from dept;--deptno=dept에서 emp 가 reference함 (emp deptno =references dept(deptno)) 

--check
create table ex06(
	num number primary key,
	name varchar2(10),
	gender char(3) check (gender in('남','여'))--in()->괄호안의여러개 한번에 넣음 이 경우엔 남 여 만 데이터로 사용 가능하게 함
	);

insert into ex06 values(1111,'test1','남');
insert into ex06 values(2222,'test2','여');


insert into ex06 values(3333,'test3','외');--체크 제약조건에 위배 

create table ex07(
	num number primary key,
	name varchar2(10),
	age number check (age between 1 and 80)
);
insert into ex07 values (1,'test1',1);
insert into ex07 values (2,'test2',10);
insert into ex07 values (3,'test3',15);
insert into ex07 values (4,'test4',80);

insert into ex07 values (5,'test5',0);--체크 조건 통해 조건을 만족하는 경우들만 가능하다. 

--default
create table ex08(
	num1 number primary key,
	num2 number default 100,
	sub varchar2(12)default '제목없음'
);
insert into ex08 values (1111,1111,'test1');
insert into ex08(num1) values(2222);--default 값이 들어간다. 
insert into ex08 values(3333,null,null);--null 을 입력하면 null값이 들어간다. 
select * from ex08;
--제약조건은 자료형 이후에 입력해도 된다. (제약조건 명명법    테이블명_컬럼명_제약조건  )
create table ex09(
	num1 number,
	num2 number,
	msg1 varchar2(10),
	msg2 varchar2(10) constraint ex09_msg2_nn not null, 
	constraint ex09_num1_pk primary key(num1),  --constraint 로 제약조건들에 이름을 줄 수 있담
	constraint ex09_msg1_uq unique(msg1),
	constraint ex09_fk foreign key(num2) references ex08(num1)--foreign key:외래 키 ~~
);

insert into ex09 values(1111,1111,'test1','test1');
insert into ex09 values(3333,1111,'test1','test1');
insert into ex09 values(2222,9999,'test2','test1');--오류 메세지에 제약조건 위반과 함께 조건명 뜬다. 


drop table ex04;--부모테이블은 자식테이블을 먼저 지워야 지울수 있다. 
--하지만 데이터 담고 있는 테이블 지운다는건 부담이 되기 때문에  05의 조건을 지워 04drop 가능하게 할 수 도 ㅇㅣㅆ다. 

alter table ex09 drop constraint ex09_fk;
alter table ex09 drop constraint ex09_msg1_uq;--제약조건 조건명 부여했을때  제약조건만 삭제가 가능해진다
alter table ex09 drop constraint ex09_num1_pk;

alter table ex09 add constraint ex09_num1_pk primary key(num1);--제약조건을 나중에도 alter 이용하여	 추가 설정할 수 있다. 
--쿼리 구문에서 제약조건을 걸어놓으면 데이터 입력 시에 오류가 생겨 오류 감지할 수 있다. (무결성 지킬 수 있다. 오류가 항상 나쁜것이 아님)


















