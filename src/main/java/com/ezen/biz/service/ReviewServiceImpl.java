package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ReviewDAO;
import com.ezen.biz.dto.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDao;

	@Override
	public void saveReview(ReviewVO vo) {
		reviewDao.saveReview(vo);
	}

	@Override
	public List<ReviewVO> reviewList(int tseq) {
		return reviewDao.reviewList(tseq);
	}

}
