package com.bc.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.EmployeeVO;
import com.bc.mybatis.DBService;

public class DAO {
	//직원 전체 목록 조회
	public static List<EmployeeVO> getList(){
		SqlSession  ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.list");
		ss.close();
		
		return list;
	}
	
	//부서번호 직원조회
	public static List<EmployeeVO> getE_List(String deptno){
		SqlSession  ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.e_list", deptno);
		ss.close();
		
		return list;
	}
	
	//이름으로 직원조회
	public static List<EmployeeVO> getFullname(String fullname){
		SqlSession  ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.fullnameList", fullname);
		ss.close();
		
		return list;
	}
	
	//동적검색
	public static List<EmployeeVO> getSearch(String idx, String keyword){
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		
		SqlSession  ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.search", map);
		ss.close();
		
		return list;
	}
	
}
