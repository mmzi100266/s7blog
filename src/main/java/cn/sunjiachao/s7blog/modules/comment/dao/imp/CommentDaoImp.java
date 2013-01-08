package cn.sunjiachao.s7blog.modules.comment.dao.imp;

import cn.sunjiachao.s7blog.modules.comment.dao.ICommentDao;
import cn.sunjiachao.s7common.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;


@Repository(value = "commentDao")
public class CommentDaoImp implements ICommentDao {

    private NamedParameterJdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    @Override
    public void saveComment(Comment comment) {
        String sql = "insert into s7_comment value(:title,:body,:belongTo)";
        SqlParameterSource param = new BeanPropertySqlParameterSource(comment);
        jdbcTemplate.update(sql, param);
    }
}
