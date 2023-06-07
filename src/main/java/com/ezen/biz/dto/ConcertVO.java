package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ConcertVO {
	private int tseq;
	private String category;
	private String tname;
	private String place;
	private String time;
	private Date sdate;
	private Date edate;
	private int price;
	private String seat;
	private String pimg;
	private String cimg;
}
