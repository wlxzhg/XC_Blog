package cn.xiaozhigang.blog.service.impl;

import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.dto.BlogQuery;
import cn.xiaozhigang.blog.mapper.BlogMapper;
import cn.xiaozhigang.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper blogMapper;

    public List<Blog> findBlogByBlogQuery(BlogQuery blogQuery) {
//        blogQuery.convertCategory();
        return blogMapper.findBlogByBlogQuery(blogQuery);
    }

    public Blog findById(Integer id) {
    	if(id == null) return null;
    	return blogMapper.findById(id);
    }

    public void like(Integer id) {
    	blogMapper.like(id);
    }

    public void unlike(Integer id) {
    	blogMapper.unlike(id);
    }
}
