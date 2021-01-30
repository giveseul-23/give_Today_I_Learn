package com.bc.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class ShopDAO {
	
	public ShopDAO() {
		System.out.println(">> ShopDAO 실행");
	}
	
	public List<ShopVO> addList(String category) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ShopVO> list = ss.selectList("shop.list", category);
		ss.close();
		
		return list;
	}
	
	public ShopVO selOne(String p_num) {
		SqlSession ss = DBService.getFactory().openSession();
		ShopVO vo = ss.selectOne("shop.listOne", p_num);
		ss.close();
		
		return vo;
	}

	
}
