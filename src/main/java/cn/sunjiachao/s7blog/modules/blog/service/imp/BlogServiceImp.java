package cn.sunjiachao.s7blog.modules.blog.service.imp;

import cn.sunjiachao.s7blog.modules.blog.dao.IBlogDao;
import cn.sunjiachao.s7blog.modules.blog.dao.IBlogParamsDao;
import cn.sunjiachao.s7blog.modules.blog.service.IBlogService;
import cn.sunjiachao.s7common.model.Blog;
import cn.sunjiachao.s7common.model.BlogParams;
import cn.sunjiachao.s7common.model.dto.BlogBodyDto;
import cn.sunjiachao.s7common.model.dto.BlogShortBodyDto;
import cn.sunjiachao.s7common.model.web.Page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Transactional(readOnly = true)
@Service(value = "blogService")
public class BlogServiceImp implements IBlogService {

    @Autowired
    private IBlogDao blogDao;

    @Autowired
    private IBlogParamsDao blogParamsDao;

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void createNewBlog(Blog blog, BlogParams blogParams) {
        blog.setCreateTime(new Date());
        blog.setCreateUser(1);
        int blogid = blogDao.saveBlog(blog);
        blogParams.setBlogId(blogid);
        blogParamsDao.saveBlogParams(blogParams);
    }

    @Override
    public List<BlogShortBodyDto> getAllBlogDtos() {
        return blogDao.getAllBlogList();
    }

    @Override
    public BlogBodyDto getBlog(int id) {
        return blogDao.getBlog(id);
    }

	@Override
	public Page<BlogShortBodyDto> getBlogByPage(int currentPage, int numsPerPage) {
		return blogDao.getBlogByPage(currentPage, numsPerPage);
	}
}
