package cn.xiaozhigang.blog.controller;

import cn.xiaozhigang.blog.constant.BlogCategoryEnum;
import cn.xiaozhigang.blog.domain.Blog;
import cn.xiaozhigang.blog.domain.User;
import cn.xiaozhigang.blog.dto.BlogQuery;
import cn.xiaozhigang.blog.service.BlogService;
import cn.xiaozhigang.blog.service.UserService;
import cn.xiaozhigang.blog.util.IpAddressUtil;
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
import javax.ws.rs.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("")
public class VisitController {
    @Autowired
    private UserService userService;
    @Autowired
    private BlogService blogService;
    @Autowired
    private static Logger LOG = Logger.getLogger(VisitController.class);

    @RequestMapping("")
    public String index(Model model, HttpServletRequest request) {
        String ip = IpAddressUtil.getIpFromRequest(request);
        LOG.info(String.format("访问首页，IP：%s",ip));

        BlogQuery blogQuery = new BlogQuery("font_end",1,5);

        ArrayList<Blog> blogs = (ArrayList<Blog>) blogService.findBlogByBlogQuery(blogQuery);
        model.addAttribute("blogs",blogs);
        return "main";
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
}
