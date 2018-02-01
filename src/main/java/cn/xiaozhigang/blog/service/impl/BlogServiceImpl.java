package cn.xiaozhigang.blog.service.impl;

import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.domain.BlogSave;
import cn.xiaozhigang.blog.dto.BlogQuery;
import cn.xiaozhigang.blog.mapper.BlogMapper;
import cn.xiaozhigang.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogMapper blogMapper;

    public List<Blog> findBlogWithoutTextByBlogQuery(BlogQuery blogQuery) {
//        blogQuery.convertCategory();
        return blogMapper.findBlogWithoutTextByBlogQuery(blogQuery);
    }

    public List<Blog> findBlogWithoutTextByUid(Integer uid) {
        return findBlogWithoutTextByUid(uid,null);
    }

    public List<Blog> findBlogWithoutTextByUid(Integer uid, Integer amount) {
        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("uid",uid);
        map.put("amount",amount);
        return blogMapper.findBlogWithoutTextByUid(map);
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

    public boolean addBlog(Blog blog) {
        if(blog == null || blog.getUserId() == null)
            return false;
        if(blogMapper.addBlog(blog) >= 1)
            return true;
        else
            return false;
    }

    public boolean updateBlog(Blog blog) {
        return false;
    }

    public boolean addOrUpdateBlog(Blog blog) {
        return false;
    }

    /***************************BlogSave Start**************************/
    public BlogSave findBlogSaveByUid(Integer uid) {
        return blogMapper.findBlogSaveByUid(uid);
    }

    public boolean addOrUpdateBlogSave(BlogSave blogSave) {
        if(blogSave == null) return false;
        if(blogSave.getId() == null)
            return addBlogSave(blogSave);
        else
            return updateBlogSave(blogSave);
    }

    public boolean addBlogSave(BlogSave blogSave) {
        if(blogSave == null || blogSave.getUserId() == null)
            return false;
        if(blogMapper.addBlogSave(blogSave) != 1)
            return false;
        return true;
    }

    public boolean updateBlogSave(BlogSave blogSave) {
        if(blogSave == null || blogSave.getId() == null)
            return false;
        if(blogMapper.updateBlogSave(blogSave) != 1)
            return false;
        return true;
    }
    /***************************BlogSave End**************************/
}
