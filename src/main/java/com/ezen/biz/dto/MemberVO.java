package com.ezen.biz.dto;

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
	private String birth;
	private String email;
	
}
