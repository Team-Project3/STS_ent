package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ReviewVO;

public interface ReviewService {
	
	//�ı� ���
	void saveReview(ReviewVO vo);
		
	//�ı� ����Ʈ
	List<ReviewVO> reviewList(int tseq);
	
	//ȸ���� �ı� ����Ʈ
	List<ReviewVO> reviewMember(ReviewVO vo);
}
