package com.forest.wu.pojo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
//返货单
public class Return extends BaseRowModel {

    @ExcelProperty(value = "返货单号",index = 0)
    private String id;
    @ExcelProperty(value = "相关工单单号",index = 1)
    private String gid;
    @ExcelProperty(value = "申请员工工号",index = 2)
    private String yid;
    @ExcelProperty(value = "返货原因",index = 3)
    private String result;
    @ExcelProperty(value = "创建时间",index = 4)
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date ctreaTime;
    @ExcelProperty(value = "收件人姓名",index = 5)
    private String gName;
    @ExcelProperty(value = "收件人电话",index = 6)
    private String gPhone;
    @ExcelProperty(value = "收件人城市",index = 7)
    private String gCity;
    @ExcelProperty(value = "收件人网点",index = 8)
    private String gPoint;
    @ExcelProperty(value = "收件人详细地址",index = 9)
    private String gAddress;
    @ExcelProperty(value = "寄件人姓名",index = 10)
    private String sName;
    @ExcelProperty(value = "寄件人电话",index = 11)
    private String sPhone;
    @ExcelProperty(value = "寄件人城市",index = 12)
    private String sCity;
    @ExcelProperty(value = "寄件人网点",index = 13)
    private String sPoint;
    @ExcelProperty(value = "寄件人地址",index = 14)
    private String sAddress;
    @ExcelProperty(value = "审核时间",index = 15)
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date auditTime;
    @ExcelProperty(value = "审核状态",index = 0)
    private Integer status;
    @ExcelProperty(value = "备注",index = 0)
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