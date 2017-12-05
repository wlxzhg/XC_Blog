package cn.xiaozhigang.blog.controller;

import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.domain.User;
import cn.xiaozhigang.blog.dto.BlogQuery;
import cn.xiaozhigang.blog.service.BlogService;
import cn.xiaozhigang.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("")
public class VisitController {
    @Autowired
    private UserService userService;
    @Autowired
    private BlogService blogService;

    @RequestMapping("")
    public String index(Model model) {
        BlogQuery blogQuery = new BlogQuery("web_font",1,5);

        ArrayList<Blog> blogs = (ArrayList<Blog>) blogService.findBlogByBlogQuery(blogQuery);
        model.addAttribute("blogs",blogs);
        return "main";
    }
}
