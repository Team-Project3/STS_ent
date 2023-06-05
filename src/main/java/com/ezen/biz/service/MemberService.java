package com.ezen.biz.service;

import com.ezen.biz.dto.MemberVO;

public interface MemberService {
	// ȸ�� id�� �������� ����� ���� ��ȸ
	MemberVO getMember(String id);

	// ȸ�� ���� ���� ��ȸ
	int confirmID(String id);

	//ȸ�� �α��� ����(1:����, 0:���Ʋ��, -1:��ȸ��)
	int loginID(MemberVO vo);
		
	// ȸ������ �۾�
	void insertMember(MemberVO vo);
	
	
}
