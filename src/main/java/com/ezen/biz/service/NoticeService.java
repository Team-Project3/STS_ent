package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.NoticeVO;

public interface NoticeService {
	
	//공지사항 목록
	List<NoticeVO> noticeList();
	
	//공지사항 상세
	NoticeVO noticeDetail(int nseq);
	
	//공지사항 작성
	void noticeInsert(NoticeVO vo);
	
	//공지사항 수정
	void noticeUpdate(NoticeVO vo);
	
	//공지사항 삭제
	void noticeDelete(int nseq);
}
