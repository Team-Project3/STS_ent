package com.ezen.biz.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BookingVO {
	
	private int bseq;
	private int tseq;
	private String bstatus;
	private String seat;
	private String id;
	private int head;
	private Date today;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dday;
}
