package cn.xiaozhigang.blog.service;

import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.domain.BlogSave;
import cn.xiaozhigang.blog.dto.BlogQuery;

import java.util.List;

public interface BlogService {
    //Blog
    List<Blog> findBlogWithoutTextByBlogQuery(BlogQuery blogQuery);

    List<Blog> findBlogWithoutTextByUid(Integer uid);

    List<Blog> findBlogWithoutTextByUid(Integer uid,Integer amount);

    Blog findById(Integer id);

    void like(Integer id);

    void unlike(Integer id);

    boolean addBlog(Blog blog);

    boolean updateBlog(Blog blog);

    boolean addOrUpdateBlog(Blog blog);

    //BlogSave
    BlogSave findBlogSaveByUid(Integer uid);

    boolean addOrUpdateBlogSave(BlogSave blogSave);

    boolean addBlogSave(BlogSave blogSave);

    boolean updateBlogSave(BlogSave blogSave);
}
