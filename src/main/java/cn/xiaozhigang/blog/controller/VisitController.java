package cn.xiaozhigang.blog.controller;

import cn.xiaozhigang.blog.constant.BlogCategoryEnum;
import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.domain.User;
import cn.xiaozhigang.blog.dto.BlogQuery;
import cn.xiaozhigang.blog.service.BlogService;
import cn.xiaozhigang.blog.service.UserService;
import cn.xiaozhigang.blog.util.IpAddressUtil;
import cn.xiaozhigang.blog.util.Md5Utils;
import com.alibaba.fastjson.JSON;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Path;
import java.sql.Timestamp;
import java.util.*;

@Controller
@RequestMapping("")
public class VisitController {
    @Autowired
    private UserService userService;
    @Autowired
    private BlogService blogService;
    @Autowired
    private static Logger LOG = Logger.getLogger(VisitController.class);

    private User checkUserLogin(HttpSession session) {
        Boolean logged = (Boolean) session.getAttribute("loggedIn");
        User user = null;
        if(logged != null && logged == true) { //已登录
            user = (User) session.getAttribute("user");
        }
        return user;
    }

    @RequestMapping("")
    public String index(Model model, HttpServletRequest request,HttpSession session) {
        String ip = IpAddressUtil.getIpFromRequest(request);
        LOG.info(String.format("访问首页，IP：%s",ip));

        BlogQuery blogQuery = new BlogQuery("font_end",1,5);

        ArrayList<Blog> blogs = (ArrayList<Blog>) blogService.findBlogByBlogQuery(blogQuery);
        model.addAttribute("blogs",blogs);

        User user = checkUserLogin(session);
        if(user != null)
            model.addAttribute("user",user);
        return "main";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/dologin")
    public String doLogin(String email_or_mobile_number, String password, Model model, HttpSession session) {
        LOG.info("用户登录，用户名：" + email_or_mobile_number);
        Boolean logged = (Boolean) session.getAttribute("loggedIn");
        if(logged != null && logged == true) {
            return "main";
        }
        String mes = null,ret;
        if (email_or_mobile_number == null || password == null || email_or_mobile_number.equals("") || password.equals("")) {
            mes = "parameter_error";
            ret = "login";
        } else {
            User user = userService.findUserByName(email_or_mobile_number);
            String passwordMd5 = Md5Utils.getMd5(password);
            if(user.getPassword().equals(passwordMd5)) {
                ret = "redirect:/";
                user.setPassword("");
                session.setAttribute("uid",user.getId());
                session.setAttribute("user",user);
                session.setAttribute("logged",true);
            } else {
                mes = "password_or_username_error";
                ret = "login";
            }
        }
        if(mes != null)
            model.addAttribute("message",mes);
        return ret;
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("logged");
        session.removeAttribute("uid");
        session.removeAttribute("user");
        return "redirect:/";
    }

    @RequestMapping("/sign")
    public String sign() {
        return "sign";
    }

    /**
     * 处理注册请求
     * @return sign : model.message : user_exist 用户已经存在
     *                               : database_error 数据库错误
     *                               : null      发送的参数为Null或空字符串
     *         login : model.message : sign_success 注册成功
     * */
    @RequestMapping("/dosign")
    public String doSign(String email_or_mobile_number,String password,Model model) {
        LOG.info("用户注册：userName:"+email_or_mobile_number);
        if(email_or_mobile_number == null || password == null || email_or_mobile_number.equals("") || password.equals(""))
            return "sign";
        User user = userService.findUserByName(email_or_mobile_number);
        if(user != null) { //已经存在该用户了
            model.addAttribute("message","user_exist");
            return "sign";
        }
        user = new User();
        user.setUserName(email_or_mobile_number);
        String passwordMd5 = Md5Utils.getMd5(password);
        user.setPassword(passwordMd5);
        user.setCreateTime(new Timestamp(System.currentTimeMillis()));
        if(userService.addUser(user)) {
            model.addAttribute("message", "sign_success");
            return "login";
        }
        else { //数据库添加失败
            model.addAttribute("message","database_error");
            return "sign";
        }
    }

    @RequestMapping("/agreement")
    public String agreement() {
        return "agreement";
    }

    /**
     * 获取blogs
     * @param category 类别用英文表示
     * @param pageNum 页码
     * @param numPerPage 每页包含的博客数目
     * */
    @RequestMapping(value = "getblogs/{category}/{pageNum}/{numPerPage}",
                    method = RequestMethod.GET,
                    produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public Object getBlogs(@PathVariable String category,
                           @PathVariable int pageNum,
                           @PathVariable int numPerPage,
                           HttpServletRequest request) {
        String ip = IpAddressUtil.getIpFromRequest(request);
        LOG.info(String.format("请求blogs，IP：%s，类别：%s，页码：%d，每页博客数：%d。",
                                    ip,category,pageNum,numPerPage));
        Map<String,Object> map = new HashMap<String, Object>();

        if(pageNum <= 0 || numPerPage <= 0 || BlogCategoryEnum.in(category) == false) {
            map.put("info", "参数错误");
        } else {
            BlogQuery blogQuery = new BlogQuery(category, pageNum, numPerPage);
            ArrayList<Blog> blogs = (ArrayList<Blog>) blogService.findBlogByBlogQuery(blogQuery);

            if(blogs != null && blogs.size() > 0) {
                map.put("info","success");
                map.put("blogs",blogs);
            } else {
                map.put("info","未查找到数据");
            }
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("article/{id}")
    public String article(@PathVariable Integer id,Model model) {
        Blog blog = blogService.findById(id);
        model.addAttribute("blog",blog);
        return "article";
    }

    @RequestMapping(value = "article/like",method=RequestMethod.POST)
    @ResponseBody
    public Object likeArticle(Integer id,Integer option) {
        if(option == 1)
            blogService.like(id);
        else if(option == 0)
            blogService.unlike(id);
        Blog blog = blogService.findById(id);
        Map<String,Object> result = new HashMap<String, Object>();
        if(blog != null)
            result.put("newLikeNum",blog.getLikeNum());
        else
            result.put("info","fail");
        return result;
    }
}
