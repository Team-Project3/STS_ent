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

	@Override	//�������� ���
	public List<NoticeVO> noticeList() {
		return noticeDao.noticeList();
	}

	@Override	//�������� ��
	public NoticeVO noticeDetail(int nseq) {
		return noticeDao.noticeDetail(nseq);
	}

	@Override	//�������� �ۼ�
	public void noticeInsert(NoticeVO vo) {
		noticeDao.noticeInsert(vo);
	}

	@Override	//�������� ����
	public void noticeUpdate(NoticeVO vo) {
		noticeDao.noticeUpdate(vo);	
	}

	@Override	//�������� ����
	public void noticeDelete(int nseq) {
		noticeDao.noticeDelete(nseq);
		
	}
	
	
	
}
