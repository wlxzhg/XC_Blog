package cn.xiaozhigang.blog.util;

import org.springframework.util.DigestUtils;

public class Md5Utils {
    public static String getMd5(String str) {
        String slat = "JI,dfes*43!fqez@fow,#l0sa8xdby-3?>9jq<";
        String base = str + "/" + slat;
        return DigestUtils.md5DigestAsHex(base.getBytes());
    }
}
