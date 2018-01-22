package cn.xiaozhigang.blog.service;

import cn.xiaozhigang.blog.domain.BlogLike;

public interface BlogLikeService {
    //添加赞
    boolean addLike(BlogLike blogLike);

    //取消赞
    boolean removeLike(Integer blogId, Integer userId);

    //重新点赞（已有记录的情况）
    boolean reLike(Integer blogId, Integer userId);

    //判断是否点赞
    boolean isLikeed(Integer blogId,Integer userId);

    //
    BlogLike findByBidAndUid(Integer blogId,Integer userId);
}
