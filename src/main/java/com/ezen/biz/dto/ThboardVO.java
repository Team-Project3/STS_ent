package com.ezen.biz.dto;

import lombok.ToString;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
@ToString
public class ThboardVO {
	private int thseq;  //예매 번호 예약하면 번호 줌  pk
	private String seatlist;	//좌석에 대한 정보
	private int thnum_seq;	//영화 번호 fk 로 받을듯
	private String id;
}
