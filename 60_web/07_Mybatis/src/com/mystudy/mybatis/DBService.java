package com.mystudy.mybatis;


import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//Mybatis 사용해서 작업할 sqlSesiion을 만들어줄
// sqlSessionFactory객체를 생성하기 위한 클래스
public class DBService {
	private static SqlSessionFactory factory;
	
	//static 초기화문
	static {
		try {
			/*
			String config = "com/mystudy/mybatis/config.xml";
			Reader reader = Resources.getResourceAsReader(config);
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sqlSessionFactoryBuilder.build(reader);
			
			위 문장을 아래로 표현
			*/
			
			factory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("com/mystudy/mybatis/config.xml"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
