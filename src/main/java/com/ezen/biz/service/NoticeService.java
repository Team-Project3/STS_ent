package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.NoticeVO;

public interface NoticeService {
	
	//공지사항 목록
	List<NoticeVO> noticeList();
	
	//공지사항 상세
	NoticeVO noticeDetail(NoticeVO vo);
	
	//공지사항 작성
	void noticeInsert(NoticeVO vo);
}
