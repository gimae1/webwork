drop table bbs02;
drop sequence bbs02_seq;
create table bbs02(
	num number,
	sub varchar2(30),
	content varchar2(2000),
	nalja date
);
--
create sequence bbs02_seq;
--
insert into bbs02 values (bbs02_seq.nextval,'test1','test',sysdate); 
insert into bbs02 values (bbs02_seq.nextval,'test2','test',sysdate); 
insert into bbs02 values (bbs02_seq.nextval,'test3','test',sysdate); 
insert into bbs02 values (bbs02_seq.nextval,'test4','test',sysdate); 
insert into bbs02 values (bbs02_seq.nextval,'test5','test',sysdate); 
commit;
select * from bbs02;