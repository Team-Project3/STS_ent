package com.ezen.biz.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {
	
	private int oseq;
	private int tseq;
	private String seat;
	private String id;
	private int head;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dday;
}
