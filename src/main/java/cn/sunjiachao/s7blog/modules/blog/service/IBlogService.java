package cn.sunjiachao.s7blog.modules.blog.service;


import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.BlogParams;

public interface IBlogService {

    public void createNewBlog(Blog blog, BlogParams blogParams);

}
