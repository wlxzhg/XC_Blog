package cn.xiaozhigang.blog.service;

import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.domain.BlogSave;
import cn.xiaozhigang.blog.dto.BlogQuery;

import java.util.List;

public interface BlogService {
    List<Blog> findBlogByBlogQuery(BlogQuery blogQuery);

    Blog findById(Integer id);

    void like(Integer id);

    void unlike(Integer id);

    BlogSave findBlogSaveByUid(Integer uid);

    boolean addOrUpdateBlogSave(BlogSave blogSave);

    boolean addBlogSave(BlogSave blogSave);

    boolean updateBlogSave(BlogSave blogSave);
}
