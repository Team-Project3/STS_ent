package com.ezen.biz.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Total_entVO {
	private int tseq;
	private String category;
	private String tname;
	private String place;
	private String time;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edate;
	private int price;
	private String seat;
	private String pimg;
	private String cimg;
}
