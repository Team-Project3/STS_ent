package com.ezen.biz.service;

import java.util.List;

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

	@Override	//회원 정보 수정
	public void updateMember(MemberVO vo) {
		memberDao.updateMember(vo);
	}
	
	@Override	//이름과 이메일로 아이디 찾기
	public String selectIdByNameEmail(MemberVO vo) {
		return memberDao.selectIdByNameEmail(vo);
	}

	@Override	// 아이디, 이름, 이메일로 비밀번호 찾기 
	public String selectPwdByIdNameEmail(MemberVO vo) {
		return memberDao.selectPwdByIdNameEmail(vo);
	}

	@Override	// 비밀번호 변경
	public void changePwd(MemberVO vo) {
		memberDao.changePwd(vo); 
	}

	@Override	//회원 탈퇴
	public void deleteMember(String id) throws Exception {
		memberDao.deleteMember(id);
	}

	@Override	//관리자 - 회원 리스트
	public List<MemberVO> memberlist() {
		// TODO Auto-generated method stub
		return memberDao.memberlist();
	}

}
