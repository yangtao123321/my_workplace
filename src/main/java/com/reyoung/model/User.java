package com.reyoung.model;

/**
 * Created by yangtao on 2019-12-27.
 */
public class User {

    private Integer uid;

    private String username;

    private String password;

    private String truename;

    private Position position;

    private Department department;

    private String signaturepath;

    private String email;

    private Section section;

    private String savefalg;

    public User() {
    }

    public User(Integer uid, String username, String password, String truename, Position position, Department department, String signaturepath, String email, Section section, String savefalg) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.truename = truename;
        this.position = position;
        this.department = department;
        this.signaturepath = signaturepath;
        this.email = email;
        this.section = section;
        this.savefalg = savefalg;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getSignaturepath() {
        return signaturepath;
    }

    public void setSignaturepath(String signaturepath) {
        this.signaturepath = signaturepath;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSavefalg() {
        return savefalg;
    }

    public void setSavefalg(String savefalg) {
        this.savefalg = savefalg;
    }

    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", truename='" + truename + '\'' +
                ", position=" + position +
                ", department=" + department +
                ", signaturepath='" + signaturepath + '\'' +
                ", email='" + email + '\'' +
                ", section=" + section +
                ", savefalg='" + savefalg + '\'' +
                '}';
    }

}
