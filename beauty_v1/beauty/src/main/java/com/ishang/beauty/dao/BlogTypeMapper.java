package com.ishang.beauty.dao;

import com.ishang.beauty.entity.BlogType;
import java.util.List;

public interface BlogTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BlogType record);

    BlogType selectByPrimaryKey(Integer id);

    List<BlogType> selectAll();

    int updateByPrimaryKey(BlogType record);
    
    /**
     * 模糊查找
     * */
    List<BlogType> selectlike(BlogType record);
    
    /**
     * 查找被删除的记录
     * */
    List<BlogType> selectres();
}