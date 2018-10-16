package com.forest.wu.pojo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


public class Order_info extends BaseRowModel {
    private Integer id;
    //value是excel表中的列名，index=0就是第一列
    @ExcelProperty(value = {"表头1"},index = 0)
    private String sName;
    @ExcelProperty(value = {"表头2"},index = 1)
    private String gName;
    @ExcelProperty(value = {"表头3"},index = 2)
    private String sTel;
    @ExcelProperty(value = {"表头4"},index = 3)
    private String gTel;
    @ExcelProperty(value = {"表头5"},index = 4)
    private Integer cityId;
    @ExcelProperty(value = {"表头6"},index = 5)
    private Integer branchId;
    @ExcelProperty(value = {"表头7"},index = 6)
    private String sAddress;
    @ExcelProperty(value = {"表头8"},index = 7)
    private String gAddress;
    private String usernamekuai;//分配的快递员名字

    public String getUsernamekuai() {
        return usernamekuai;
    }

    public void setUsernamekuai(String usernamekuai) {
        this.usernamekuai = usernamekuai;
    }

    private  String username;//委托的快递员名字

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    private Integer typeId;

    //任一    货物类型名字
    private String typeName;


    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date doorTime;
    @ExcelProperty(value = {"表头9"},index = 8)
    private String doorTimename;//用于excel表时间类型转换而创建

    public String getDoorTimename() {
        return doorTimename;
    }

    public void setDoorTimename(String doorTimename) {
        this.doorTimename = doorTimename;
    }

    public String getRiseTimename() {
        return riseTimename;
    }

    public void setRiseTimename(String riseTimename) {
        this.riseTimename = riseTimename;
    }


    private String product;

    private Double preWeight;

    private String comment;

    @ExcelProperty(value = {"表头10"},index = 9)
    private String orderNumber;

    private Integer status;

    private String preVolume;



    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date riseTime;

    @ExcelProperty(value = {"表头11"},index = 10)
    private String  riseTimename;//用于excel表时间类型转换而创建


    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date finishTime;


    private String reasonForCancle;

    private Long userId;

    private Integer entrust;

    private Integer courierNumber;

    private Integer entrustNumber;

    //肖林辉  存放网点名称字段
    private String pointName;

    //任一    订单状态名
    private String statusName;

    //任一    是否付费
    private String isPay;

    //任一    运费
    private double expenses;

    //任一    货物所在位置
    private Integer productLocation;

    //任一    寄件网点名称
    private String sBranchName;

    //任一    寄件分公司名称
    private String sCityName;

    //任一    收件网点名称
    private String gBranchName;

    //任一    收件分公司网点名称
    private String gCityName;


    public String getsBranchName() {
        return sBranchName;
    }

    public void setsBranchName(String sBranchName) {
        this.sBranchName = sBranchName;
    }

    public String getsCityName() {
        return sCityName;
    }

    public void setsCityName(String sCityName) {
        this.sCityName = sCityName;
    }

    public String getgBranchName() {
        return gBranchName;
    }

    public void setgBranchName(String gBranchName) {
        this.gBranchName = gBranchName;
    }

    public String getgCityName() {
        return gCityName;
    }

    public void setgCityName(String gCityName) {
        this.gCityName = gCityName;
    }

    public Integer getProductLocation() {
        return productLocation;
    }

    public void setProductLocation(Integer productLocation) {
        this.productLocation = productLocation;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public double getExpenses() {
        return expenses;
    }

    public void setExpenses(double expenses) {
        this.expenses = expenses;
    }

    public String getIsPay() {
        return isPay;
    }

    public void setIsPay(String isPay) {
        this.isPay = isPay;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getPointName() {
        return pointName;
    }

    public void setPointName(String pointName) {
        this.pointName = pointName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName == null ? null : gName.trim();
    }

    public String getsTel() {
        return sTel;
    }

    public void setsTel(String sTel) {
        this.sTel = sTel == null ? null : sTel.trim();
    }

    public String getgTel() {
        return gTel;
    }

    public void setgTel(String gTel) {
        this.gTel = gTel == null ? null : gTel.trim();
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public Integer getBranchId() {
        return branchId;
    }

    public void setBranchId(Integer branchId) {
        this.branchId = branchId;
    }

    public String getsAddress() {
        return sAddress;
    }

    public void setsAddress(String sAddress) {
        this.sAddress = sAddress == null ? null : sAddress.trim();
    }

    public String getgAddress() {
        return gAddress;
    }

    public void setgAddress(String gAddress) {
        this.gAddress = gAddress == null ? null : gAddress.trim();
    }

    public Date getDoorTime() {
        return doorTime;
    }

    public void setDoorTime(Date doorTime) {
        this.doorTime = doorTime;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product == null ? null : product.trim();
    }

    public Double getPreWeight() {
        return preWeight;
    }

    public void setPreWeight(Double preWeight) {
        this.preWeight = preWeight;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber == null ? null : orderNumber.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getPreVolume() {
        return preVolume;
    }

    public void setPreVolume(String preVolume) {
        this.preVolume = preVolume == null ? null : preVolume.trim();
    }

    public Date getRiseTime() {
        return riseTime;
    }

    public void setRiseTime(Date riseTime) {
        this.riseTime = riseTime;
    }

    public Date getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Date finishTime) {
        this.finishTime = finishTime;
    }

    public String getReasonForCancle() {
        return reasonForCancle;
    }

    public void setReasonForCancle(String reasonForCancle) {
        this.reasonForCancle = reasonForCancle == null ? null : reasonForCancle.trim();
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getEntrust() {
        return entrust;
    }

    public void setEntrust(Integer entrust) {
        this.entrust = entrust;
    }

    public Integer getCourierNumber() {
        return courierNumber;
    }

    public void setCourierNumber(Integer courierNumber) {
        this.courierNumber = courierNumber;
    }

    public Integer getEntrustNumber() {
        return entrustNumber;
    }

    public void setEntrustNumber(Integer entrustNumber) {
        this.entrustNumber = entrustNumber;
    }


    public void setCityId(int cityId) {
        this.cityId = cityId;
    }


    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }


    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }


}