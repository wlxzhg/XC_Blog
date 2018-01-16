package cn.xiaozhigang.blog.mapper;

import cn.xiaozhigang.blog.domain.User;

public interface UserMapper {
    User findUserById(Integer id);

    User findUserByName(String userName);

    boolean addUser(User user);
}
