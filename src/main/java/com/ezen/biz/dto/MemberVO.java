package com.ezen.biz.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String birth;
	private String email;
	
}
