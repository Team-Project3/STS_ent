package com.ezen.biz.service;

import com.ezen.biz.dto.MemberVO;

public interface MemberService {
	// ȸ�� id�� �������� ����� ���� ��ȸ
	public MemberVO getMember(String id);

	// ȸ�� ���� ���� ��ȸ
	public int confirmID(String id);

	//ȸ�� �α��� ����(1:����, 0:���Ʋ��, -1:��ȸ��)
	public int loginID(MemberVO vo);
		
	// ȸ������ �۾�
	public void insertMember(MemberVO vo);
	
	// �̸��� �̸��Ϸ� ���̵� ã��
	public String selectIdByNameEmail(MemberVO vo);
	
	// ���̵�, �̸�, �̸��Ϸ� ��й�ȣ ã�� 
	public String selectPwdByIdNameEmail(MemberVO vo);
}
