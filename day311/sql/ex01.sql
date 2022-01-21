--문자열함수(단일함수)
select 'aAbBcCdD', lower('aAbBcCdD'), upper('aAbBcCdD')from dual;
select ename, empno, sal from emp where lower(ename)='scott';--value 값인 scott은 대소문자를 구분하므로 만약 
--scott 이 대문자인지 소문자인지 모르는 상황에서는 조건 ename 을 소문자로 변환하여 검색해준다

select initcap ('aAbBcCdD') from dual;--첫번째 글자만 대문자로 (띄어쓰기 기준 첫글자)
select initcap ('aAbB cCdD') from dual;

select concat('문자', '열') from dual;--문자+열
select concat('문',concat('자' ,'열')) from dual;--문+자+열

select substr ('aAbBcCdD',1,3)from dual;--sql은 0부터가 아닌 1부터 센다
select SUBSTRB('aAbBcCdD',1,3)from dual;

select substr ('한글로 작성',1,3)from dual;--한글은 3바이트 쓴다. 
select SUBSTRB('한글로 작성',1,6)from dual;--b는 byte의 b 따라서 1~3byte 뜻하기 때문에 '한' 만 표시한다 
--뒤에 b 가 붙은 함수들은 다 byte로 계산하겠다는 뜻. 

select length ('aAbBcCdD') from dual;
select lengthb('aAbBcCdD') from dual;

select length ('한글로작성') from dual;
select lengthb('한글로작성') from dual;

select instr ('aAbBcCdD','b')from dual;
select instrb ('aAbBcCdD','b')from dual;

select instr ('한글로작성','로')from dual;
select instrb ('한글로작성','로')from dual;

select replace ('한글로작성', '로','만')from dual;

select lpad ('abc',10,'#') from dual;
select rpad ('abc',10,'#') from dual;

select lpad (rpad('   ab  c    ',20,'#'),30,'#')from dual;
select lpad (rpad(trim('   ab  c    '),20,'#'),30,'#')from dual;--앞 뒤의 공백 사라지게 함 (중간공백은X)
--trim('   ab  c    ') 
select trim ('#'from '#######ab##c#######')from dual;--trim과 from 함께 쓰면 앞뒤 문자도 자를수 있다

--숫자함수 (단일함수)
--abs(절대값 반환),floor(소수점 버림),round(올림) trunc(특정 자리수에서 버림) mod(나머지)

select 5/2,floor(5/2),mod (5,2) from dual;
select round(3.14),round(3.54) from dual;

select trunc(123.456) from dual;
select trunc(123.456,2) from dual;
select trunc(123.456,-2) from dual;
--날짜함수 
--sysdate(시스템의 현재 날짜),months_between(두 날짜 사이에 몇개월인지),
--add_months(특정 날짜에 개월 수를 더한다),next_day(특정 날짜에서 최초로 도래하는 인자로 받은 요일의 날짜를 반환) 
--last_day(해당 달의 마지막 날짜를 반환) round(인자로 받은 날짜를 특정 기준으로 반올림) trunc(인자로~ 버림)

select sysdate from dual;
select hiredate,sysdate,sysdate-hiredate from emp;--일 (day)을 기준으로 시간을 계산해준다
select months_between(sysdate,hiredate) from emp;

select sysdate-1 from dual;
select add_months(sysdate,-1) from dual;

select next_day(sysdate, '토요일')from dual;
select last_day(sysdate+20)from dual;

select round(sysdate,'month') from dual;
select trunc(sysdate,'month') from dual;

--변환함수
--숫자,날짜-> 문자열 to_char
select length(to_char(1234)) from dual;--숫자가 문자열로 바뀌어서 문자열함수 사용이 가능하다
select to_char(sysdate,'yy-mm-dd hh:mi:ss') from dual;
select to_char(sysdate,' hh:mi:ss') from dual;
select to_char(1234,'000000')from dual;--숫자를 문자열로 변환하면 숫자에 패턴(format)을 부여할 수 있어진다.
select to_char(1234,'999,999')from dual;
select to_char(1234,'000,000.00')from dual;
select to_char(1234,'S999,999.99')from dual;
select to_char(1234,'l999,999.99')from dual;
--문자열-> 날짜 to_date
select to_date('2201201200','yymmddhhmi')+1 from dual;

--문자열-> 숫자 to_number
select to_number('1234')+1 from dual;

select null+1234 from dual;--null과의 연산은 그냥 null 이 된다 

select ename, sal, comm,sal+comm from emp;--이때 null값을 0으로 계산하고자 한다면
select ename, sal, comm,sal+nvl(comm,0) from emp;--nvl 함수를 써서 null을 0으로 계산 
--문자열 null을 부호로 바꿀수 있음(자료의 nvl 타입은 일치해야함)

select *from dept;
delete from dept where deptno>40; 

select ename, decode(deptno,10,'관리팀',20,'영업팀',30,'총무팀') from emp;

select ename, 
			case
				 when deptno=10 then '관리팀'
				 when deptno=20 then '영업팀'
				 when deptno=30 then '총무팀'
				else '몰라'
				 end 
			from emp;








