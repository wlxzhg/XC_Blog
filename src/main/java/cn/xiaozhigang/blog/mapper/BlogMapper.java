package cn.xiaozhigang.blog.mapper;

import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.domain.BlogSave;
import cn.xiaozhigang.blog.dto.BlogQuery;

import java.util.List;

public interface BlogMapper {
    List<Blog> findBlogByBlogQuery(BlogQuery blogQuery);

    Blog findById(Integer id);

    void like(Integer id);

    void unlike(Integer id);

    BlogSave findBlogSaveByUid(Integer uid);

    int addBlogSave(BlogSave blogSave);

    int updateBlogSave(BlogSave blogSave);
}
