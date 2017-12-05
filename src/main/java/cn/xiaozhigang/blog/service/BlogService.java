package cn.xiaozhigang.blog.service;

import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.dto.BlogQuery;

import java.util.List;

public interface BlogService {
    List<Blog> findBlogByBlogQuery(BlogQuery blogQuery);
}
