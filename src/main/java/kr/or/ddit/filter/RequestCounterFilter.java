package kr.or.ddit.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet Filter implementation class RequestCounterFilter
 */
//@WebFilter("/RequestCounterFilter")
public class RequestCounterFilter implements Filter {
	
	private Logger logger = LoggerFactory.getLogger(RequestCounterFilter.class);
	private Map<String, Integer> requestCountMap = new HashMap<String, Integer>();

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		ServletContext sc = request.getServletContext();
		sc.setAttribute("reqeustCounter", requestCountMap);
		
		HttpServletRequest req = (HttpServletRequest)request;
		
		//전처리
		logger.debug(req.getRequestURI());
		//map객체에uri를 키로 하고, 값: 해당 uri 요청된 횟수
		Integer count = requestCountMap.get(req.getRequestURI());
		
		count = count == null ? 0 : count;
		
		requestCountMap.put(req.getRequestURI(), ++count);
		
		//다른 필터, 혹은 더이상의 필터가 없을경우 요청에 대한 servlet 으로 전달
		chain.doFilter(request, response);
		
		//후처리
	}


	public void init(FilterConfig fConfig) throws ServletException {
		

	}

}
