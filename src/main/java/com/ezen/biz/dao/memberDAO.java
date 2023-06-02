package com.ezen.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.MemberVO;

@Repository
public class memberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// ȸ�� id�� �������� ����� ���� ��ȸ
	public MemberVO getMember(String id) {
		return mybatis.selectOne("MemberMapper.getMember", id);
	}

	// ȸ�� ���� ���� ��ȸ
	public int confirmID(String id) {
		String pwd = mybatis.selectOne("MemberMapper.confirmID",id);
		
		if (pwd != null)
			return 1; // id ����
		else
			return -1;
	}

	//ȸ�� �α��� ����(1:����, 0:���Ʋ��, -1:��ȸ��)
	public int loginID(MemberVO vo) {
			int result = -1;
			String pwd = mybatis.selectOne("MemberMapper.confirmID", vo);
			
			if(pwd == null) {
				result = -1;
			} else if(pwd.equals(vo.getPassword())) {
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
	
	// �̸��� �̸��Ϸ� ���̵� ã��
	public String selectIdByNameEmail(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectIdByNameEmail", vo);
	}

	// ���̵�, �̸�, �̸��Ϸ� ��й�ȣ ã�� 
	public String selectPwdByIdNameEmail(MemberVO vo) {
		return mybatis.selectOne("MemberMapper.selectPwdByIdNameEmail", vo);
	}
	
}
