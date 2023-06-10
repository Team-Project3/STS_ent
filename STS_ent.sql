-- ����� ���̺�
-- �÷���: ���̵�, ��й�ȣ, �̸�, ��ȭ��ȣ, �������, �̸���
create table member (
    id varchar(20) primary key,
    password varchar2(20) not null,
    name varchar2(40) not null,
    phone varchar2(20) not null,
    birth varchar2(12),
    email varchar2(40) not null
);

insert into member values('heysh', 'dkssud5124!', '�輼��', '010-4062-9457', '1995/11/11', 'heysh@sts.com');

select * from member;

--------------------------------------------------------------------------------------------------------------

-- ������ ���̺�
-- �÷���: ���̵�, ��й�ȣ, �̸�, ��ȭ��ȣ
create table admin (
    a_id varchar2(20) primary key,
    a_password varchar2(20) not null,
    a_name varchar2(20) not null,
    a_phone varchar2(15)
);

insert into admin (a_id, a_password, a_name, a_phone)
values('admin', '1234', '������', '010-1111-2222');

select * from admin;

--------------------------------------------------------------------------------------------------------------

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

--���� ������
CREATE SEQUENCE bseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;

--------------------------------------------------------------------------------------------------------------

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

--���� ������       
CREATE SEQUENCE tseq
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


--����ȸ ������
insert into total_ent values(tseq.NEXTVAL, '3', '���� ���� �긲 ������', '���� �� ���������������', '-', to_date('2023-09-22','yyyy-mm-dd'), to_date('2023-10-22','yyyy-mm-dd'), 8000, '-', '����', '����_D');
insert into total_ent values(tseq.NEXTVAL, '3', '���̽� ����', '������Ʈ���� ��Ʈ�� 1-3��', '-', to_date('2023-06-13','yyyy-mm-dd'), to_date('2023-08-31','yyyy-mm-dd'), 15000, '-', '�����', '�����_D');
insert into total_ent values(tseq.NEXTVAL, '3', '���̺��� �긮Ƽ�� �˾�Ʈ', 'DDP', '-', to_date('2023-03-23','yyyy-mm-dd'), to_date('2023-07-02','yyyy-mm-dd'), 20000, '-', '�˾�Ʈ', '�˾�Ʈ_D');
insert into total_ent values(tseq.NEXTVAL, '3', 'Seoul POPCON', '���� �ڿ��� C,DȦ', '-', to_date('2023-08-25','yyyy-mm-dd'), to_date('2023-08-27','yyyy-mm-dd'), 28000, '-', '���� ����', '���� ����_D');
insert into total_ent values(tseq.NEXTVAL, '3', 'BAR/SPRIT SHOW', '���� �ڿ��� DȦ', '-', to_date('2023-07-28','yyyy-mm-dd'), to_date('2023-07-30','yyyy-mm-dd'), 25000, '-', '����پؽ��Ǹ���', '����پؽ��Ǹ���_D');
insert into total_ent values(tseq.NEXTVAL, '3', '���� SUBLIME', '������ ���̺�', '-', to_date('2023-06-17','yyyy-mm-dd'), to_date('2023-09-17','yyyy-mm-dd'), 20000, '-', '����', '����_D');
insert into total_ent values(tseq.NEXTVAL, '3', '�ؼ��� ������ �ູ����', '���� ������ȭ������', '-', to_date('2023-05-04','yyyy-mm-dd'), to_date('2023-10-29','yyyy-mm-dd'), 15000, '-', '�ؼ���', '�ؼ���_D');
insert into total_ent values(tseq.NEXTVAL, '3', '�ٸ��� �Ͼ�Ʈ��', '�������� �Ͼ�Ʈ������', '-', to_date('2023-04-21','yyyy-mm-dd'), to_date('2023-07-30','yyyy-mm-dd'), 7000, '-', '�ٸ���', '�ٸ���_D');
insert into total_ent values(tseq.NEXTVAL, '3', '��ī�ҿ� 20���� �����', '���̾�Ʈ������', '-', to_date('2023-03-24','yyyy-mm-dd'), to_date('2023-08-27','yyyy-mm-dd'), 20000, '-', '��ī��', '��ī��_D');

select * from total_ent where category=3;


--------------------------------------------------------------------------------------------------------------

--�ı� ���̺�
CREATE TABLE review (
	rseq NUMBER	NOT NULL primary key,
	id	VARCHAR2(20) NULL,
	tseq NUMBER NOT NULL,
	regdate	DATE DEFAULT sysdate,
	rpoint NUMBER NOT NULL,
	rcontent VARCHAR2(100) NOT NULL
);

--�ı� ������     
CREATE SEQUENCE rseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;

--------------------------------------------------------------------------------------------------------------

--�������� ���̺�
CREATE TABLE notice (
	nseq NUMBER	NOT NULL primary key,
	a_id VARCHAR2(20) NOT NULL,
	title VARCHAR2(30) NOT NULL,
	ndate DATE DEFAULT sysdate,
	ncontent VARCHAR2(200) NOT NULL
);

       
--�������� ������       
CREATE SEQUENCE nseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;       







commit;

