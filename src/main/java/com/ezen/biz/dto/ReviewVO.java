package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	private int rseq;
	private String id;
	private int tseq;
	private Date regdate;
	private int rpoint;
	private String rcontent;
}
