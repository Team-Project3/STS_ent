package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.NoticeVO;

public interface NoticeService {
	
	//�������� ���
	List<NoticeVO> noticeList();
	
	//�������� ��
	NoticeVO noticeDetail(int nseq);
	
	//�������� �ۼ�
	void noticeInsert(NoticeVO vo);
	
	//�������� ����
	void noticeUpdate(NoticeVO vo);
	
	//�������� ����
	void noticeDelete(int nseq);
}
