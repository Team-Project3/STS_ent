package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO {
	
	//컬럼: 아이디, 비밀번호, 이름, 전화번호, 생년월일, 이메일, role
	private String id;
	private String password;
	private String name;
	private String phone;
	private Date birth;
	private String email;
	private int role;
	
}
