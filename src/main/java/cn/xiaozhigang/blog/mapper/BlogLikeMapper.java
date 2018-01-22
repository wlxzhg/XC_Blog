package cn.xiaozhigang.blog.mapper;

import cn.xiaozhigang.blog.domain.BlogLike;

import java.util.Map;

public interface BlogLikeMapper {
    //添加赞
    void addLike(BlogLike blogLike);

    //取消赞
    void removeLike(Map<String,Object> map);

    //重新点赞
    void reLike(Map<String, Object> map);

    //判断是否点赞
    int isLikeed(Map<String,Object> map);

    BlogLike findByBidAndUid(Map<String, Object> map);
}
