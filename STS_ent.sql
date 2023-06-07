
--ȸ�� ���̺�
CREATE TABLE member (
    id VARCHAR2(20)	NOT NULL primary key,
	password VARCHAR2(20) NULL,
	name VARCHAR2(20) NULL,
	phone VARCHAR2(15) NULL,
	birth DATE NULL,
	email VARCHAR2(40) NULL
);

--������ ���̺�
CREATE TABLE admin (
	a_id VARCHAR2(20) NOT NULL primary key,
	a_password VARCHAR2(20) NULL,
	a_name VARCHAR2(20)	NULL,
	a_phone VARCHAR2(15) NULL
);

--���� ���̺�
CREATE TABLE booking (
	bseq NUMBER	NOT NULL primary key,
	tseq NUMBER	NOT NULL,
	bstatus VARCHAR2(20) NOT NULL,
	seat VARCHAR2(200) NOT NULL,
	id VARCHAR2(20)	NOT NULL,
	head NUMBER	NOT NULL,
	today DATE NOT NULL,
	dday DATE NOT NULL
);

--���� ���̺�
CREATE TABLE total_ent (
	tseq NUMBER	NOT NULL primary key,
	category CHAR NOT NULL,
	tname VARCHAR2(40) NOT NULL,
	place VARCHAR2(100)	NOT NULL,
	time VARCHAR2(15) NULL,
    sdate DATE NOT NULL,
	edate DATE NOT NULL,
	price NUMBER NOT NULL,
	seat VARCHAR(255) NULL,
	pimg VARCHAR2(40) NULL,
	cimg VARCHAR2(40) NOT NULL
);

--�ı� ���̺�
CREATE TABLE review (
	rseq NUMBER	NOT NULL primary key,
	id	VARCHAR2(20) NULL,
	tseq NUMBER NOT NULL,
	regdate	DATE DEFAULT sysdate,
	rpoint NUMBER NOT NULL,
	rcontent VARCHAR2(100) NOT NULL
);

--�������� ���̺�
CREATE TABLE notice (
	nseq NUMBER	NOT NULL primary key,
	a_id VARCHAR2(20) NOT NULL,
	title VARCHAR2(30) NOT NULL,
	ndate DATE DEFAULT sysdate,
	ncontent VARCHAR2(200) NOT NULL
);

--���� ������
CREATE SEQUENCE bseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;
       
--���� ������       
CREATE SEQUENCE tseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;
       
--�ı� ������     
CREATE SEQUENCE rseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;
       
--�������� ������       
CREATE SEQUENCE nseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;       

--�ܼ�Ʈ ������
insert into total_ent values(tseq.NEXTVAL,'1','���� �ܼ�Ʈ Cafe ����','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','Cafe ����','Cafe ����_D');
insert into total_ent values(tseq.NEXTVAL,'1','BRUNO MAJOR ���� ����','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','BRUNO MAJOR','BRUNO MAJOR_D');
insert into total_ent values(tseq.NEXTVAL,'1','MY AUNT MARY �ܵ� ����','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','MY AUNT MARY','MY AUNT MARY_D');
insert into total_ent values(tseq.NEXTVAL,'1','UFO STATION �佺Ƽ��','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','UFO STATION','UFO STATION_D');
insert into total_ent values(tseq.NEXTVAL,'1','��ķ�� �ҹ���','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','��ķ�簳��','��ķ�簳��_D');
insert into total_ent values(tseq.NEXTVAL,'1','SMILE LOVE WEEKEND','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','�����Ϸ�����ũ����','�����Ϸ�����ũ����_D');
insert into total_ent values(tseq.NEXTVAL,'1','GEORGE �ܵ� �ܼ�Ʈ','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','���� �ܵ�','���� �ܵ�_D');
insert into total_ent values(tseq.NEXTVAL,'1','���п� �ҹ���','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','���п�','���п�_D');
insert into total_ent values(tseq.NEXTVAL,'1','�ڴٶ��� ���� ����','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','�ڴٶ���','�ڴٶ���_D');


--���� ������
insert into total_ent values(tseq.NEXTVAL,'2','������ ������','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'������ ������','������ ������_D');
insert into total_ent values(tseq.NEXTVAL,'2','�����','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'�����','�����_D');
insert into total_ent values(tseq.NEXTVAL,'2','��������� ����','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'��������� ����','��������� ����_D');
insert into total_ent values(tseq.NEXTVAL,'2','������ ��ż�','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'������ ��ż�','������ ��ż�_D');
insert into total_ent values(tseq.NEXTVAL,'2','���� ���','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'���� ���','���� ���_D');
insert into total_ent values(tseq.NEXTVAL,'2','���鿡 ���','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'���鿡 ���','���鿡 ���_D');
insert into total_ent values(tseq.NEXTVAL,'2','��ž�� �����','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'��ž�� �����','��ž�� �����_D');
insert into total_ent values(tseq.NEXTVAL,'2','������ ����','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'������ ����','������ ����_D');
insert into total_ent values(tseq.NEXTVAL,'2','�����','�츮��','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'�����','�����_D');

--������ ������ 
insert into admin(a_id, a_password, a_name, a_phone)
values('admin', '1234', '������', '010-3333-4444');


select * from total_ent;
select * from admin;

commit;


--
--
--
--
--
--
--
--
--
--
drop table member;
drop table admin;
drop table booking;
drop table notice;
drop table review;
drop table total_ent;
drop sequence tseq;
