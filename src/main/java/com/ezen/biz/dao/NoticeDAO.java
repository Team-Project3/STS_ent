package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.NoticeVO;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//�������� ���
	public List<NoticeVO> noticeList() {
		return mybatis.selectList("NoticeMapper.noticeList");
	}
	
	//�������� ��
	public NoticeVO noticeDetail(int nseq) {
		return mybatis.selectOne("NoticeMapper.noticeDetail", nseq);
	}
	
	//�������� �ۼ�
	public void noticeInsert(NoticeVO vo) {
		mybatis.insert("NoticeMapper.noticeInsert", vo);
	}
	
	//�������� ����
	public void noticeUpdate(NoticeVO vo) {
		mybatis.update("NoticeMapper.noticeUpdate", vo);
	}

}
