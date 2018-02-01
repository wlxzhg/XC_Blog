package cn.xiaozhigang.blog.mapper;

import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.domain.BlogSave;
import cn.xiaozhigang.blog.dto.BlogQuery;

import java.util.List;
import java.util.Map;

public interface BlogMapper {
    List<Blog> findBlogWithoutTextByBlogQuery(BlogQuery blogQuery);

    List<Blog> findBlogWithoutTextByUid(Map<String,Object> map);

    Blog findById(Integer id);

    void like(Integer id);

    void unlike(Integer id);

    int addBlog(Blog blog);

    int updateBlog(Blog blog);

    BlogSave findBlogSaveByUid(Integer uid);

    int addBlogSave(BlogSave blogSave);

    int updateBlogSave(BlogSave blogSave);
}
