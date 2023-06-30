
-- ����� ���̺�
-- �÷���: ���̵�, ��й�ȣ, �̸�, ��ȭ��ȣ, �������, �̸���
create table member (
    id varchar2(20) primary key,
    password varchar2(20) not null,
    name varchar2(20) not null,
    phone varchar2(15) not null,
    birth Date,
    email varchar2(40) not null
);

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

insert into admin (a_id, a_password, a_name, a_phone)
values('kto5294', 'xodnr9848@', '������', '010-1111-2222');

select * from admin;

--------------------------------------------------------------------------------------------------------------

-- ���� ���̺�
-- �÷���: ���Ź�ȣ, ������ȣ, ��������, �¼�, ���̵�, �����ο���, ��������, ��������
CREATE TABLE booking (
   bseq NUMBER   NOT NULL primary key,
   tseq NUMBER   NOT NULL,
        constraint fk_bo_tseq foreign key(tseq) references total_ent(tseq),
   bstatus VARCHAR2(20) NOT NULL,
   seat VARCHAR2(500) NOT NULL,
   id VARCHAR2(20)   NOT NULL,
        constraint fk_bo_id foreign key(id) references member(id),
   head NUMBER   NOT NULL,
   today DATE NOT NULL,
   dday DATE NOT NULL
);

--------------------------------------------------------------------------------------------------------------

-- �ֹ� ���̺�
-- �÷���: �ֹ���ȣ, ������ȣ, �¼�, ���̵�, �����ο���, ��������
CREATE TABLE orders (
   oseq NUMBER   NOT NULL primary key,
   tseq NUMBER   NOT NULL,
        constraint fk_or_tseq foreign key(tseq) references total_ent(tseq),
   seat VARCHAR2(500) NOT NULL,
   id VARCHAR2(20)   NOT NULL,
        constraint fk_or_id foreign key(id) references member(id),
   head NUMBER   NOT NULL,
   dday DATE NOT NULL
);

--------------------------------------------------------------------------------------------------------------

-- ���� ���̺�
-- �÷���: ������ȣ, ����, ������, ���, �ð�, ����������, ����������, ����, �¼�, �������̹���, �����̹���
CREATE TABLE total_ent (
   tseq NUMBER   NOT NULL primary key,
   category CHAR(1) NOT NULL,
   tname VARCHAR2(40) NOT NULL,
   place VARCHAR2(100)   NOT NULL,
   time VARCHAR2(15) NULL,
    sdate DATE NOT NULL,
   edate DATE NOT NULL,
   price NUMBER NOT NULL,
   seat VARCHAR(30) NULL,
   pimg VARCHAR2(100) NULL,
   cimg VARCHAR2(100) NOT NULL
);

--------------------------------------------------------------------------------------------------------------

-- �������� ���̺�
-- �÷���: ������ȣ, �����ھ��̵�, ����, �����ۼ���, ����
CREATE TABLE notice (
   nseq NUMBER   NOT NULL primary key,
   a_id VARCHAR2(20) NOT NULL,
        constraint fk_no_a_id foreign key(a_id) references admin(a_id),
   title VARCHAR2(80) NOT NULL,
   ndate DATE DEFAULT sysdate,
   ncontent VARCHAR2(2000) NOT NULL
);

--------------------------------------------------------------------------------------------------------------

-- �ı� ���̺�
-- �÷���: �ı��ȣ, ���̵�, �������ȣ, �ı��ۼ���, ����, ���� 
CREATE TABLE review (
   rseq NUMBER   NOT NULL primary key,
   id   VARCHAR2(20) NULL,
        constraint fk_re_id foreign key(id) references member(id),
   tseq NUMBER NOT NULL,
        constraint fk_re_tseq foreign key(tseq) references total_ent(tseq),
   regdate   DATE DEFAULT sysdate,
   rpoint NUMBER NOT NULL,
   rcontent VARCHAR2(150) NOT NULL
);

--------------------------------------------------------------------------------------------------------------

-- �ܼ�Ʈ ������
insert into total_ent values(tseq.NEXTVAL,'1','���� �ܼ�Ʈ Cafe ����','�������б� ���ֳ���� �ܼ�ƮȦ','18:00',to_date('2023-07-08','yyyy-mm-dd'),to_date('2023-07-09','yyyy-mm-dd'),80000,'s20a30b40','Cafe ����','Cafe ����_D');
insert into total_ent values(tseq.NEXTVAL,'1','BRUNO MAJOR ���� ����','YES24 LIVE HALL','20:00',to_date('2023-08-10','yyyy-mm-dd'),to_date('2023-08-11','yyyy-mm-dd'),90000,'s20a30b40','BRUNO MAJOR','BRUNO MAJOR_D');
insert into total_ent values(tseq.NEXTVAL,'1','MY AUNT MARY �ܵ� ����','���Ż� ������ musinsa garage','17:00',to_date('2023-07-15','yyyy-mm-dd'),to_date('2023-07-16','yyyy-mm-dd'),89000,'s20a30b40','MY AUNT MARY','MY AUNT MARY_D');
insert into total_ent values(tseq.NEXTVAL,'1','UFO STATION �佺Ƽ��','������ �������丮 D�� 3��','21:00',to_date('2023-07-15','yyyy-mm-dd'),to_date('2023-07-15','yyyy-mm-dd'),66000,'s20a30b40','UFO STATION','UFO STATION_D');
insert into total_ent values(tseq.NEXTVAL,'1','��ķ�� �ҹ���','YES24 LIVE HALL','20:00',to_date('2023-07-22','yyyy-mm-dd'),to_date('2023-07-22','yyyy-mm-dd'),70000,'s20a30b40','��ķ�簳��','��ķ�簳��_D');
insert into total_ent values(tseq.NEXTVAL,'1','SMILE LOVE WEEKEND','�������丮','17:00',to_date('2023-07-15','yyyy-mm-dd'),to_date('2023-07-16','yyyy-mm-dd'),66000,'s20a30b40','�����Ϸ�����ũ����','�����Ϸ�����ũ����_D');
insert into total_ent values(tseq.NEXTVAL,'1','GEORGE �ܵ� �ܼ�Ʈ','YES24 LIVE HALL','18:00',to_date('2023-07-23','yyyy-mm-dd'),to_date('2023-07-23','yyyy-mm-dd'),80000,'s20a30b40','���� �ܵ�','���� �ܵ�_D');
insert into total_ent values(tseq.NEXTVAL,'1','���п� �ҹ���','YES24 LIVE HALL','19:00',to_date('2023-07-22','yyyy-mm-dd'),to_date('2023-07-23','yyyy-mm-dd'),99000,'s20a30b40','���п�','���п�_D');
insert into total_ent values(tseq.NEXTVAL,'1','�ڴٶ��� ���� ����','YES24 LIVE HALL','20:00',to_date('2023-09-22','yyyy-mm-dd'),to_date('2023-09-22','yyyy-mm-dd'),99000,'s20a30b40','�ڴٶ���','�ڴٶ���_D');

--���� ������
insert into total_ent values(tseq.NEXTVAL,'2','������ ������','ȫ�� ���̿�������','17:00',to_date('2023-02-12','yyyy-mm-dd'),to_date('2023-12-31','yyyy-mm-dd'),50000,'����8����9','������ ������','������ ������_D');
insert into total_ent values(tseq.NEXTVAL,'2','�����','���з� ������ƮȦ','15:20',to_date('2023-01-10','yyyy-mm-dd'),to_date('2023-12-31','yyyy-mm-dd'),50000,'����8����7','�����','�����_D');
insert into total_ent values(tseq.NEXTVAL,'2','��������� ����','���׸� ������','19:00',to_date('2023-06-16','yyyy-mm-dd'),to_date('2023-07-16','yyyy-mm-dd'),60000,'����9����7','��������� ����','��������� ����_D');
insert into total_ent values(tseq.NEXTVAL,'2','������ ��ż�','�ұ��� ���� 1��','18:00',to_date('2023-03-11','yyyy-mm-dd'),to_date('2023-12-31','yyyy-mm-dd'),35000,'����9����7','������ ��ż�','������ ��ż�_D');
insert into total_ent values(tseq.NEXTVAL,'2','���� ���','���з� ���Ǿ�����','19:00',to_date('2023-03-04','yyyy-mm-dd'),to_date('2023-07-31','yyyy-mm-dd'),50000,'����8����9','���� ���','���� ���_D');
insert into total_ent values(tseq.NEXTVAL,'2','���鿡 ���','���з� �����Ʈ���� 1��','17:00',to_date('2023-04-01','yyyy-mm-dd'),to_date('2023-07-31','yyyy-mm-dd'),40000,'����7����6','���鿡 ���','���鿡 ���_D');
insert into total_ent values(tseq.NEXTVAL,'2','��ž�� �����','���з� ƾƾȦ','19:30',to_date('2023-03-01','yyyy-mm-dd'),to_date('2023-07-31','yyyy-mm-dd'),10000,'����8����8','��ž�� �����','��ž�� �����_D');
insert into total_ent values(tseq.NEXTVAL,'2','������ ����','������ ��','18:00',to_date('2023-05-31','yyyy-mm-dd'),to_date('2023-07-04','yyyy-mm-dd'),50000,'����9����8','������ ����','������ ����_D');
insert into total_ent values(tseq.NEXTVAL,'2','�����','������','18:00',to_date('2023-01-31','yyyy-mm-dd'),to_date('2023-07-31','yyyy-mm-dd'),40000,'����7����6','�����','�����_D');

--����ȸ ������
insert into total_ent values(tseq.NEXTVAL, '3', '���� ���� �긲 ������', '���� �� ���������������', '-', to_date('2023-09-22','yyyy-mm-dd'), to_date('2023-10-22','yyyy-mm-dd'), 8000, '����20����20', '����', '����_D');
insert into total_ent values(tseq.NEXTVAL, '3', '���̽� ����', '������Ʈ���� ��Ʈ�� 1-3��', '-', to_date('2023-06-13','yyyy-mm-dd'), to_date('2023-08-31','yyyy-mm-dd'), 15000, '����20����20', '�����', '�����_D');
insert into total_ent values(tseq.NEXTVAL, '3', '���̺��� �긮Ƽ�� �˾�Ʈ', 'DDP', '-', to_date('2023-03-23','yyyy-mm-dd'), to_date('2023-09-02','yyyy-mm-dd'), 20000, '����20����20', '�˾�Ʈ', '�˾�Ʈ_D');
insert into total_ent values(tseq.NEXTVAL, '3', 'Seoul POPCON', '���� �ڿ��� C,DȦ', '-', to_date('2023-08-25','yyyy-mm-dd'), to_date('2023-08-27','yyyy-mm-dd'), 28000, '����20����20', '���� ����', '���� ����_D');
insert into total_ent values(tseq.NEXTVAL, '3', 'BAR/SPRIT SHOW', '���� �ڿ��� DȦ', '-', to_date('2023-07-28','yyyy-mm-dd'), to_date('2023-07-30','yyyy-mm-dd'), 25000, '����20����20', '����پؽ��Ǹ���', '����پؽ��Ǹ���_D');
insert into total_ent values(tseq.NEXTVAL, '3', '���� SUBLIME', '������ ���̺�', '-', to_date('2023-06-17','yyyy-mm-dd'), to_date('2023-09-17','yyyy-mm-dd'), 20000, '����20����20', '����', '����_D');
insert into total_ent values(tseq.NEXTVAL, '3', '�ؼ��� ������ �ູ����', '���� ������ȭ������', '-', to_date('2023-05-04','yyyy-mm-dd'), to_date('2023-10-29','yyyy-mm-dd'), 15000, '����20����20', '�ؼ���', '�ؼ���_D');
insert into total_ent values(tseq.NEXTVAL, '3', '�ٸ��� �Ͼ�Ʈ��', '�������� �Ͼ�Ʈ������', '-', to_date('2023-04-21','yyyy-mm-dd'), to_date('2023-07-30','yyyy-mm-dd'), 7000, '����20����20', '�ٸ���', '�ٸ���_D');
insert into total_ent values(tseq.NEXTVAL, '3', '��ī�ҿ� 20���� �����', '���̾�Ʈ������', '-', to_date('2023-03-24','yyyy-mm-dd'), to_date('2023-08-27','yyyy-mm-dd'), 20000, '����20����20', '��ī��', '��ī��_D');
insert into total_ent values(tseq.NEXTVAL, '3', '��ī�ҿ� 20���� �����', '���̾�Ʈ������', '-', to_date('2023-03-24','yyyy-mm-dd'), to_date('2023-08-27','yyyy-mm-dd'), 20000, '����100����50', '��ī��', '��ī��_D');


--------------------------------------------------------------------------------------------------------------

--���� ������
CREATE SEQUENCE bseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;


--�ı� ������     
CREATE SEQUENCE rseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;
--���� ������       
CREATE SEQUENCE tseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;

--�ֹ� ������       
CREATE SEQUENCE oseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;
       
--�������� ������       
CREATE SEQUENCE nseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;       

commit;