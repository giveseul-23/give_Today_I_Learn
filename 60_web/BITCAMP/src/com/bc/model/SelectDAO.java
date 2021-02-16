package com.bc.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.PListVO;
import com.bc.mybatis.DBService;

public class SelectDAO {
	
	
	//상품 리스트 전체목록 가져오기
	public static List<PListVO> getPList(Map<String, Integer> map){
		SqlSession  ss = DBService.getFactory().openSession();
		List<PListVO> list = ss.selectList("pList.select", map);
		ss.close();
		
		System.out.println(list);
		
		return list;
	}
	
	
	//상품 전체수 조회
	public static int getTotalCount(){
		SqlSession  ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("pList.totalCount");
		ss.close();
		
		System.out.println(totalCount);
		
		return totalCount;
	}
	
	//상품 리스트 검색목록 가져오기
	public static List<PListVO> getSearchPList(Map<String, Object> map){
		SqlSession  ss = DBService.getFactory().openSession();
		List<PListVO> list = ss.selectList("pList.searchSelect", map);
		ss.close();
		
		System.out.println("상품 리스트 검색목록 : " + list);
		
		return list;
	}
	
	
	//상품 검색 전체수 조회
	public static int getSearchTotalCount(String word){
		SqlSession  ss = DBService.getFactory().openSession();
		
		int totalCount = ss.selectOne("pList.searchTotalCount", word);
		ss.close();
		
		System.out.println("상품 검색 전체수 조회 : " + totalCount);
		
		return totalCount;
	}
}
