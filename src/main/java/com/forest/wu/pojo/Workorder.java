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

    private Integer sCity;

    private String sAddress;

    private Integer sPoint;

    private String gName;

    private String gTel;

    private Integer gCity;

    private String gAddress;

    private Integer gPoint;

    private Integer productType;

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
    private Date inStorageTime;//入库时间
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date outStorageTime;//出库时间
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    private Date finishedTime;

    private Integer productLocation;

    //审核结果id
    private Integer auditStatus;

    private Integer invalidatedState;

    //委托状态id
    private Integer entrust;

    //委托快递员编号
    private Integer entrustNumber;

    //是否已支付
    private Integer isPay;

    //入库状态id
    private Integer inStorageStatus;

    //出库状态id
    private Integer outStorageStatus;

    //入库状态名称
    private String inStorageStatusName;

    //出库状态名称
    private String outStorageStatusName;

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

    //寄件人城市名称
    private String sCityName;

    //收件人城市名称
    private String gCityName;

    //寄件网点名称
    private String sPointName;

    //收件网点名称
    private String gPointName;

    //支付状态名称
    private String isPayName;

    //货物类型名称
    private String productTypeName;

    public String getIsPayName() {
        return isPayName;
    }

    public void setIsPayName(String isPayName) {
        this.isPayName = isPayName;
    }

    public String getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        this.productTypeName = productTypeName;
    }

    public String getsCityName() {
        return sCityName;
    }

    public void setsCityName(String sCityName) {
        this.sCityName = sCityName;
    }

    public String getgCityName() {
        return gCityName;
    }

    public void setgCityName(String gCityName) {
        this.gCityName = gCityName;
    }

    public String getsPointName() {
        return sPointName;
    }

    public void setsPointName(String sPointName) {
        this.sPointName = sPointName;
    }

    public String getgPointName() {
        return gPointName;
    }

    public void setgPointName(String gPointName) {
        this.gPointName = gPointName;
    }

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

    public Integer getsCity() {
        return sCity;
    }

    public void setsCity(Integer sCity) {
        this.sCity = sCity;
    }

    public String getsAddress() {
        return sAddress;
    }

    public void setsAddress(String sAddress) {
        this.sAddress = sAddress == null ? null : sAddress.trim();
    }

    public Integer getsPoint() {
        return sPoint;
    }

    public void setsPoint(Integer sPoint) {
        this.sPoint = sPoint;
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

    public Integer getgCity() {
        return gCity;
    }

    public void setgCity(Integer gCity) {
        this.gCity = gCity;
    }

    public String getgAddress() {
        return gAddress;
    }

    public void setgAddress(String gAddress) {
        this.gAddress = gAddress == null ? null : gAddress.trim();
    }

    public Integer getgPoint() {
        return gPoint;
    }

    public void setgPoint(Integer gPoint) {
        this.gPoint = gPoint;
    }

    public Integer getProductType() {
        return productType;
    }

    public void setProductType(Integer productType) {
        this.productType = productType;
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

    public Date getInStorageTime() {
        return inStorageTime;
    }

    public void setInStorageTime(Date inStorageTime) {
        this.inStorageTime = inStorageTime;
    }

    public Date getOutStorageTime() {
        return outStorageTime;
    }

    public void setOutStorageTime(Date outStorageTime) {
        this.outStorageTime = outStorageTime;
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

    public Integer getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(Integer auditStatus) {
        this.auditStatus = auditStatus;
    }

    public Integer getEntrustNumber() {
        return entrustNumber;
    }

    public void setEntrustNumber(Integer entrustNumber) {
        this.entrustNumber = entrustNumber;
    }

    public Integer getIsPay() {
        return isPay;
    }

    public void setIsPay(Integer isPay) {
        this.isPay = isPay;
    }

    public Integer getInStorageStatus() {
        return inStorageStatus;
    }

    public void setInStorageStatus(Integer inStorageStatus) {
        this.inStorageStatus = inStorageStatus;
    }

    public Integer getOutStorageStatus() {
        return outStorageStatus;
    }

    public void setOutStorageStatus(Integer outStorageStatus) {
        this.outStorageStatus = outStorageStatus;
    }

    public String getInStorageStatusName() {
        return inStorageStatusName;
    }

    public void setInStorageStatusName(String inStorageStatusName) {
        this.inStorageStatusName = inStorageStatusName;
    }

    public String getOutStorageStatusName() {
        return outStorageStatusName;
    }

    public void setOutStorageStatusName(String outStorageStatusName) {
        this.outStorageStatusName = outStorageStatusName;
    }
}