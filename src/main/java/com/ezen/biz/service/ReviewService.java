package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.totalbookVO;
import com.ezen.biz.dto.totalentVO;

public interface ReviewService {
	
	//�ı� ���
	void saveReview(ReviewVO vo);
		
	//�ı� ����Ʈ
	List<ReviewVO> reviewList(int tseq);
	
	//ȸ���� �ı� ����Ʈ
	List<totalentVO> reviewMember(ReviewVO vo);
	
	//���� ����
	void deleteReview(ReviewVO vo);
}
