package com.forest.wu.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Workorder {
    private Integer id;

    private String orderNum;

    private String workNum;

    private Long packageId;

    private Long productNum;

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

    private Double realWeight;

    private Integer workStatus;

    private String comment;

    private Double expenses;

    private Integer gCourier;

    private Integer sCourier;

    private Double preVolume;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date riseTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date firInStorage;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date firOutStorage;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date secInStorage;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date secOutStorage;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date finishedTime;

    private Integer productLocation;

    private Integer auditStatus;

    private Integer invalidatedState;

    //委托状态
    private Integer entrust;

    //出入库状态id
    private Integer storageStatus;

    //出入库状态名称
    private String storageStatusName;

    //工单状态名称
    private String workStatusName;

    //网点名称（用于分公司根据网点名称查询该网点的工单）
    private String wdName;

    //物件所在位置名称
    private String productLocationName;

    //审核结果名称
    private String auditStatusName;

    //失效状态名称
    private String invalidatedStateName;

    //委托状态名称
    private String entrustName;

    public String getWdName() {
        return wdName;
    }

    public void setWdName(String wdName) {
        this.wdName = wdName;
    }

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

    public Long getPackageId() {
        return packageId;
    }

    public void setPackageId(Long packageId) {
        this.packageId = packageId;
    }

    public Long getProductNum() {
        return productNum;
    }

    public void setProductNum(Long productNum) {
        this.productNum = productNum;
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

    public Double getRealWeight() {
        return realWeight;
    }

    public void setRealWeight(Double realWeight) {
        this.realWeight = realWeight;
    }

    public Integer getWorkStatus() {
        return workStatus;
    }

    public void setWorkStatus(Integer workStatus) {
        this.workStatus = workStatus;
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

    public Integer getgCourier() {
        return gCourier;
    }

    public void setgCourier(Integer gCourier) {
        this.gCourier = gCourier;
    }

    public Integer getsCourier() {
        return sCourier;
    }

    public void setsCourier(Integer sCourier) {
        this.sCourier = sCourier;
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

    public Integer getProductLocation() {
        return productLocation;
    }

    public void setProductLocation(Integer productLocation) {
        this.productLocation = productLocation;
    }

    public Integer getResult() {
        return auditStatus;
    }

    public void setResult(Integer auditStatus) {
        this.auditStatus = auditStatus;
    }

    public Integer getInvalidatedState() {
        return invalidatedState;
    }

    public void setInvalidatedState(Integer invalidatedState) {
        this.invalidatedState = invalidatedState;
    }

    public Integer getStorageStatus() {
        return storageStatus;
    }

    public void setStorageStatus(Integer storageStatus) {
        this.storageStatus = storageStatus;
    }

    public String getStorageStatusName() {
        return storageStatusName;
    }

    public void setStorageStatusName(String storageStatusName) {
        this.storageStatusName = storageStatusName;
    }

    public String getWorkStatusName() {
        return workStatusName;
    }

    public void setWorkStatusName(String workStatusName) {
        this.workStatusName = workStatusName;
    }

    public Integer getEntrust() {
        return entrust;
    }

    public void setEntrust(Integer entrust) {
        this.entrust = entrust;
    }

    public String getProductLocationName() {
        return productLocationName;
    }

    public void setProductLocationName(String productLocationName) {
        this.productLocationName = productLocationName;
    }

    public String getAuditStatusName() {
        return auditStatusName;
    }

    public void setAuditStatusName(String auditStatusName) {
        this.auditStatusName = auditStatusName;
    }

    public String getInvalidatedStateName() {
        return invalidatedStateName;
    }

    public void setInvalidatedStateName(String invalidatedStateName) {
        this.invalidatedStateName = invalidatedStateName;
    }

    public String getEntrustName() {
        return entrustName;
    }

    public void setEntrustName(String entrustName) {
        this.entrustName = entrustName;
    }
}