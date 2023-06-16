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

	// ȸ�� id�� �������� ����� ���� ��ȸ
	public MemberVO getMember(String id) {
		return mybatis.selectOne("MemberMapper.getMember", id);
	}

	// ȸ�� ���� ���� ��ȸ
	public int confirmID(String id) {
		String password = mybatis.selectOne("MemberMapper.confirmID",id);
		
		if (password != null)
			return 1; // id ����
		else
			return -1;
	}

	//ȸ�� �α��� ����(1:����, 0:���Ʋ��, -1:��ȸ��)
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
		
	// ȸ������ �۾�
	public void insertMember(MemberVO vo) {
		mybatis.insert("MemberMapper.insertMember", vo);
	}
	
	//ȸ�� ���� ����
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberMapper.updateMember", vo);
	}
	
	//ȸ�� Ż��
	public void deleteMember(String id) throws Exception {
		mybatis.delete("MemberMapper.deleteMember", id);
	}
	
	// �̸��� �̸��Ϸ� ���̵� ã��
	public String selectIdByNameEmail(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectIdByNameEmail", vo);
	}

	// ���̵�, �̸�, �̸��Ϸ� ��й�ȣ ã�� 
	public String selectPwdByIdNameEmail(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectPwdByIdNameEmail", vo);
	}
		
	//��й�ȣ ����
	public void changePwd(MemberVO vo) {
		mybatis.update("MemberMapper.changePwd", vo);
	}
	
	//������ - ȸ�� ����Ʈ
	public List<MemberVO> memberlist(){
		return mybatis.selectList("MemberMapper.memberlist");
	}
}