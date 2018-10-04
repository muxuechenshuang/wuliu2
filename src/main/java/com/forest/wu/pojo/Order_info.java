package com.forest.wu.pojo;

import java.util.Date;

public class Order_info {
    private Integer id;

    private String sName;

    private String gName;

    private String sTel;

    private String gTel;

    private String gAddress;

    private String sAddress;

    private String product;

    private Double preWeight;

    private String comment;

    private String orderNumber;

    private Integer status;

    private String preVolume;

    private Date riseTime;

    private Date finishTime;

    private String reasonForCancle;

    private Long userId;

    private String entrust;

    private Integer courierNumber;



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

    public String getgAddress() {
        return gAddress;
    }

    public void setgAddress(String gAddress) {
        this.gAddress = gAddress == null ? null : gAddress.trim();
    }

    public String getsAddress() {
        return sAddress;
    }

    public void setsAddress(String sAddress) {
        this.sAddress = sAddress == null ? null : sAddress.trim();
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

    public String getEntrust() {
        return entrust;
    }

    public void setEntrust(String entrust) {
        this.entrust = entrust == null ? null : entrust.trim();
    }

    public Integer getCourierNumber() {
        return courierNumber;
    }

    public void setCourierNumber(Integer courierNumber) {
        this.courierNumber = courierNumber;
    }
}