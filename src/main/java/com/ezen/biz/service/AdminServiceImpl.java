package com.ezen.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.AdminDAO;
import com.ezen.biz.dto.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDao;

	@Override	//관리자 계정 유무 확인
	public int adminCheck(AdminVO vo) {
		String pwd_in_db = adminDao.adminCheck(vo.getA_id());
		
		//관리자 계정X
		if(pwd_in_db == null) {
			return -1;
		//관리자 계정O
		} else if(pwd_in_db.equals(vo.getA_password())) {
			return 1;
		//관리자 계정 비번 불일치
		} else {
			return 0;
		}
	}

	@Override	//관리자 정보 조회
	public AdminVO getAdmin(String a_id) {
		return adminDao.getAdmin(a_id);
	}

}
