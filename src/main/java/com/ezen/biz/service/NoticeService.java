package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.NoticeVO;

public interface NoticeService {
	
	//공지사항 목록
	List<NoticeVO> noticeList();
	
}
