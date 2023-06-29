package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.MemberVO;

public interface MemberService {
	// ȸ�� id�� �������� ����� ���� ��ȸ
	MemberVO getMember(String id);

	// ȸ�� ���� ���� ��ȸ
	int confirmID(String id);

	//ȸ�� �α��� ����(1:����, 0:���Ʋ��, -1:��ȸ��)
	int loginID(MemberVO vo);
		
	MemberVO getMemberEmail(MemberVO vo);
	// ȸ������ �۾�
	void insertMember(MemberVO vo);
	
	//ȸ�� ���� ����
	void updateMember(MemberVO vo);
	
	//ȸ�� Ż��
	void deleteMember(String id) throws Exception;
	
	// �̸��� �̸��Ϸ� ���̵� ã��
	String selectIdByNameEmail(MemberVO vo);

	// ���̵�, �̸�, �̸��Ϸ� ��й�ȣ ã�� 
	String selectPwdByIdNameEmail(MemberVO vo);
		
	// ��й�ȣ ����
	void changePwd(MemberVO vo);
	
	//������ - ȸ�� ����Ʈ
	List<MemberVO> memberlist();
}
