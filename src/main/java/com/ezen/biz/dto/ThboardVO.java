package com.ezen.biz.dto;

import lombok.ToString;

import lombok.Setter;

import lombok.Getter;

@Getter
@Setter
@ToString
public class ThboardVO {
	private int thseq;  //���� ��ȣ �����ϸ� ��ȣ ��  pk
	private String seatlist;	//�¼��� ���� ����
	private int thnum_seq;	//��ȭ ��ȣ fk �� ������
	private String id;
}
