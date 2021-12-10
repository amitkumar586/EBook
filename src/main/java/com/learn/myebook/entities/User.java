package com.learn.myebook.entities;

import java.security.Timestamp;

public class User 
{
    private int uid;

    private String name;

    private String email;

    private String phone;

    private String password;

    private String address;
        
    private String usertype;
    
    private String userpic;
    

    public User() 
    {

    }

    public User(String name, String email, String phone, String password, String address, String usertype , String userpic) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.address = address;
        this.usertype = usertype;
        this.userpic = userpic;
    }

    public User(int uid, String name, String email, String phone, String password, String address, String usertype ,String userpic) {
        this.uid = uid;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.address = address;
        this.usertype = usertype;
        this.userpic = userpic;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getUserpic() {
        return userpic;
    }

    public void setUserpic(String userpic) {
        this.userpic = userpic;
    }

    @Override
    public String toString() {
        return "User{" + "uid=" + uid + ", name=" + name + ", email=" + email + ", phone=" + phone + ", password=" + password + ", address=" + address + ", usertype=" + usertype + ", userpic=" + userpic + '}';
    }

    
    
}
