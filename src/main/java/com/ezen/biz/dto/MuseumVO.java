package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MuseumVO {
	//�÷���: ������ȣ, ����, ������, ���, �ð�, ��¥, �����ݾ�, �¼�, �����ͻ���, ��������, ����������, ����������
	private int tseq;
	private String category;
	private String tname;
	private String place;
	private Date bdate;
	private int price;
	private int seat;	//1:����, 2:����
	private String pimg;
	private String cimg;
	private Date sdate;
	private Date edate;

}