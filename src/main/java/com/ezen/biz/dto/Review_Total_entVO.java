package com.ezen.biz.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Review_Total_entVO {
	private int rseq;
	private String id;
	private int tseq;
	private Date regdate;
	private int rpoint;
	private String rcontent;
	private String tname;
	private String category;
}
