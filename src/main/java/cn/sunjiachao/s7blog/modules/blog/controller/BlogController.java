package cn.sunjiachao.s7blog.modules.blog.controller;

import cn.sunjiachao.s7blog.modules.blog.service.IBlogService;
import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.BlogParams;
import cn.sunjiachao.s7common.model.dto.BlogBodyDto;
import cn.sunjiachao.s7common.model.dto.BlogShortBodyDto;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BlogController {

    @Autowired
    private IBlogService blogService;

    @RequestMapping(value = "/artilce/{id}", method = RequestMethod.GET)
    public ModelAndView toBlogDetailPage(@PathVariable("id") String id) {
        BlogBodyDto bd = blogService.getBlog(Integer.parseInt(id));
        ModelAndView mv = new ModelAndView("article/articleContent");
        mv.addObject("blog", bd);
        return mv;
    }

    @RequestMapping(value = "/my/post", method = RequestMethod.POST)
    public String postNewBlog(Blog blog, HttpServletRequest req) {
        try {
            String shortBody = Jsoup.clean(blog.getBody(), Whitelist.none());
            shortBody = StringUtils.abbreviate(shortBody, 200);
            blog.setShortBody(shortBody);
            BlogParams blogParams = new BlogParams();
            String ip = req.getRemoteAddr();
            blogParams.setPostIp(ip);
            blogService.createNewBlog(blog, blogParams);
        } catch (Exception ex) {
            ex.printStackTrace();
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
