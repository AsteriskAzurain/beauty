package com.ishang.beauty.dao;

import com.ishang.beauty.entity.BlogComment;
import java.util.List;

public interface BlogCommentMapper {
    int deleteByPrimaryKey(Integer id);

	int insert(BlogComment record);

	BlogComment selectByPrimaryKey(Integer id);

	List<BlogComment> selectAll();

	int updateByPrimaryKey(BlogComment record);

	int deleteByPrimaryKey(Integer id);

    int insert(BlogComment record);

    BlogComment selectByPrimaryKey(Integer id);

    List<BlogComment> selectAll();

    int updateByPrimaryKey(BlogComment record);
}