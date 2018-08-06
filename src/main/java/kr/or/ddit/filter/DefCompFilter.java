package kr.or.ddit.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet Filter implementation class DefCompFilter
 */
//@WebFilter("*")
public class DefCompFilter implements Filter {
	
	private Logger logger = LoggerFactory.getLogger(DefCompFilter.class);

    public DefCompFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		//전처리
		HttpServletRequest req = (HttpServletRequest)request;
		
		//lock이 걸려있는 map 객체라 임의 등록이 불가능하다 --> wrapper를 통해 해결
		//Map<String, String[]> requestMap = req.getParameterMap();
		//requestMap.put("defComp", new String[]{"valueByFilter"});
		
		logger.debug(req.getRequestURI() + ":  DefCompFilter doFilter");
		
		DefCompWrapper defCompWrapper = new DefCompWrapper(req);
		
		//filter / servlet 요청처리
		//chain.doFilter(request, response);
		chain.doFilter(defCompWrapper, response);
		
		//후처리
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}





