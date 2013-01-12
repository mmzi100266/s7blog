package cn.sunjiachao.s7blog.modules.comment.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.sunjiachao.s7blog.modules.comment.dao.ICommentDao;
import cn.sunjiachao.s7blog.modules.comment.service.ICommentService;
import cn.sunjiachao.s7common.model.Comment;

import java.util.List;

@Transactional(readOnly = true)
@Service(value = "commentService")
public class CommentServiceImp implements ICommentService {

    @Autowired
    private ICommentDao commentDao;

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void createNewComment(Comment comment) {
        commentDao.saveComment(comment);
    }

    @Override
    public List<Comment> getCommentsByBlog(int blogId) {
        return commentDao.listCommentsByBlog(blogId);
    }

}
