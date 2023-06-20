package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ReviewDAO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.totalbookVO;
import com.ezen.biz.dto.totalentVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired	
	private ReviewDAO reviewDao;

	@Override	//�ı� ���
	public void saveReview(ReviewVO vo) {
		reviewDao.saveReview(vo);
	}

	@Override	//�ı� ����Ʈ
	public List<ReviewVO> reviewList(int tseq) {
		return reviewDao.reviewList(tseq);
	}

	@Override	//ȸ���� �ı� ����Ʈ
	public List<totalentVO> reviewMember(ReviewVO vo) {
		return reviewDao.reviewMember(vo);
	}

	@Override	//���� ����
	public void deleteReview(int rseq) {
		reviewDao.deleteReview(rseq);
	}

	@Override	//������ - ���� ����Ʈ
	public List<totalentVO> reviewMemberlist() {

		return reviewDao.reviewMemberlist();
	}

	@Override	//������- ���� ������
	public totalentVO reviewDetail(int rseq) {
		return reviewDao.reviewDetail(rseq);
	}

}
