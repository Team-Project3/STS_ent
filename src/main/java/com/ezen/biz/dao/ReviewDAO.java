package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.Review_Total_entVO;

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
	
	//회원별 후기 리스트
	public List<Review_Total_entVO> reviewMember(ReviewVO vo) {
		return mybatis.selectList("ReviewMapper.reviewMember", vo);
	}
	
	//리뷰 삭제
	public void deleteReview(int rseq) {
		mybatis.delete("ReviewMapper.deleteReview", rseq);
	}
	
	//관리자 - 리뷰 리스트
	public List<Review_Total_entVO> reviewMemberlist(){
		return mybatis.selectList("ReviewMapper.reviewMemberlist");
	}
	
	//관리자 - 리뷰 디테일
	public Review_Total_entVO reviewDetail(int rseq) {
		return mybatis.selectOne("ReviewMapper.reviewDetail", rseq);
	}
	
	
}
