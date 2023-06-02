package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	
	//�÷�: ���̵�, ��й�ȣ, �̸�, ��ȭ��ȣ, �������, �̸���, role
	private String id;
	private String password;
	private String name;
	private String phone;
	private Date birth;
	private String email;
	private int role;
	
}
