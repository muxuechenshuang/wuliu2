package com.forest.wu.pojo;

import com.alibaba.excel.annotation.ExcelProperty;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
//返货单
public class Return {
    private String id;

    private String gid;

    private String yid;

    private String result;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date ctreaTime;

    private String gName;

    private String gPhone;

    private String gCity;

    private String gPoint;

    private String gAddress;

    private String sName;

    private String sPhone;

    private String sCity;

    private String sPoint;

    private String sAddress;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date auditTime;

    private Integer status;

    private String comment;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid == null ? null : gid.trim();
    }

    public String getYid() {
        return yid;
    }

    public void setYid(String yid) {
        this.yid = yid == null ? null : yid.trim();
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

    public Date getCtreaTime() {
        return ctreaTime;
    }

    public void setCtreaTime(Date ctreaTime) {
        this.ctreaTime = ctreaTime;
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName == null ? null : gName.trim();
    }

    public String getgPhone() {
        return gPhone;
    }

    public void setgPhone(String gPhone) {
        this.gPhone = gPhone == null ? null : gPhone.trim();
    }

    public String getgCity() {
        return gCity;
    }

    public void setgCity(String gCity) {
        this.gCity = gCity == null ? null : gCity.trim();
    }

    public String getgPoint() {
        return gPoint;
    }

    public void setgPoint(String gPoint) {
        this.gPoint = gPoint == null ? null : gPoint.trim();
    }

    public String getgAddress() {
        return gAddress;
    }

    public void setgAddress(String gAddress) {
        this.gAddress = gAddress == null ? null : gAddress.trim();
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getsPhone() {
        return sPhone;
    }

    public void setsPhone(String sPhone) {
        this.sPhone = sPhone == null ? null : sPhone.trim();
    }

    public String getsCity() {
        return sCity;
    }

    public void setsCity(String sCity) {
        this.sCity = sCity == null ? null : sCity.trim();
    }

    public String getsPoint() {
        return sPoint;
    }

    public void setsPoint(String sPoint) {
        this.sPoint = sPoint == null ? null : sPoint.trim();
    }

    public String getsAddress() {
        return sAddress;
    }

    public void setsAddress(String sAddress) {
        this.sAddress = sAddress == null ? null : sAddress.trim();
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }
}