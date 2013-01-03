package cn.sunjiachao.s7blog.modules.user.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.sunjiachao.s7blog.modules.user.service.IUserService;
import cn.sunjiachao.s7common.exception.LoginFailedException;
import cn.sunjiachao.s7common.model.User;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory
			.getLogger(UserController.class);

	@Autowired
	private IUserService userService;

	@RequestMapping(method = RequestMethod.GET, value = "/my")
	public String toUserLoginPage() {
		return "user/login";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/my/loginSubmit")
	public String loginSubmit(User user, HttpServletRequest req) {
		user.setCreateTime(new Date());
		try {
			int uid = userService.loginByNameAndPassword(user);
			req.getSession().setAttribute("uid", uid);
		} catch (LoginFailedException e) {
			logger.info("用户名或密码验证错误");
			logger.info(e.getClass().getName());
			return "redirect:/my";
		}
		logger.info("当前登录用户: " + user.getUid() + "," + user.getLoginName());
		return "redirect:/";
	}

}
