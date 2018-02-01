package cn.xiaozhigang.blog.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class Blog {
    private Integer id;

    private Integer userId;

    private String title;

    private String brief;

    private String text;

    private Integer categoryCode;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp createTime;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp modifyTime;

    private Integer likeNum;

    private Integer browseNum;

    private Integer commentNum;

    private String beginImgHref;

    //数据库中没有的字段
    private String category;

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", brief='" + brief + '\'' +
                ", text='" + text + '\'' +
                ", categoryCode=" + categoryCode +
                ", createTime=" + createTime +
                ", modifyTime=" + modifyTime +
                ", likeNum=" + likeNum +
                ", browseNum=" + browseNum +
                ", commentNum=" + commentNum +
                ", beginImgHref='" + beginImgHref + '\'' +
                ", category='" + category + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(Integer categoryCode) {
        this.categoryCode = categoryCode;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Timestamp modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public Integer getBrowseNum() {
        return browseNum;
    }

    public void setBrowseNum(Integer browseNum) {
        this.browseNum = browseNum;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public String getBeginImgHref() {
        return beginImgHref;
    }

    public void setBeginImgHref(String beginImgHref) {
        this.beginImgHref = beginImgHref;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
