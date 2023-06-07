
--회원 테이블
CREATE TABLE member (
    id VARCHAR2(20)	NOT NULL primary key,
	password VARCHAR2(20) NULL,
	name VARCHAR2(20) NULL,
	phone VARCHAR2(15) NULL,
	birth DATE NULL,
	email VARCHAR2(40) NULL
);

--관리자 테이블
CREATE TABLE admin (
	a_id VARCHAR2(20) NOT NULL primary key,
	a_password VARCHAR2(20) NULL,
	a_name VARCHAR2(20)	NULL,
	a_phone VARCHAR2(15) NULL
);

--예약 테이블
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

--공연 테이블
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

--후기 테이블
CREATE TABLE review (
	rseq NUMBER	NOT NULL primary key,
	id	VARCHAR2(20) NULL,
	tseq NUMBER NOT NULL,
	regdate	DATE DEFAULT sysdate,
	rpoint NUMBER NOT NULL,
	rcontent VARCHAR2(100) NOT NULL
);

--공지사항 테이블
CREATE TABLE notice (
	nseq NUMBER	NOT NULL primary key,
	a_id VARCHAR2(20) NOT NULL,
	title VARCHAR2(30) NOT NULL,
	ndate DATE DEFAULT sysdate,
	ncontent VARCHAR2(200) NOT NULL
);

--예약 시퀀스
CREATE SEQUENCE bseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;
       
--공연 시퀀스       
CREATE SEQUENCE tseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;
       
--후기 시퀀스     
CREATE SEQUENCE rseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;
       
--공지사항 시퀀스       
CREATE SEQUENCE nseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;       

--콘서트 데이터
insert into total_ent values(tseq.NEXTVAL,'1','노을 콘서트 Cafe 유월','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','Cafe 유월','Cafe 유월_D');
insert into total_ent values(tseq.NEXTVAL,'1','BRUNO MAJOR 내한 공연','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','BRUNO MAJOR','BRUNO MAJOR_D');
insert into total_ent values(tseq.NEXTVAL,'1','MY AUNT MARY 단독 공연','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','MY AUNT MARY','MY AUNT MARY_D');
insert into total_ent values(tseq.NEXTVAL,'1','UFO STATION 페스티벌','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','UFO STATION','UFO STATION_D');
insert into total_ent values(tseq.NEXTVAL,'1','나캠든 팬미팅','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','나캠든개론','나캠든개론_D');
insert into total_ent values(tseq.NEXTVAL,'1','SMILE LOVE WEEKEND','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','스마일러브위크엔드','스마일러브위크엔드_D');
insert into total_ent values(tseq.NEXTVAL,'1','GEORGE 단독 콘서트','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','죠지 단독','죠지 단독_D');
insert into total_ent values(tseq.NEXTVAL,'1','차학연 팬미팅','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','차학연','차학연_D');
insert into total_ent values(tseq.NEXTVAL,'1','코다라인 내한 공연','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,'s120,a130,b120','코다라인','코다라인_D');


--연극 데이터
insert into total_ent values(tseq.NEXTVAL,'2','망원동 브라더스','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'망원동 브라더스','망원동 브라더스_D');
insert into total_ent values(tseq.NEXTVAL,'2','비누향기','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'비누향기','비누향기_D');
insert into total_ent values(tseq.NEXTVAL,'2','세일즈맨의 죽음','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'세일즈맨의 죽음','세일즈맨의 죽음_D');
insert into total_ent values(tseq.NEXTVAL,'2','수상한 흥신소','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'수상한 흥신소','수상한 흥신소_D');
insert into total_ent values(tseq.NEXTVAL,'2','연극 라면','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'연극 라면','연극 라면_D');
insert into total_ent values(tseq.NEXTVAL,'2','오백에 삼십','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'오백에 삼십','오백에 삼십_D');
insert into total_ent values(tseq.NEXTVAL,'2','옥탑방 고양이','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'옥탑방 고양이','옥탑방 고양이_D');
insert into total_ent values(tseq.NEXTVAL,'2','최초의 웃음','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'최초의 웃음','최초의 웃음_D');
insert into total_ent values(tseq.NEXTVAL,'2','행오버','우리집','19:00',to_date('2023-11-11','yyyy-mm-dd'),to_date('2023-11-13','yyyy-mm-dd'),8000,80,'행오버','행오버_D');

--관리자 데이터 
insert into admin(a_id, a_password, a_name, a_phone)
values('admin', '1234', '관리자', '010-3333-4444');


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
