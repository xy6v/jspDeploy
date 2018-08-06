package kr.or.ddit.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RequestListener implements ServletRequestListener {
	private Logger logger = LoggerFactory.getLogger(RequestListener.class);

	@Override
	public void requestDestroyed(ServletRequestEvent sre) {
		HttpServletRequest req = (HttpServletRequest)sre.getServletRequest();
		logger.debug("req.getRequestURI() destroyed: " + req.getRequestURI()) ;

	}

	@Override
	public void requestInitialized(ServletRequestEvent sre) {
		HttpServletRequest req = (HttpServletRequest)sre.getServletRequest();
		logger.debug("req.getRequestURI() initialized: " + req.getRequestURI()) ;
	}
	//결과는 식사후 확인

}
