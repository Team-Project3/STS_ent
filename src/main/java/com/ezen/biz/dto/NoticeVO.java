package com.ezen.biz.dto;


import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	
	//�÷�: �������׽�����, ������id, ����, �ۼ���, ����
	private int nseq;
	private String a_id;
	private String title;
	private Date ndate;
	private String ncontent;
}
