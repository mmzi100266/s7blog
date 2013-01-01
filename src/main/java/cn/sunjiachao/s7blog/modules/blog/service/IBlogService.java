package cn.sunjiachao.s7blog.modules.blog.service;


import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.BlogParams;
import cn.sunjiachao.s7common.model.dto.BlogBodyDto;
import cn.sunjiachao.s7common.model.dto.BlogShortBodyDto;

import java.util.List;

public interface IBlogService {

    public void createNewBlog(Blog blog, BlogParams blogParams);

    public List<BlogShortBodyDto> getAllBlogDtos();

    public BlogBodyDto getBlog(int id);

}
