package com.newlec.servlet.study.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class CharcterEncodingFilter implements Filter {


	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		//chain.doFilter(req, resp); 이전에 실행해야 할 경우 이 부분에 작성
		System.out.println("before filter");
		req.setCharacterEncoding("utf-8");
		
		chain.doFilter(req, resp);
		
		//chain.doFilter(req, resp); 이후에 실행해야 할 경우 이 부분에 작성
		System.out.println("after filter");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}


}
