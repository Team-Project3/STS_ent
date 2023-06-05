package com.ezen.biz.service;

import com.ezen.biz.dto.AdminVO;

public interface AdminService {
	
	int adminCheck(AdminVO vo);
	
	AdminVO getAdmin(String a_id);
}
