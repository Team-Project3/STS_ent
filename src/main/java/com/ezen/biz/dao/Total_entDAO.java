package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.Total_entVO;

@Repository
public class Total_entDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//�ܼ�Ʈ ����Ʈ
	public List<Total_entVO> concertList() {
		return mybatis.selectList("ConcertMapper.concertList");
	}
	
	//�ܼ�Ʈ ������
	public Total_entVO concertDetail(Total_entVO vo) {
		return mybatis.selectOne("ConcertMapper.concertDetail",vo);
	}
	
	//���� ����Ʈ
	public List<Total_entVO> theaterList() {
		
		return mybatis.selectList("ThMapper.theaterList");
	}
	
	//���� ������
	public Total_entVO theaterDetail(Total_entVO vo) {
		
		return mybatis.selectOne("ThMapper.theaterDetail",vo);
	}
	
	//����ȸ ����Ʈ
	public List<Total_entVO> museumList() {
		return mybatis.selectList("MuseumMapper.museumList");
	}
	
	//����ȸ ������
	public Total_entVO museumDetail(Total_entVO vo) {
		return mybatis.selectOne("MuseumMapper.museumDetail",vo);
	}
	
	//������ : ��� ���� ����Ʈ
	public List<Total_entVO> AllList() {
		return mybatis.selectList("ConcertMapper.List");
	}
	
	//������ : ī�װ��� ���� ����Ʈ --��ġ�� ����
	public List<Total_entVO> categoryList(String category) {
		return mybatis.selectList("ConcertMapper.categoryList",category);
	}
	
	//������ : ���� ����
	public void updatetotalent(Total_entVO vo) {
		mybatis.update("ConcertMapper.updatetotalent",vo);
	}
	
	//������ : ���� �߰�
	public void inserttotalent(Total_entVO vo) {
		mybatis.insert("ConcertMapper.inserttotalent",vo);
	}
	
	//������ : ���� ����
	public void deletetotalent(Total_entVO vo) {
		mybatis.delete("ConcertMapper.deletetotalent",vo);
	}
}
