package cn.xiaozhigang.blog.constant;

public enum BlogCategoryEnum {
    FONT_END("font_end",1),
    BACK_END("back_end",2);

    private int code;
    private String desc;

    /**
     * 检查desc是否是其中一个枚举的描述
     * */
    public static boolean in(String desc) {
        for (BlogCategoryEnum blogCategoryEnum : BlogCategoryEnum.values()) {
            if(desc.equals(blogCategoryEnum.getDesc()))
                return true;
        }
        return false;
    }

    /**
     * 由desc转换为code，如descToCode("font_end")的结果为1
     * 如果不存在对应的枚举值，则返回-1
     * */
    public static int descToCode(String desc) {
        for (BlogCategoryEnum blogCategoryEnum : BlogCategoryEnum.values()) {
            if(blogCategoryEnum.getDesc().equals(desc))
                return blogCategoryEnum.getCode();
        }
        return -1;
    }

    /**
     * 有code转换为desc，如codeToDesc(1)的结果为font_end
     * 如果不存在对应的枚举值，则返回null
     */
    public static String codeToDesc(int code) {
        for (BlogCategoryEnum blogCategoryEnum : BlogCategoryEnum.values()) {
            if(blogCategoryEnum.getCode() == code)
                return blogCategoryEnum.getDesc();
        }
        return null;
    }

    BlogCategoryEnum(String desc, int code) {
        this.code = code;
        this.desc = desc;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
