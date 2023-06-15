package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.NoticeVO;

public interface NoticeService {
	
	//공지사항 목록
	List<NoticeVO> noticeList();
	
	//공지사항 상세
	NoticeVO noticeDetail(NoticeVO vo);
	
}
