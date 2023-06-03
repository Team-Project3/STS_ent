package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminVO {
	
	//컬럼: 아이디, 비밀번호, 이름, 전화번호
	private String a_id;
	private String a_password;
	private String a_name;
	private String a_phone;
}
