package cn.xiaozhigang.blog.service.impl;

import cn.xiaozhigang.blog.domain.User;
import cn.xiaozhigang.blog.mapper.UserMapper;
import cn.xiaozhigang.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    public User findUserById(Integer id) {
        return userMapper.findUserById(id);
    }
}
