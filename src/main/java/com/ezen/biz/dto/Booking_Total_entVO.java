package com.ezen.biz.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Booking_Total_entVO {
	private int bseq;
	private int tseq;
	private String tname;
	private String id;
	private Date dday;
	private String time;
	private String seat;
	private int head;
	private String bstatus;
	private int category;
	private int price;
}
