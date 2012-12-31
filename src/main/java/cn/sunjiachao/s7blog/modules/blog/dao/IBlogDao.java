package cn.sunjiachao.s7blog.modules.blog.dao;

import cn.sunjiachao.s7common.exception.DataBaseException;
import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.dto.BlogDto;

import java.util.List;

public interface IBlogDao {

    public int saveBlog(Blog blog);

    public List<BlogDto> getAllBlogList();

    public BlogDto getBlog(int id);

}
