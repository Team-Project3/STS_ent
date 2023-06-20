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
	
	//�ı� ���
	public void saveReview(ReviewVO vo) {
		mybatis.insert("ReviewMapper.saveReview", vo);
	}
	
	//�ı� ����Ʈ
	public List<ReviewVO> reviewList(int tseq) {
		return mybatis.selectList("ReviewMapper.reviewList", tseq);
	}
	
	//ȸ���� �ı� ����Ʈ
	public List<Review_Total_entVO> reviewMember(ReviewVO vo) {
		return mybatis.selectList("ReviewMapper.reviewMember", vo);
	}
	
	//���� ����
	public void deleteReview(ReviewVO vo) {
		mybatis.delete("ReviewMapper.deleteReview", vo);
	}
	
	//������ - ���� ����Ʈ
	public List<Review_Total_entVO> reviewMemberlist(){
		return mybatis.selectList("ReviewMapper.reviewMemberlist");
	}
	
	//������ - ���� ������
	public Review_Total_entVO reviewDetail(int rseq) {
		return mybatis.selectOne("ReviewMapper.reviewDetail", rseq);
	}
}
