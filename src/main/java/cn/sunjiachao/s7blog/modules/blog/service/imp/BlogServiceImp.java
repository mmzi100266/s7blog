package cn.sunjiachao.s7blog.modules.blog.service.imp;

import cn.sunjiachao.s7blog.modules.blog.dao.IBlogDao;
import cn.sunjiachao.s7blog.modules.blog.service.IBlogService;
import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.BlogParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Transactional(readOnly = true)
@Service(value = "blogService")
public class BlogServiceImp implements IBlogService {

    @Autowired
    private IBlogDao blogDao;

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void createNewBlog(Blog blog, BlogParams blogParams) {
        blog.setCreateTime(new Date());
        blog.setCreateUser(1);
        int blogid = blogDao.saveBlog(blog);
        blogParams.setBlogId(blogid);
    }
}
