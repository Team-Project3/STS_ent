package com.ezen.biz.dao;

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
}