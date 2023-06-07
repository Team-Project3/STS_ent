package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MuseumVO {
	//컬럼명: 공연번호, 종류, 공연명, 장소, 시간, 날짜, 공연금액, 좌석, 포스터사진, 정보사진, 공연시작일, 공연종료일
	private int tseq;
	private String category;
	private String tname;
	private String place;
	private Date bdate;
	private int price;
	private int seat;	//1:오전, 2:오후
	private String pimg;
	private String cimg;
	private Date sdate;
	private Date edate;

}
