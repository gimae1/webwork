drop table bbs06;
drop sequence bbs06_seq;
--

create table bbs06(
	num number primary key,
	id varchar2(30),
	nalja date,
	sub varchar2(30),
	content varchar2(2000)
);
create sequence bbs06_seq;

--
insert into bbs06 values (bbs06_seq.nextval,'user1',sysdate,'테스트1','테스트');
insert into bbs06 values (bbs06_seq.nextval,'user2',sysdate,'테스트2','테스트');
insert into bbs06 values (bbs06_seq.nextval,'user1',sysdate,'테스트3','테스트');
insert into bbs06 values (bbs06_seq.nextval,'user2',sysdate,'테스트4','테스트');
insert into bbs06 values (bbs06_seq.nextval,'user3',sysdate,'테스트5','테스트');
commit;

select * from bbs06;


