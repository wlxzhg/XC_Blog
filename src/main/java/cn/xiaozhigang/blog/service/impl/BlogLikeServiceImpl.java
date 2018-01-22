package cn.xiaozhigang.blog.service.impl;

import cn.xiaozhigang.blog.domain.BlogLike;
import cn.xiaozhigang.blog.mapper.BlogLikeMapper;
import cn.xiaozhigang.blog.service.BlogLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class BlogLikeServiceImpl implements BlogLikeService {
    @Autowired
    private BlogLikeMapper blogLikeMapper;

    public boolean addLike(BlogLike blogLike) {
        if(blogLike == null || blogLike.getBlogId() == null || blogLike.getUserId() == null)
            return false;
        blogLikeMapper.addLike(blogLike);
        return true;
    }

    public boolean removeLike(Integer blogId, Integer userId) {
        if(blogId == null || userId == null)
            return false;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("blogId", blogId);
        map.put("userId", userId);
        blogLikeMapper.removeLike(map);
        return true;
    }

    public boolean reLike(Integer blogId, Integer userId) {
        if(blogId == null || userId == null)
            return false;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("blogId", blogId);
        map.put("userId", userId);
        blogLikeMapper.reLike(map);
        return true;
    }

    public boolean isLikeed(Integer blogId, Integer userId) {
        if(blogId == null || userId == null) return false;
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("blogId", blogId);
        map.put("userId", userId);
        if(blogLikeMapper.isLikeed(map) >= 1)
            return true;
        else
            return false;
    }

    public BlogLike findByBidAndUid(Integer blogId, Integer userId) {
        if(blogId == null || userId == null) return null;
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("blogId", blogId);
        map.put("userId", userId);
        return blogLikeMapper.findByBidAndUid(map);
    }
}
