package cn.xiaozhigang.blog.controller;

import cn.xiaozhigang.blog.constant.BlogCategoryEnum;
import cn.xiaozhigang.blog.constant.Constant;
import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.domain.BlogLike;
import cn.xiaozhigang.blog.domain.BlogSave;
import cn.xiaozhigang.blog.domain.User;
import cn.xiaozhigang.blog.dto.BlogQuery;
import cn.xiaozhigang.blog.service.BlogLikeService;
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

import javax.jws.soap.SOAPBinding;
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
    private BlogLikeService blogLikeService;
    @Autowired
    private static Logger LOG = Logger.getLogger(VisitController.class);

    private User checkUserLogin(HttpSession session) {
        Boolean logged = (Boolean) session.getAttribute("logged");
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

        BlogQuery blogQuery = new BlogQuery("front_end",1,5);

        ArrayList<Blog> blogs = (ArrayList<Blog>) blogService.findBlogWithoutTextByBlogQuery(blogQuery);
        model.addAttribute("blogs",blogs);

        User user = checkUserLogin(session);
        if(user != null)
            model.addAttribute("user",user);
        return "main";
    }

    @RequestMapping("/login")
    public String login(HttpSession session) {
        Boolean logged = (Boolean) session.getAttribute(Constant.SESSION_KEY_FOE_LOGGED);
        if(logged != null && logged == true) 
            return "redirect:/";
        return "login";
    }

    @RequestMapping(value = "/dologin",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> doLogin(String email_or_mobile_number, String password, Model model, HttpSession session) {
        LOG.info("用户登录，用户名：" + email_or_mobile_number);
        String mes;
        Boolean logged = (Boolean) session.getAttribute("logged");
        if(logged != null && logged == true) {
            mes = "already_login";
        } else if (email_or_mobile_number == null || password == null || email_or_mobile_number.equals("") || password.equals("")) {
            mes = "parameter_error";
        } else {
            User user = userService.findUserByName(email_or_mobile_number);
            String passwordMd5 = Md5Utils.getMd5(password);
            if(user.getPassword().equals(passwordMd5)) {
                user.setPassword("");
                session.setAttribute(Constant.SESSION_KEY_FOR_USER_ID,user.getId());
                session.setAttribute(Constant.SESSION_KEY_FOR_USER,user);
                session.setAttribute(Constant.SESSION_KEY_FOE_LOGGED,true);
                mes = "login_success";
            } else {
                mes = "password_or_username_error";
            }
        }

        Map<String, String> map = new HashMap<String, String>();
        map.put("message",mes);
        return map;
    }

    @RequestMapping("/logout")
    @ResponseBody
    public Map<String,Object> logout(HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = checkUserLogin(session);
        if(user != null) {
            session.removeAttribute("logged");
            session.removeAttribute("uid");
            session.removeAttribute("user");
            map.put("message","logout_success");
        } else {
            map.put("message","not_login");
        }
        return map;
    }

    @RequestMapping("/sign")
    public String sign() {
        return "sign";
    }
    //   @RequestMapping("/md")
    // public String md() {
    //     return "md";
    // }

    /**
     * 处理注册请求
     * @return message : user_exist 用户已经存在
     *                  : database_error 数据库错误
     *                  :parameter_error 用户名、密码为Null或空字符串
     *                 : sign_success 注册成功
     * */
    @RequestMapping(value = "/dosign",method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doSign(String email_or_mobile_number,String password,Model model) {
        LOG.info("用户注册：userName:"+email_or_mobile_number);
        Map<String, Object> map = new HashMap<String,Object>();
        String message;
        if(email_or_mobile_number == null || password == null || email_or_mobile_number.equals("") || password.equals("")) {
            message = "parameter_error";
        } else {
            User user = userService.findUserByName(email_or_mobile_number);
            if(user != null) message = "user_exist";
            else {
                user = new User();
                user.setUserName(email_or_mobile_number);
                String passwordMd5 = Md5Utils.getMd5(password);
                user.setPassword(passwordMd5);
                user.setCreateTime(new Timestamp(System.currentTimeMillis()));
                if(userService.addUser(user)) message = "sign_success";
                else message = "database_error";
            }
        }
        map.put("message",message);
        return map;
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
            ArrayList<Blog> blogs = (ArrayList<Blog>) blogService.findBlogWithoutTextByBlogQuery(blogQuery);

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
    public String article(@PathVariable Integer id,Model model,HttpSession session) {
        Blog blog = blogService.findById(id);
        model.addAttribute("blog",blog);
        User user = checkUserLogin(session);
        boolean flag = false;
        if(user !=null)
            flag = blogLikeService.isLikeed(id,user.getId());
        model.addAttribute("isLike",(flag==true)?"true":"false");
        return "article";
    }

    @RequestMapping(value = "article/like",method=RequestMethod.POST)
    @ResponseBody
    public Object likeArticle(Integer id,Integer option,HttpSession session) {
        Map<String,Object> result = new HashMap<String, Object>();
        User user = checkUserLogin(session);
        if(user == null) {
            result.put("info","not login");
            return result;
        }

        BlogLike blogLike = blogLikeService.findByBidAndUid(id, user.getId());
        boolean isLiked = (blogLike == null || blogLike.getValid() == 0)?false:true;
        if((isLiked && option == 1) || (!isLiked && option == 0)) {
            result.put("info","不能重复点赞或取消点赞喔！");
        } else if (option == 1 && (!isLiked)) {
            //点赞的情况
            if(blogLike == null) {
                blogLike = new BlogLike();
                blogLike.setUserId(user.getId());
                blogLike.setBlogId(id);
                blogLike.setCreateTime(new Timestamp(System.currentTimeMillis()));
                blogLike.setValid(1);
                blogLikeService.addLike(blogLike);
            } else {
                blogLikeService.reLike(id,user.getId());
            }
            blogService.like(id); //增加点赞数
        } else if(option == 0 && isLiked) {
            //取消点赞的情况
            blogLikeService.removeLike(id, user.getId());
            blogService.unlike(id);
        }
        Blog blog = blogService.findById(id);
        if(blog == null)
            result.put("info","article is not exist");
        else
            result.put("newLikeNum",blog.getLikeNum());
        return result;
    }

    @RequestMapping(value = "login_status",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> loginStatus(HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user = checkUserLogin(session);
        if(user == null) {
            map.put("isLogin",false);
        } else {
            map.put("isLogin",true);
            map.put("user",user);
        }
        return map;
    }

    @RequestMapping("writer")
    public String writer(HttpSession session,Model model) {
        User user = checkUserLogin(session);
        if(user == null)
            return "redirect:/login";
        BlogSave blogSave = blogService.findBlogSaveByUid(user.getId());
        if(blogSave != null)
            model.addAttribute("savedBlog",blogSave.getTextMd());
        return "md";
    }

    @RequestMapping(value = "writer/save",method =RequestMethod.POST)
    @ResponseBody
    public Object writerSave(HttpSession session, String value) {
        LOG.info("保存的文章：" + value);

        HashMap<String, String> map = new HashMap<String, String>();

        User user = checkUserLogin(session);
        if(user == null) {
            map.put("info","用户未登录");
        } else if(value == null){
            map.put("info","数据为空");
        } else {
            BlogSave blogSave = blogService.findBlogSaveByUid(user.getId());
            if(blogSave == null) {
                blogSave = new BlogSave();
                blogSave.setTextMd(value);
                blogSave.setUserId(user.getId());
                blogSave.setCreateTime(new Timestamp(System.currentTimeMillis()));
                blogSave.setModifyTime(new Timestamp(System.currentTimeMillis()));
            } else {
                blogSave.setTextMd(value);
                blogSave.setModifyTime(new Timestamp(System.currentTimeMillis()));
                blogSave.setCreateTime(null);
            }

            if(blogService.addOrUpdateBlogSave(blogSave)){
              map.put("info","success");
            } else {
                map.put("info","数据库错误");
            }
        }

        return map;
    }

    @RequestMapping(value="writer/publish",method=RequestMethod.POST)
    @ResponseBody
    public Object writerPublish(Blog newBlog,HttpSession session) {
        LOG.info("发布新文章：" + newBlog);
        System.out.println(newBlog);
        HashMap<String, String> map = new HashMap<String, String>();

        User user = checkUserLogin(session);
        if(user == null) {
            map.put("info","用户未登录");
        } else if(newBlog == null) {
            map.put("info", "发送的数据为空");
        } else {
            newBlog.setUserId(user.getId());
            newBlog.setCreateTime(new Timestamp(System.currentTimeMillis()));
            newBlog.setModifyTime(new Timestamp(System.currentTimeMillis()));
            if(blogService.addBlog(newBlog)) {
                map.put("info","success");
            } else
                map.put("info","数据库异常或用户信息异常");
        }

        return map;
    }

    @RequestMapping(value = "my-article")
    public String myArticle(HttpSession session) {
        if(checkUserLogin(session) == null)
            return "redirect:/login";
        return "my_article";
    }

    @RequestMapping(value = "my-article/get",method=RequestMethod.GET)
    @ResponseBody
    public Object myArticleGet(HttpSession session) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        User user = checkUserLogin(session);
        if(user == null) {
            map.put("info", "用户未登录");
        } else {
            List<Blog> blogs = blogService.findBlogWithoutTextByUid(user.getId());
            map.put("info","success");
            map.put("blogs",blogs);
            map.put("size",blogs.size());
        }
        return map;
    }
}
