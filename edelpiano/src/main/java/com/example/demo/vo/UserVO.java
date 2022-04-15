package com.example.demo.vo;


import org.springframework.stereotype.Component;


@Component

public class UserVO 

{

private String uid;

private String pwd;


public UserVO() {}

public UserVO(String uid, String pwd) {

this.setUid(uid);

this.setPwd(pwd);

}

public String getUid() {

return uid;

}

public void setUid(String uid) {

this.uid = uid;

}

public String getPwd() {

return pwd;

}

public void setPwd(String pwd) {

this.pwd = pwd;

}

}