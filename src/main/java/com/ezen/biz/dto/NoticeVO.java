package com.ezen.biz.dto;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	
	//컬럼: 공지사항시퀀스, 관리자id, 제목, 작성일, 내용
	private int nseq;
	private String a_id;
	private String title;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ndate;
	private String ncontent;
}
