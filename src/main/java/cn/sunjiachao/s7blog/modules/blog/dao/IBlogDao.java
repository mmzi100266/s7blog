package cn.sunjiachao.s7blog.modules.blog.dao;

import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.dto.BlogBodyDto;
import cn.sunjiachao.s7common.model.dto.BlogShortBodyDto;

import java.util.List;

public interface IBlogDao {

    public int saveBlog(Blog blog);

    public List<BlogShortBodyDto> getAllBlogList();

    public BlogBodyDto getBlog(int id);

}
