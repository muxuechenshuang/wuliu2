package com.forest.wu.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Instorage {
    //入库交接单号
    private Long receiptId;

    //发货单位（寄的网点）
    private Integer sendUnit;

    //收货单位（收的网点）
    private Integer getUnit;

    //入库时间
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date inStorageTime;

    private Long productNum;

    private Long packageId;

    private String workorderId;

    //仓库id(分公司id)
    private Integer storageId;

    //合包重量
    private Double packageWeight;

    //入库状态
    private Integer inStorageStatus;

    //发货单位名称
    private String sendUnitName;

    //收货单位名称
    private String getUnitName;

    //入库状态名称
    private String inStorageStatusName;

    //分公司名称
    private String storageIdName;

    public String getStorageIdName() {
        return storageIdName;
    }

    public void setStorageIdName(String storageIdName) {
        this.storageIdName = storageIdName;
    }

    public Integer getStorageId() {
        return storageId;
    }

    public void setStorageId(Integer storageId) {
        this.storageId = storageId;
    }

    public String getWorkorderId() {
        return workorderId;
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

    public String getInStorageStatusName() {
        return inStorageStatusName;
    }

    public void setInStorageStatusName(String inStorageStatusName) {
        this.inStorageStatusName = inStorageStatusName;
    }

    public Long getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(Long receiptId) {
        this.receiptId = receiptId;
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

    public Date getInStorageTime() {
        return inStorageTime;
    }

    public void setInStorageTime(Date inStorageTime) {
        this.inStorageTime = inStorageTime;
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

    public Integer getInStorageStatus() {
        return inStorageStatus;
    }

    public void setInStorageStatus(Integer inStorageStatus) {
        this.inStorageStatus = inStorageStatus;
    }
}