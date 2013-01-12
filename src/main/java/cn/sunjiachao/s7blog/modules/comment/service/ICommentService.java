package cn.sunjiachao.s7blog.modules.comment.service;

import cn.sunjiachao.s7common.model.Comment;

import java.util.List;

public interface ICommentService {
	
	public void createNewComment(Comment comment);

    public List<Comment> getCommentsByBlog(int blogId);

}
