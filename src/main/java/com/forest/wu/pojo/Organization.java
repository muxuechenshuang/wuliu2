package com.forest.wu.pojo;
/**
* @author: 李家和
* @Description 添加注释
* @Date: 10:56 2018/9/29
* @Param：
* @return：
**/
public class Organization {
    private Integer id;//组织id

    private String name;//组织名称

    private Integer parentId;//所属上级id

    private Integer type;//组织类型id

    private String phone;//电话

    private String site;//地址

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    private String city;//城市


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site == null ? null : site.trim();
    }
}