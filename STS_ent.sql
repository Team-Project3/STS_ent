-- 사용자 테이블
-- 컬럼명: 아이디, 비밀번호, 이름, 전화번호, 생년월일, 이메일
create table member (
    id varchar(20) primary key,
    password varchar2(20) not null,
    name varchar2(40) not null,
    phone varchar2(20) not null,
    birth varchar2(12),
    email varchar2(40) not null
);

insert into member values('heysh', 'dkssud5124!', '김세현', '010-4062-9457', '1995/11/11', 'heysh@sts.com');

select * from member;

--------------------------------------------------------------------------------------------------------------

-- 관리자 테이블
-- 컬럼명: 아이디, 비밀번호, 이름, 전화번호
create table admin (
    a_id varchar2(20) primary key,
    a_password varchar2(20) not null,
    a_name varchar2(20) not null,
    a_phone varchar2(15)
);

insert into admin (a_id, a_password, a_name, a_phone)
values('admin', '1234', '관리자', '010-1111-2222');

select * from admin;

--------------------------------------------------------------------------------------------------------------

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

--예약 시퀀스
CREATE SEQUENCE bseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;

--------------------------------------------------------------------------------------------------------------

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

--공연 시퀀스       
CREATE SEQUENCE tseq
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


--전시회 데이터
insert into total_ent values(tseq.NEXTVAL, '3', '강원 세계 산림 엑스포', '강원 고성 세계잼버리수련장', '-', to_date('2023-09-22','yyyy-mm-dd'), to_date('2023-10-22','yyyy-mm-dd'), 8000, '-', '강원', '강원_D');
insert into total_ent values(tseq.NEXTVAL, '3', '루이스 웨인', '강동아트센터 아트랑 1-3층', '-', to_date('2023-06-13','yyyy-mm-dd'), to_date('2023-08-31','yyyy-mm-dd'), 15000, '-', '고양이', '고양이_D');
insert into total_ent values(tseq.NEXTVAL, '3', '데이비드와 브리티시 팝아트', 'DDP', '-', to_date('2023-03-23','yyyy-mm-dd'), to_date('2023-07-02','yyyy-mm-dd'), 20000, '-', '팝아트', '팝아트_D');
insert into total_ent values(tseq.NEXTVAL, '3', 'Seoul POPCON', '서울 코엑스 C,D홀', '-', to_date('2023-08-25','yyyy-mm-dd'), to_date('2023-08-27','yyyy-mm-dd'), 28000, '-', '서울 팝콘', '서울 팝콘_D');
insert into total_ent values(tseq.NEXTVAL, '3', 'BAR/SPRIT SHOW', '서울 코엑스 D홀', '-', to_date('2023-07-28','yyyy-mm-dd'), to_date('2023-07-30','yyyy-mm-dd'), 25000, '-', '서울바앤스피릿쇼', '서울바앤스피릿쇼_D');
insert into total_ent values(tseq.NEXTVAL, '3', '숭고 SUBLIME', '뮤지엄 웨이브', '-', to_date('2023-06-17','yyyy-mm-dd'), to_date('2023-09-17','yyyy-mm-dd'), 20000, '-', '숭고', '숭고_D');
insert into total_ent values(tseq.NEXTVAL, '3', '앤서니 브라운의 행복극장', '광주 민주평화교류원', '-', to_date('2023-05-04','yyyy-mm-dd'), to_date('2023-10-29','yyyy-mm-dd'), 15000, '-', '앤서니', '앤서니_D');
insert into total_ent values(tseq.NEXTVAL, '3', '앨리스 북아트전', '소전서림 북아트갤러리', '-', to_date('2023-04-21','yyyy-mm-dd'), to_date('2023-07-30','yyyy-mm-dd'), 7000, '-', '앨리스', '앨리스_D');
insert into total_ent values(tseq.NEXTVAL, '3', '피카소와 20세기 거장들', '마이아트뮤지엄', '-', to_date('2023-03-24','yyyy-mm-dd'), to_date('2023-08-27','yyyy-mm-dd'), 20000, '-', '피카소', '피카소_D');

select * from total_ent where category=3;


--------------------------------------------------------------------------------------------------------------

--후기 테이블
CREATE TABLE review (
	rseq NUMBER	NOT NULL primary key,
	id	VARCHAR2(20) NULL,
	tseq NUMBER NOT NULL,
	regdate	DATE DEFAULT sysdate,
	rpoint NUMBER NOT NULL,
	rcontent VARCHAR2(100) NOT NULL
);

--후기 시퀀스     
CREATE SEQUENCE rseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;

--------------------------------------------------------------------------------------------------------------

--공지사항 테이블
CREATE TABLE notice (
	nseq NUMBER	NOT NULL primary key,
	a_id VARCHAR2(20) NOT NULL,
	title VARCHAR2(30) NOT NULL,
	ndate DATE DEFAULT sysdate,
	ncontent VARCHAR2(200) NOT NULL
);

       
--공지사항 시퀀스       
CREATE SEQUENCE nseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;       







commit;

