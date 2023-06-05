package com.ezen.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.AdminDAO;
import com.ezen.biz.dto.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDao;

	@Override	//������ ���� ���� Ȯ��
	public int adminCheck(AdminVO vo) {
		String pwd_in_db = adminDao.adminCheck(vo.getA_id());
		
		//������ ����X
		if(pwd_in_db == null) {
			return -1;
		//������ ����O
		} else if(pwd_in_db.equals(vo.getA_password())) {
			return 1;
		//������ ���� ��� ����ġ
		} else {
			return 0;
		}
	}

	@Override	//������ ���� ��ȸ
	public AdminVO getAdmin(String a_id) {
		return adminDao.getAdmin(a_id);
	}

}
