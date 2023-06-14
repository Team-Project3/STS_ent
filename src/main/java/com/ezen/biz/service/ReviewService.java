package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.totalbookVO;
import com.ezen.biz.dto.totalentVO;

public interface ReviewService {
	
	//후기 등록
	void saveReview(ReviewVO vo);
		
	//후기 리스트
	List<ReviewVO> reviewList(int tseq);
	
	//회원별 후기 리스트
	List<totalentVO> reviewMember(ReviewVO vo);
	
	//리뷰 삭제
	void deleteReview(ReviewVO vo);
}
