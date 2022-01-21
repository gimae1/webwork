create table bbs01(
	num number,
	sub varchar2(30),
	nalja date,
	content varchar2(2000)
);
insert into bbs01 values (1, 'test1', sysdate, 'test content');
insert into bbs01 values (2, 'test2', sysdate, 'test content');
insert into bbs01 values (3, 'test3', sysdate, 'test content');
insert into bbs01 values (4, 'test4', sysdate, 'test content');
insert into bbs01 values (5, 'test5', sysdate, 'test content');
insert into bbs01 values (6, 'test6', sysdate, 'test content');

commit;
select *from bbs01;
select max(num)+1 from bbs01;
