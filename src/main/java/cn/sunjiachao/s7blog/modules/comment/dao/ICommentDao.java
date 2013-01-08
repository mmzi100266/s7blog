package cn.sunjiachao.s7blog.modules.comment.dao;

import cn.sunjiachao.s7common.model.Comment;

/**
 * Created with IntelliJ IDEA.
 * User: se7en
 * Date: 13-1-8
 * Time: 下午9:42
 * To change this template use File | Settings | File Templates.
 */
public interface ICommentDao {

    public void saveComment(Comment comment);

}
