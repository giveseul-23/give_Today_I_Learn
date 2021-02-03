package com.bc.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

//게시글+댓글 처리용
public class DAO {
	//게시글(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		SqlSession ss = DBService.getFactory().openSession();
		int totalCount = ss.selectOne("BBS.totalCount");
		ss.close();
		
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기
	public static List<BBSVO> getList(Map<String, Integer> map){
		SqlSession ss = DBService.getFactory().openSession();
		List<BBSVO> list = ss.selectList("BBS.list", map);
		ss.close();
		
		return list;
	}
	
	//게시글 번호에 해당하는 게시글 하나 조회
	public static BBSVO selectOne(String b_idx) {
		SqlSession ss = DBService.getFactory().openSession();
		BBSVO vo = ss.selectOne("BBS.one", b_idx);
		ss.close();
		
		return vo;
	}
	
	//게시글 입력 처리
	public static int insert(BBSVO bvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("BBS.insert", bvo);
		ss.close();
		
		return result;
	}
	
	//조회수 증가 처리
	public static int updateHit(int b_idx) {
		//TODO
		
		return 0;
	}
	
	//============= 댓글관련 ================
	public static List<CommVO> getCommList(String b_idx){
		SqlSession ss = DBService.getFactory().openSession();
		List<CommVO> list = ss.selectList("BBS.commList", b_idx);
		ss.close();
		
		return list;
	}
	
	//댓글입력
	public static int insertComment(CommVO cvo) {
		//TODO
		
		return 0;
	}
}
