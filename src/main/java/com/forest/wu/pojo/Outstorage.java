package com.forest.wu.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Outstorage {
    private Integer outId;

    private Integer sendUnit;

    private Integer getUnit;

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date out_time;

    private Integer productNum;

    private Integer workorderId;

    private Integer packageId;

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

    public Integer getWorkorderId() {
        return workorderId;
    }

    public Integer getStorageId() {
        return storageId;
    }

    public void setStorageId(Integer storageId) {
        this.storageId = storageId;
    }

    public void setWorkorderId(Integer workorderId) {
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

    public Integer getOutId() {
        return outId;
    }

    public void setOutId(Integer outId) {
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

    public Date getOut_time() {
        return out_time;
    }

    public void setOut_time(Date out_time) {
        this.out_time = out_time;
    }

    public Integer getProductNum() {
        return productNum;
    }

    public void setProductNum(Integer productNum) {
        this.productNum = productNum;
    }

    public Integer getPackageId() {
        return packageId;
    }

    public void setPackageId(Integer packageId) {
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