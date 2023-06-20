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
	public NoticeVO noticeDetail(int nseq) {
		return noticeDao.noticeDetail(nseq);
	}

	@Override	//공지사항 작성
	public void noticeInsert(NoticeVO vo) {
		noticeDao.noticeInsert(vo);
	}

	@Override	//공지사항 수정
	public void noticeUpdate(NoticeVO vo) {
		noticeDao.noticeUpdate(vo);	
	}

	@Override	//공지사항 삭제
	public void noticeDelete(int nseq) {
		noticeDao.noticeDelete(nseq);
		
	}
	
	
	
}
