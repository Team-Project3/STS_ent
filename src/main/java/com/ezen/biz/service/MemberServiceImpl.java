package com.ezen.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.MemberDAO;
import com.ezen.biz.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDao;

	@Override	// 회원 id를 조건으로 사용자 정보 조회
	public MemberVO getMember(String id) {
		return memberDao.getMember(id);
	}

	@Override	// 회원 존재 여부 조회
	public int confirmID(String id) {
		return memberDao.confirmID(id);
	}

	@Override	//회원 로그인 인증(1:성공, 0:비번틀림, -1:비회원)
	public int loginID(MemberVO vo) {
		return memberDao.loginID(vo);
	}

	@Override	// 회원가입 작업
	public void insertMember(MemberVO vo) {
		memberDao.insertMember(vo);
	}

	

}
