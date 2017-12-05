package cn.xiaozhigang.blog.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class User {
    private Integer id;

    private String userName;

    private String password;

    private String lastIp;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Timestamp lastVisitTime;

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", lastIp='" + lastIp + '\'' +
                ", lastVisitTime=" + lastVisitTime +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastIp() {
        return lastIp;
    }

    public void setLastIp(String lastIp) {
        this.lastIp = lastIp;
    }

    public Timestamp getLastVisitTime() {
        return lastVisitTime;
    }

    public void setLastVisitTime(Timestamp lastVisitTime) {
        this.lastVisitTime = lastVisitTime;
    }
}
