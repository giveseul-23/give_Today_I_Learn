package com.bc.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.EmployeeVO;
import com.bc.mybatis.DBService;

public class DAO {
	 
	public DAO() {}
	
	/*전체목록조회*/
	public static List<EmployeeVO> getAllList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.all");
		ss.close();
		
		return list;
	}
	
	/*부서번호조회*/
	public static List<EmployeeVO> getDeptList(String deptno){
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.dept", deptno);
		ss.close();
		
		return list;
	}
	
	/*이름 조회*/
	public static List<EmployeeVO> getNameList(String name){
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.name", name);
		ss.close();
		
		return list;
	}
	
	/*동적 조회*/
	public static List<EmployeeVO> getSearchList(Map<String, String> map){
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.search", map);
		ss.close();
		
		return list;
	}

}
