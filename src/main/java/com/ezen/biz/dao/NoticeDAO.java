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
	
	//공지사항 목록
	public List<NoticeVO> noticeList() {
		return mybatis.selectList("NoticeMapper.noticeList");
	}
	
	//공지사항 상세
	public NoticeVO noticeDetail(NoticeVO vo) {
		return mybatis.selectOne("NoticeMapper.noticeDetail", vo);
	}
	
	//공지사항 작성
	public void noticeInsert(NoticeVO vo) {
		mybatis.insert("NoticeMapper.noticeInsert", vo);
	}

}
