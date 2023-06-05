package com.ezen.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.MemberDAO;
import com.ezen.biz.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDao;

	@Override	// ȸ�� id�� �������� ����� ���� ��ȸ
	public MemberVO getMember(String id) {
		return memberDao.getMember(id);
	}

	@Override	// ȸ�� ���� ���� ��ȸ
	public int confirmID(String id) {
		return memberDao.confirmID(id);
	}

	@Override	//ȸ�� �α��� ����(1:����, 0:���Ʋ��, -1:��ȸ��)
	public int loginID(MemberVO vo) {
		return memberDao.loginID(vo);
	}

	@Override	// ȸ������ �۾�
	public void insertMember(MemberVO vo) {
		memberDao.insertMember(vo);
	}

	

}
