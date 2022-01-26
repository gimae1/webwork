create sequence ex01_seq;
select ex01_seq.nextval from dual;
select ex01_seq.nextval,ex01_seq.nextval from dual;
--currval은 한번 이상의 nextval가 선행되어진 같은 세션에서만 사용이 가능하다
select ex01_seq.nextval, ex01_seq.currval from dual;
--특정 숫자로 시작하고싶다면 start with 
create sequence ex02_seq start with 10;
select ex02_seq.nextval from dual;
--특정 크기씩 증가  increment 
create sequence ex03_seq increment by 10;
select ex03_seq.nextval from dual;
--max value, min value 
--cycle, cache
drop sequence ex04_seq; 
create sequence ex04_seq start with 5 minvalue 1 maxvalue 10 cycle nocache;--nocache 여야 cycle 가능하다 
select ex04_seq.nextval from dual;-->start with 부터 max까지 간 다음 minvalue로  ex04_seq=5,6,7,8,9,10,1,2,3,4,5,6...
create sequence ex05_seq maxvalue 5 nocycle nocache;
select ex05_seq.nextval from dual;--nocycle 상태에선 max value 가 넘으면 seq 사용할 수 없다. 
create sequence ex06_seq cache 2;
select ex06_seq.nextval from dual;

select ename,loc from emp,dept;








