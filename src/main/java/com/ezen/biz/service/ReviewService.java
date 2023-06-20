package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.Review_Total_entVO;

public interface ReviewService {
	
	//후기 등록
	void saveReview(ReviewVO vo);
		
	//후기 리스트
	List<ReviewVO> reviewList(int tseq);
	
	//회원별 후기 리스트
	List<Review_Total_entVO> reviewMember(ReviewVO vo);
	
	//리뷰 삭제
	void deleteReview(ReviewVO vo);
	
	//관리자 - 리뷰 리스트
	List<Review_Total_entVO> reviewMemberlist();
	
	//관리자 - 리뷰 디테일
	Review_Total_entVO reviewDetail(int rseq);
}
