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
	
	//ȸ�� ���� ����
	void updateMember(MemberVO vo);
	
	//ȸ�� Ż��
	void deleteMember(MemberVO vo);
	
	// �̸��� �̸��Ϸ� ���̵� ã��
	String selectIdByNameEmail(MemberVO vo);

	// ���̵�, �̸�, �̸��Ϸ� ��й�ȣ ã�� 
	String selectPwdByIdNameEmail(MemberVO vo);
		
	// ��й�ȣ ����
	void changePwd(MemberVO vo);
}
