package cn.sunjiachao.s7blog.modules.home.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.sunjiachao.s7blog.modules.blog.service.IBlogService;
import cn.sunjiachao.s7common.model.dto.BlogShortBodyDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);

	@Autowired
	private IBlogService blogService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getHomePageBlogs() {
		List<BlogShortBodyDto> bds = blogService.getAllBlogDtos();
		ModelAndView nav = new ModelAndView("home/index");
		nav.addObject("blogs", bds);
		return nav;
	}

}
