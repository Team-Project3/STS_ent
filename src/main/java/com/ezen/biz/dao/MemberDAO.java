package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 회원 id를 조건으로 사용자 정보 조회
	public MemberVO getMember(String id) {
		return mybatis.selectOne("MemberMapper.getMember", id);
	}

	// 회원 존재 여부 조회
	public int confirmID(String id) {
		String password = mybatis.selectOne("MemberMapper.confirmID",id);
		
		if (password != null)
			return 1; // id 존재
		else
			return -1;
	}

	//회원 로그인 인증(1:성공, 0:비번틀림, -1:비회원)
	public int loginID(MemberVO vo) {
			int result = -1;
			String password = mybatis.selectOne("MemberMapper.confirmID", vo);
			
			if(password == null) {
				result = -1;
			} else if(password.equals(vo.getPassword())) {
				result = 1;
			} else {
				result = 0;
			}
			return result;
		}
		
	// 회원가입 작업
	public void insertMember(MemberVO vo) {
		mybatis.insert("MemberMapper.insertMember", vo);
	}
	
	//회원 정보 수정
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberMapper.updateMember", vo);
	}
	
	//회원 탈퇴
	public void deleteMember(String id) throws Exception {
		mybatis.delete("MemberMapper.deleteMember", id);
	}
	
	// 이름과 이메일로 아이디 찾기
	public String selectIdByNameEmail(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectIdByNameEmail", vo);
	}

	// 아이디, 이름, 이메일로 비밀번호 찾기 
	public String selectPwdByIdNameEmail(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectPwdByIdNameEmail", vo);
	}
		
	//비밀번호 변경
	public void changePwd(MemberVO vo) {
		mybatis.update("MemberMapper.changePwd", vo);
	}
	
	//관리자 - 회원 리스트
	public List<MemberVO> memberlist(){
		return mybatis.selectList("MemberMapper.memberlist");
	}
}