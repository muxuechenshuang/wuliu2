package com.forest.wu.utils.interceptor;


import com.forest.wu.pojo.User;
import com.forest.wu.service.UserService;
import com.forest.wu.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 拦截器
 *
 * @author 蒋梓伦
 * @create 2018-10-10 15:32
 **/
@Component
public class SysInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private UserService adminUserService;
	/**
	 * preHandle：在业务处理器处理请求之前被调用。预处理，可以进行编码、安全控制、权限校验等处理；
	 * postHandle：在业务处理器处理请求执行完成后，生成视图之前执行。后处理（调用了Service并返回ModelAndView，但未进行页面渲染），有机会修改ModelAndView；
	 * afterCompletion：在DispatcherServlet完全处理完请求后被调用，可用于清理资源等。返回处理（已经渲染了页面）；
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.CLIENT_USER_SESSION);
		User user1 = (User) session.getAttribute(Constants.COURIER_USER_SESSION);
		User user2 = (User) session.getAttribute(Constants.SITE_USER_SESSION);
		User user3 = (User) session.getAttribute(Constants.FILIALE_USER_SESSION);
		User user4 = (User) session.getAttribute(Constants.CENTER_USER_SESSION);
		if (null != user) { //dev SUCCESS
			return true;
		} else if (null != user1) {

			return true;
		} else if (null != user2) {

			return true;
		} else if (null != user3) {

			return true;
		} else if (null != user4) {

			return true;
		} else {
			response.sendRedirect(request.getContextPath() + "/403.jsp");
			return false;
		}
		}


}
