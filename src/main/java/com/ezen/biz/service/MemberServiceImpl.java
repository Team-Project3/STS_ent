package com.ezen.biz.service;

import org.springframework.stereotype.Service;

import com.ezen.biz.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Override
	public MemberVO getMember(String id) {
		return null;
	}

	@Override
	public int confirmID(String id) {
		return 0;
	}

	@Override
	public int loginID(MemberVO vo) {
		return 0;
	}

	@Override
	public void insertMember(MemberVO vo) {
		
	}

	@Override
	public String selectIdByNameEmail(MemberVO vo) {
		return null;
	}

	@Override
	public String selectPwdByIdNameEmail(MemberVO vo) {
		return null;
	}

}
