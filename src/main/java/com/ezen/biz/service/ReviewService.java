package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.Review_Total_entVO;

public interface ReviewService {
	
	//�ı� ���
	void saveReview(ReviewVO vo);
		
	//�ı� ����Ʈ
	List<ReviewVO> reviewList(int tseq);
	
	//ȸ���� �ı� ����Ʈ
	List<Review_Total_entVO> reviewMember(ReviewVO vo);
	
	//���� ����
	void deleteReview(ReviewVO vo);
	
	//������ - ���� ����Ʈ
	List<Review_Total_entVO> reviewMemberlist();
	
	//������ - ���� ������
	Review_Total_entVO reviewDetail(int rseq);
}
