package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.NoticeDAO;
import com.ezen.biz.dto.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;

	@Override	//공지사항 목록
	public List<NoticeVO> noticeList() {
		return noticeDao.noticeList();
	}

	@Override	//공지사항 상세
	public NoticeVO noticeDetail(NoticeVO vo) {
		return noticeDao.noticeDetail(vo);
	}

	@Override	//공지사항 작성
	public void noticeInsert(NoticeVO vo) {
		noticeDao.noticeInsert(vo);
		
	}

}
