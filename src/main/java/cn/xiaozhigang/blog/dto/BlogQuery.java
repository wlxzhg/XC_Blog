package cn.xiaozhigang.blog.dto;

import cn.xiaozhigang.blog.constant.BlogCategoryEnum;

public class BlogQuery {
    private String category;
    private Integer pageNum;
    private Integer numPerPage;

    private Integer categoryCode;
    private Integer start;
    private Integer end;

    public BlogQuery() {}
    public BlogQuery(String category,Integer pageNum,Integer numPerPage) {
        this.category = category;
        this.pageNum = pageNum;
        this.numPerPage = numPerPage;
        this.categoryCode = BlogCategoryEnum.descToCode(category);
        this.start = (pageNum - 1) * numPerPage;
        this.end = start + numPerPage;
    }

//    public void convertCategory() {
//        start = (pageNum - 1) * numPerPage;
//        end = start + numPerPage;
//        if(category.equals("web_font"))
//            categoryCode = 1;
//        else if(category.equals("web_back_font"))
//            categoryCode = 2;
//        else
//            categoryCode = 0;
//    }

    @Override
    public String toString() {
        return "BlogQuery{" +
                "category='" + category + '\'' +
                ", pageNum=" + pageNum +
                ", numPerPage=" + numPerPage +
                ", categoryCode=" + categoryCode +
                ", start=" + start +
                ", end=" + end +
                '}';
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getNumPerPage() {
        return numPerPage;
    }

    public void setNumPerPage(Integer numPerPage) {
        this.numPerPage = numPerPage;
    }

    public Integer getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(Integer categoryCode) {
        this.categoryCode = categoryCode;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getEnd() {
        return end;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }
}
