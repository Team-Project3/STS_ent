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

	@Override	//ȸ�� ���� ����
	public void updateMember(MemberVO vo) {
		memberDao.updateMember(vo);
	}
	
	@Override	//�̸��� �̸��Ϸ� ���̵� ã��
	public String selectIdByNameEmail(MemberVO vo) {
		return memberDao.selectIdByNameEmail(vo);
	}

	@Override	// ���̵�, �̸�, �̸��Ϸ� ��й�ȣ ã�� 
	public String selectPwdByIdNameEmail(MemberVO vo) {
		return memberDao.selectPwdByIdNameEmail(vo);
	}

	@Override	// ��й�ȣ ����
	public void changePwd(MemberVO vo) {
		memberDao.changePwd(vo); 
	}

	@Override	//ȸ�� Ż��
	public void deleteMember(String id) throws Exception {
		memberDao.deleteMember(id);
	}

	@Override	//������ - ȸ�� ����Ʈ
	public List<MemberVO> memberlist() {
		// TODO Auto-generated method stub
		return memberDao.memberlist();
	}

}
