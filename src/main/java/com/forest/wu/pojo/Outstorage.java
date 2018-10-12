package com.forest.wu.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Outstorage {
    private Long outId;

    private Integer sendUnit;

    private Integer getUnit;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date outStorageTime;

    private Long productNum;

    private String workorderId;

    private Long packageId;

    private Double packageWeight;

    private Integer outStorageStatus;

    //仓库id(分公司id)
    private Integer storageId;

    //发货单位名称
    private String sendUnitName;

    //收货单位名称
    private String getUnitName;

    //出库状态名称
    private String outStorageStatusName;

    //分公司名称
    private String storageIdName;

    public Date getOutStorageTime() {
        return outStorageTime;
    }

    public void setOutStorageTime(Date outStorageTime) {
        this.outStorageTime = outStorageTime;
    }

    public String getStorageIdName() {
        return storageIdName;
    }

    public void setStorageIdName(String storageIdName) {
        this.storageIdName = storageIdName;
    }

    public String getWorkorderId() {
        return workorderId;
    }

    public Integer getStorageId() {
        return storageId;
    }

    public void setStorageId(Integer storageId) {
        this.storageId = storageId;
    }

    public void setWorkorderId(String workorderId) {
        this.workorderId = workorderId;
    }

    public String getSendUnitName() {
        return sendUnitName;
    }

    public void setSendUnitName(String sendUnitName) {
        this.sendUnitName = sendUnitName;
    }

    public String getGetUnitName() {
        return getUnitName;
    }

    public void setGetUnitName(String getUnitName) {
        this.getUnitName = getUnitName;
    }

    public String getOutStorageStatusName() {
        return outStorageStatusName;
    }

    public void setOutStorageStatusName(String outStorageStatusName) {
        this.outStorageStatusName = outStorageStatusName;
    }

    public Long getOutId() {
        return outId;
    }

    public void setOutId(Long outId) {
        this.outId = outId;
    }

    public Integer getSendUnit() {
        return sendUnit;
    }

    public void setSendUnit(Integer sendUnit) {
        this.sendUnit = sendUnit;
    }

    public Integer getGetUnit() {
        return getUnit;
    }

    public void setGetUnit(Integer getUnit) {
        this.getUnit = getUnit;
    }

    public Date getoutStorageTime() {
        return outStorageTime;
    }

    public void setoutStorageTime(Date outStorageTime) {
        this.outStorageTime = outStorageTime;
    }

    public Long getProductNum() {
        return productNum;
    }

    public void setProductNum(Long productNum) {
        this.productNum = productNum;
    }

    public Long getPackageId() {
        return packageId;
    }

    public void setPackageId(Long packageId) {
        this.packageId = packageId;
    }

    public Double getPackageWeight() {
        return packageWeight;
    }

    public void setPackageWeight(Double packageWeight) {
        this.packageWeight = packageWeight;
    }

    public Integer getOutStorageStatus() {
        return outStorageStatus;
    }

    public void setOutStorageStatus(Integer outStorageStatus) {
        this.outStorageStatus = outStorageStatus;
    }
}