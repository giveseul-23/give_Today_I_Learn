package com.bc.model;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.MemberVO;
import com.bc.mybatis.DBService;

public class CreateDAO {
	public static int insert(MemberVO mvo) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.insert("member.joinInsert", mvo);
		if(result < 1) {
			System.out.println("����");
		}else {
			ss.commit();
			System.out.println("����");
		}
		ss.close();
		return result;
	}
}
