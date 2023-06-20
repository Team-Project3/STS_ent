package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ReviewDAO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.dto.Booking_Total_entVO;
import com.ezen.biz.dto.Review_Total_entVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired	
	private ReviewDAO reviewDao;

	@Override	//후기 등록
	public void saveReview(ReviewVO vo) {
		reviewDao.saveReview(vo);
	}

	@Override	//후기 리스트
	public List<ReviewVO> reviewList(int tseq) {
		return reviewDao.reviewList(tseq);
	}

	@Override	//회원별 후기 리스트
	public List<Review_Total_entVO> reviewMember(ReviewVO vo) {
		return reviewDao.reviewMember(vo);
	}

	@Override	//리뷰 삭제
	public void deleteReview(ReviewVO vo) {
		reviewDao.deleteReview(vo);
	}

	@Override	//관리자 - 리뷰 리스트
	public List<Review_Total_entVO> reviewMemberlist() {

		return reviewDao.reviewMemberlist();
	}

	@Override	//관리자- 리뷰 디테일
	public Review_Total_entVO reviewDetail(int rseq) {
		return reviewDao.reviewDetail(rseq);
	}

}
