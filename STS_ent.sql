
-- 사용자 테이블
-- 컬럼명: 아이디, 비밀번호, 이름, 전화번호, 생년월일, 이메일
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

insert into admin (a_id, a_password, a_name, a_phone)
values('kto5294', 'xodnr9848@', '관리자', '010-1111-2222');

select * from admin;

--------------------------------------------------------------------------------------------------------------

-- 예약 테이블
-- 컬럼명: 예매번호, 공연번호, 결제상태, 좌석, 아이디, 예약인원수, 예약일자, 공연일자
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

-- 주문 테이블
-- 컬럼명: 주문번호, 공연번호, 좌석, 아이디, 예약인원수, 공연일자
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

-- 공연 테이블
-- 컬럼명: 공연번호, 종류, 공연명, 장소, 시간, 공연시작일, 공연종료일, 가격, 좌석, 포스터이미지, 정보이미지
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

-- 공지사항 테이블
-- 컬럼명: 공지번호, 관리자아이디, 제목, 공지작성일, 내용
CREATE TABLE notice (
   nseq NUMBER   NOT NULL primary key,
   a_id VARCHAR2(20) NOT NULL,
        constraint fk_no_a_id foreign key(a_id) references admin(a_id),
   title VARCHAR2(80) NOT NULL,
   ndate DATE DEFAULT sysdate,
   ncontent VARCHAR2(2000) NOT NULL
);

--------------------------------------------------------------------------------------------------------------

-- 후기 테이블
-- 컬럼명: 후기번호, 아이디, 공ㅇ녀번호, 후기작성일, 평점, 내용 
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

-- 콘서트 데이터
insert into total_ent values(tseq.NEXTVAL,'1','노을 콘서트 Cafe 유월','연세대학교 백주년기념관 콘서트홀','18:00',to_date('2023-07-08','yyyy-mm-dd'),to_date('2023-07-09','yyyy-mm-dd'),80000,'s20a30b40','Cafe 유월','Cafe 유월_D');
insert into total_ent values(tseq.NEXTVAL,'1','BRUNO MAJOR 내한 공연','YES24 LIVE HALL','20:00',to_date('2023-08-10','yyyy-mm-dd'),to_date('2023-08-11','yyyy-mm-dd'),90000,'s20a30b40','BRUNO MAJOR','BRUNO MAJOR_D');
insert into total_ent values(tseq.NEXTVAL,'1','MY AUNT MARY 단독 공연','무신사 개러지 musinsa garage','17:00',to_date('2023-07-15','yyyy-mm-dd'),to_date('2023-07-16','yyyy-mm-dd'),89000,'s20a30b40','MY AUNT MARY','MY AUNT MARY_D');
insert into total_ent values(tseq.NEXTVAL,'1','UFO STATION 페스티벌','성수동 에스팩토리 D동 3층','21:00',to_date('2023-07-15','yyyy-mm-dd'),to_date('2023-07-15','yyyy-mm-dd'),66000,'s20a30b40','UFO STATION','UFO STATION_D');
insert into total_ent values(tseq.NEXTVAL,'1','나캠든 팬미팅','YES24 LIVE HALL','20:00',to_date('2023-07-22','yyyy-mm-dd'),to_date('2023-07-22','yyyy-mm-dd'),70000,'s20a30b40','나캠든개론','나캠든개론_D');
insert into total_ent values(tseq.NEXTVAL,'1','SMILE LOVE WEEKEND','에스팩토리','17:00',to_date('2023-07-15','yyyy-mm-dd'),to_date('2023-07-16','yyyy-mm-dd'),66000,'s20a30b40','스마일러브위크엔드','스마일러브위크엔드_D');
insert into total_ent values(tseq.NEXTVAL,'1','GEORGE 단독 콘서트','YES24 LIVE HALL','18:00',to_date('2023-07-23','yyyy-mm-dd'),to_date('2023-07-23','yyyy-mm-dd'),80000,'s20a30b40','죠지 단독','죠지 단독_D');
insert into total_ent values(tseq.NEXTVAL,'1','차학연 팬미팅','YES24 LIVE HALL','19:00',to_date('2023-07-22','yyyy-mm-dd'),to_date('2023-07-23','yyyy-mm-dd'),99000,'s20a30b40','차학연','차학연_D');
insert into total_ent values(tseq.NEXTVAL,'1','코다라인 내한 공연','YES24 LIVE HALL','20:00',to_date('2023-09-22','yyyy-mm-dd'),to_date('2023-09-22','yyyy-mm-dd'),99000,'s20a30b40','코다라인','코다라인_D');

--연극 데이터
insert into total_ent values(tseq.NEXTVAL,'2','망원동 브라더스','홍대 제이엘씨어터','17:00',to_date('2023-02-12','yyyy-mm-dd'),to_date('2023-12-31','yyyy-mm-dd'),50000,'가로8세로9','망원동 브라더스','망원동 브라더스_D');
insert into total_ent values(tseq.NEXTVAL,'2','비누향기','대학로 서연아트홀','15:20',to_date('2023-01-10','yyyy-mm-dd'),to_date('2023-12-31','yyyy-mm-dd'),50000,'가로8세로7','비누향기','비누향기_D');
insert into total_ent values(tseq.NEXTVAL,'2','세일즈맨의 죽음','예그린 씨어터','19:00',to_date('2023-06-16','yyyy-mm-dd'),to_date('2023-07-16','yyyy-mm-dd'),60000,'가로9세로7','세일즈맨의 죽음','세일즈맨의 죽음_D');
insert into total_ent values(tseq.NEXTVAL,'2','수상한 흥신소','소극장 선물 1관','18:00',to_date('2023-03-11','yyyy-mm-dd'),to_date('2023-12-31','yyyy-mm-dd'),35000,'가로9세로7','수상한 흥신소','수상한 흥신소_D');
insert into total_ent values(tseq.NEXTVAL,'2','연극 라면','대학로 해피씨어터','19:00',to_date('2023-03-04','yyyy-mm-dd'),to_date('2023-07-31','yyyy-mm-dd'),50000,'가로8세로9','연극 라면','연극 라면_D');
insert into total_ent values(tseq.NEXTVAL,'2','오백에 삼십','대학로 세우아트센터 1관','17:00',to_date('2023-04-01','yyyy-mm-dd'),to_date('2023-07-31','yyyy-mm-dd'),40000,'가로7세로6','오백에 삼십','오백에 삼십_D');
insert into total_ent values(tseq.NEXTVAL,'2','옥탑방 고양이','대학로 틴틴홀','19:30',to_date('2023-03-01','yyyy-mm-dd'),to_date('2023-07-31','yyyy-mm-dd'),10000,'가로8세로8','옥탑방 고양이','옥탑방 고양이_D');
insert into total_ent values(tseq.NEXTVAL,'2','최초의 웃음','씨어터 쿰','18:00',to_date('2023-05-31','yyyy-mm-dd'),to_date('2023-07-04','yyyy-mm-dd'),50000,'가로9세로8','최초의 웃음','최초의 웃음_D');
insert into total_ent values(tseq.NEXTVAL,'2','행오버','정극장','18:00',to_date('2023-01-31','yyyy-mm-dd'),to_date('2023-07-31','yyyy-mm-dd'),40000,'가로7세로6','행오버','행오버_D');

--전시회 데이터
insert into total_ent values(tseq.NEXTVAL, '3', '강원 세계 산림 엑스포', '강원 고성 세계잼버리수련장', '-', to_date('2023-09-22','yyyy-mm-dd'), to_date('2023-10-22','yyyy-mm-dd'), 8000, '오전20오후20', '강원', '강원_D');
insert into total_ent values(tseq.NEXTVAL, '3', '루이스 웨인', '강동아트센터 아트랑 1-3층', '-', to_date('2023-06-13','yyyy-mm-dd'), to_date('2023-08-31','yyyy-mm-dd'), 15000, '오전20오후20', '고양이', '고양이_D');
insert into total_ent values(tseq.NEXTVAL, '3', '데이비드와 브리티시 팝아트', 'DDP', '-', to_date('2023-03-23','yyyy-mm-dd'), to_date('2023-09-02','yyyy-mm-dd'), 20000, '오전20오후20', '팝아트', '팝아트_D');
insert into total_ent values(tseq.NEXTVAL, '3', 'Seoul POPCON', '서울 코엑스 C,D홀', '-', to_date('2023-08-25','yyyy-mm-dd'), to_date('2023-08-27','yyyy-mm-dd'), 28000, '오전20오후20', '서울 팝콘', '서울 팝콘_D');
insert into total_ent values(tseq.NEXTVAL, '3', 'BAR/SPRIT SHOW', '서울 코엑스 D홀', '-', to_date('2023-07-28','yyyy-mm-dd'), to_date('2023-07-30','yyyy-mm-dd'), 25000, '오전20오후20', '서울바앤스피릿쇼', '서울바앤스피릿쇼_D');
insert into total_ent values(tseq.NEXTVAL, '3', '숭고 SUBLIME', '뮤지엄 웨이브', '-', to_date('2023-06-17','yyyy-mm-dd'), to_date('2023-09-17','yyyy-mm-dd'), 20000, '오전20오후20', '숭고', '숭고_D');
insert into total_ent values(tseq.NEXTVAL, '3', '앤서니 브라운의 행복극장', '광주 민주평화교류원', '-', to_date('2023-05-04','yyyy-mm-dd'), to_date('2023-10-29','yyyy-mm-dd'), 15000, '오전20오후20', '앤서니', '앤서니_D');
insert into total_ent values(tseq.NEXTVAL, '3', '앨리스 북아트전', '소전서림 북아트갤러리', '-', to_date('2023-04-21','yyyy-mm-dd'), to_date('2023-07-30','yyyy-mm-dd'), 7000, '오전20오후20', '앨리스', '앨리스_D');
insert into total_ent values(tseq.NEXTVAL, '3', '피카소와 20세기 거장들', '마이아트뮤지엄', '-', to_date('2023-03-24','yyyy-mm-dd'), to_date('2023-08-27','yyyy-mm-dd'), 20000, '오전20오후20', '피카소', '피카소_D');
insert into total_ent values(tseq.NEXTVAL, '3', '피카소와 20세기 거장들', '마이아트뮤지엄', '-', to_date('2023-03-24','yyyy-mm-dd'), to_date('2023-08-27','yyyy-mm-dd'), 20000, '오전100오후50', '피카소', '피카소_D');


--------------------------------------------------------------------------------------------------------------

--예약 시퀀스
CREATE SEQUENCE bseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;


--후기 시퀀스     
CREATE SEQUENCE rseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;
--공연 시퀀스       
CREATE SEQUENCE tseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;

--주문 시퀀스       
CREATE SEQUENCE oseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;
       
--공지사항 시퀀스       
CREATE SEQUENCE nseq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1;       

commit;