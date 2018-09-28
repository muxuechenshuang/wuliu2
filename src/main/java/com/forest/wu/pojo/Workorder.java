package com.forest.wu.pojo;

import java.util.Date;

public class Workorder {
    private Integer id;

    private String orderNum;

    private String workNum;

    private String packageId;

    private String productNum;

    private String sName;

    private String sTel;

    private String sCity;

    private String sAddress;

    private String sPoint;

    private String gName;

    private String gTel;

    private String gCity;

    private String gAddress;

    private String gPoint;

    private String productType;

    private String realWeight;

    private String workStatus;

    private String comment;

    private Double expenses;

    private String gCourier;

    private String sCourier;

    private Double preVolume;

    private Date riseTime;

    private Date firInStorage;

    private Date firOutStorage;

    private Date secInStorage;

    private Date secOutStorage;

    private Date finishedTime;

    private String productLocation;

    private String result;

    private String invalidatedState;

    private String storageStatus;

    private String entrust;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum == null ? null : orderNum.trim();
    }

    public String getWorkNum() {
        return workNum;
    }

    public void setWorkNum(String workNum) {
        this.workNum = workNum == null ? null : workNum.trim();
    }

    public String getPackageId() {
        return packageId;
    }

    public void setPackageId(String packageId) {
        this.packageId = packageId == null ? null : packageId.trim();
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum == null ? null : productNum.trim();
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getsTel() {
        return sTel;
    }

    public void setsTel(String sTel) {
        this.sTel = sTel == null ? null : sTel.trim();
    }

    public String getsCity() {
        return sCity;
    }

    public void setsCity(String sCity) {
        this.sCity = sCity == null ? null : sCity.trim();
    }

    public String getsAddress() {
        return sAddress;
    }

    public void setsAddress(String sAddress) {
        this.sAddress = sAddress == null ? null : sAddress.trim();
    }

    public String getsPoint() {
        return sPoint;
    }

    public void setsPoint(String sPoint) {
        this.sPoint = sPoint == null ? null : sPoint.trim();
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName == null ? null : gName.trim();
    }

    public String getgTel() {
        return gTel;
    }

    public void setgTel(String gTel) {
        this.gTel = gTel == null ? null : gTel.trim();
    }

    public String getgCity() {
        return gCity;
    }

    public void setgCity(String gCity) {
        this.gCity = gCity == null ? null : gCity.trim();
    }

    public String getgAddress() {
        return gAddress;
    }

    public void setgAddress(String gAddress) {
        this.gAddress = gAddress == null ? null : gAddress.trim();
    }

    public String getgPoint() {
        return gPoint;
    }

    public void setgPoint(String gPoint) {
        this.gPoint = gPoint == null ? null : gPoint.trim();
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType == null ? null : productType.trim();
    }

    public String getRealWeight() {
        return realWeight;
    }

    public void setRealWeight(String realWeight) {
        this.realWeight = realWeight == null ? null : realWeight.trim();
    }

    public String getWorkStatus() {
        return workStatus;
    }

    public void setWorkStatus(String workStatus) {
        this.workStatus = workStatus == null ? null : workStatus.trim();
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Double getExpenses() {
        return expenses;
    }

    public void setExpenses(Double expenses) {
        this.expenses = expenses;
    }

    public String getgCourier() {
        return gCourier;
    }

    public void setgCourier(String gCourier) {
        this.gCourier = gCourier == null ? null : gCourier.trim();
    }

    public String getsCourier() {
        return sCourier;
    }

    public void setsCourier(String sCourier) {
        this.sCourier = sCourier == null ? null : sCourier.trim();
    }

    public Double getPreVolume() {
        return preVolume;
    }

    public void setPreVolume(Double preVolume) {
        this.preVolume = preVolume;
    }

    public Date getRiseTime() {
        return riseTime;
    }

    public void setRiseTime(Date riseTime) {
        this.riseTime = riseTime;
    }

    public Date getFirInStorage() {
        return firInStorage;
    }

    public void setFirInStorage(Date firInStorage) {
        this.firInStorage = firInStorage;
    }

    public Date getFirOutStorage() {
        return firOutStorage;
    }

    public void setFirOutStorage(Date firOutStorage) {
        this.firOutStorage = firOutStorage;
    }

    public Date getSecInStorage() {
        return secInStorage;
    }

    public void setSecInStorage(Date secInStorage) {
        this.secInStorage = secInStorage;
    }

    public Date getSecOutStorage() {
        return secOutStorage;
    }

    public void setSecOutStorage(Date secOutStorage) {
        this.secOutStorage = secOutStorage;
    }

    public Date getFinishedTime() {
        return finishedTime;
    }

    public void setFinishedTime(Date finishedTime) {
        this.finishedTime = finishedTime;
    }

    public String getProductLocation() {
        return productLocation;
    }

    public void setProductLocation(String productLocation) {
        this.productLocation = productLocation == null ? null : productLocation.trim();
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result == null ? null : result.trim();
    }

    public String getInvalidatedState() {
        return invalidatedState;
    }

    public void setInvalidatedState(String invalidatedState) {
        this.invalidatedState = invalidatedState == null ? null : invalidatedState.trim();
    }

    public String getStorageStatus() {
        return storageStatus;
    }

    public void setStorageStatus(String storageStatus) {
        this.storageStatus = storageStatus == null ? null : storageStatus.trim();
    }

    public String getEntrust() {
        return entrust;
    }

    public void setEntrust(String entrust) {
        this.entrust = entrust == null ? null : entrust.trim();
    }
}