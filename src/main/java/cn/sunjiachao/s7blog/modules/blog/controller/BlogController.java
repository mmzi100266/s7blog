package cn.sunjiachao.s7blog.modules.blog.controller;

import cn.sunjiachao.s7blog.modules.blog.service.IBlogService;
import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.BlogParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class BlogController {

    @Autowired
    private IBlogService blogService;

    @RequestMapping(value = "/article", method = RequestMethod.GET)
    public ModelAndView getBlogContent(HttpServletRequest req, HttpServletResponse resp) {
        ModelAndView nav = new ModelAndView("article/articleContent");
        return nav;
    }

    @RequestMapping(value = "/my/post", method = RequestMethod.POST)
    public String postNewBlog(Blog blog,HttpServletRequest req) {
        BlogParams blogParams = new BlogParams();
        try {
            String ip = req.getRemoteAddr();
            blogParams.setPostIp(ip);
            blogService.createNewBlog(blog,blogParams);
        } catch (Exception ex) {
            return "redirect:/";
        }
        return "redirect:/article/postsuccess";
    }

    @RequestMapping(value = "/my/newarticle", method = RequestMethod.GET)
    public String toPostNewBlogPage() {
        return "article/newarticle";
    }

    @RequestMapping(value = "/article/postsuccess", method = RequestMethod.GET)
    public String toPostSuccessPage() {
        return "article/postsuccess";
    }
}
