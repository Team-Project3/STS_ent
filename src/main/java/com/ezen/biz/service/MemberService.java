package com.ezen.biz.service;

import com.ezen.biz.dto.MemberVO;

public interface MemberService {
	// 회원 id를 조건으로 사용자 정보 조회
	MemberVO getMember(String id);

	// 회원 존재 여부 조회
	int confirmID(String id);

	//회원 로그인 인증(1:성공, 0:비번틀림, -1:비회원)
	int loginID(MemberVO vo);
		
	// 회원가입 작업
	void insertMember(MemberVO vo);
	
	//회원 정보 수정
	void updateMember(MemberVO vo);
	
	//회원 탈퇴
	void deleteMember(MemberVO vo);
	
	// 이름과 이메일로 아이디 찾기
	String selectIdByNameEmail(MemberVO vo);

	// 아이디, 이름, 이메일로 비밀번호 찾기 
	String selectPwdByIdNameEmail(MemberVO vo);
		
	// 비밀번호 변경
	void changePwd(MemberVO vo);
}
