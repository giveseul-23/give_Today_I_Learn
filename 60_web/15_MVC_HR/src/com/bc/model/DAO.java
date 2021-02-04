package com.bc.model;

import java.util.List;

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
}
