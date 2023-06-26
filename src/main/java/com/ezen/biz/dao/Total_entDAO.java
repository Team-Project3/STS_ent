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
	
	//���� ī�װ��� ����Ʈ
	public List<Total_entVO> total_entList(Total_entVO vo) {
		return mybatis.selectList("Total_entMapper.total_entList",vo);
	}
	
	//���� ������
	public Total_entVO total_entDetail(Total_entVO vo) {
		return mybatis.selectOne("Total_entMapper.total_entDetail",vo);
	}
	
	//������ : ��� ���� ����Ʈ
	public List<Total_entVO> totalList() {
		return mybatis.selectList("Total_entMapper.totalList");
	}
	
	//������ : ���� ����
	public void updatetotalent(Total_entVO vo) {
		mybatis.update("Total_entMapper.updatetotalent",vo);
	}
	
	//������ : ���� �߰�
	public void inserttotalent(Total_entVO vo) {
		mybatis.insert("Total_entMapper.inserttotalent",vo);
	}
	
	//������ : ���� ����
	public void deletetotalent(Total_entVO vo) {
		mybatis.delete("Total_entMapper.deletetotalent",vo);
	}
}
