drop table bbs03;
drop sequence bbs03_seq;
create table bbs03(
	num number primary key,
	sub varchar2(30),
	id varchar2(20) not null,
	nalja date default sysdate,
	cnt number(10) default 0,
	content varchar2(2000)
);

create sequence bbs03_seq;
--dummy data
insert into bbs03 (num, sub, id, content) values(bbs03_seq.nextval,'제목없음','user01','test'); 
insert into bbs03 (num, sub, id, content) values(bbs03_seq.nextval,'제목없음','user02','test'); 
insert into bbs03 (num, sub, id, content) values(bbs03_seq.nextval,'제목없음','user03','test'); 
insert into bbs03 (num, sub, id, content) values(bbs03_seq.nextval,'제목없음','user04','test'); 
insert into bbs03 (num, sub, id, content) values(bbs03_seq.nextval,'제목없음','user05','test'); 

commit;
select * from bbs03;







