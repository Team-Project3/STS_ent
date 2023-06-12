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
	
	//후기 등록
	public void saveReview(ReviewVO vo) {
		mybatis.insert("ReviewMapper.saveReview", vo);
	}
	
	//후기 리스트
	public List<ReviewVO> reviewList(int tseq) {
		return mybatis.selectList("ReviewMapper.reviewList", tseq);
	}
	

}
