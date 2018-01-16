package cn.xiaozhigang.blog.service;

import cn.xiaozhigang.blog.domain.User;

public interface UserService {
    User findUserById(Integer id);

    User findUserByName(String userName);

    boolean addUser(User user);
}
