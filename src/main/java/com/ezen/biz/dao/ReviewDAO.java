package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//�ı� ���
	public void saveReview(ReviewVO vo) {
		mybatis.insert("ReviewMapper.saveReview", vo);
	}
	
	//�ı� ����Ʈ
	public List<ReviewVO> reviewList(int tseq) {
		return mybatis.selectList("ReviewMapper.reviewList", tseq);
	}
	

}
