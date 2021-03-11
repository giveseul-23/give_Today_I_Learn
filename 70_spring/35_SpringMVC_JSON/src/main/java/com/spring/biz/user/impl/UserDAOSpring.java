package com.spring.biz.user.impl;

import com.spring.biz.common.JDBCUtil;
import com.spring.biz.user.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class UserDAOSpring {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private final String USER_GET
		= "SELECT * FROM USERS WHERE ID = ? AND PASSWORD = ?";

	public UserDAOSpring() {
		System.out.println(">> UserDAO() 객체 생성");
	}
	
	public UserVO getUser(UserVO vo) {
		System.out.println("===> JDBC로 getUser() 실행");

		Object[] args = {vo.getId(), vo.getPassword()};
		System.out.println(args.toString());

		return jdbcTemplate.queryForObject(USER_GET, args, new UserRowMapper());
	}
}
