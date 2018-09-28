package com.forest.wu.pojo;

import java.util.Date;

public class Repertory {
    private Long storeId;

    private Long packageId;

    private String getUnit;

    private String sendUnit;

    private Date intoTime;

    private Date outTime;

    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public Long getPackageId() {
        return packageId;
    }

    public void setPackageId(Long packageId) {
        this.packageId = packageId;
    }

    public String getGetUnit() {
        return getUnit;
    }

    public void setGetUnit(String getUnit) {
        this.getUnit = getUnit == null ? null : getUnit.trim();
    }

    public String getSendUnit() {
        return sendUnit;
    }

    public void setSendUnit(String sendUnit) {
        this.sendUnit = sendUnit == null ? null : sendUnit.trim();
    }

    public Date getIntoTime() {
        return intoTime;
    }

    public void setIntoTime(Date intoTime) {
        this.intoTime = intoTime;
    }

    public Date getOutTime() {
        return outTime;
    }

    public void setOutTime(Date outTime) {
        this.outTime = outTime;
    }
}