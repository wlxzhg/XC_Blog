package cn.xiaozhigang.blog.mapper;

import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.dto.BlogQuery;

import java.util.List;

public interface BlogMapper {
    List<Blog> findBlogByBlogQuery(BlogQuery blogQuery);

    Blog findById(Integer id);
}
