package com.forest.wu.pojo;

import java.util.Date;

public class Product_into {
    private Long receiptId;

    private String sendUnit;

    private String getUnit;

    private Date into_time;

    private Long productNum;

    private Long packageId;

    private Double packageWeight;

    private Integer into_status;

    public Long getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(Long receiptId) {
        this.receiptId = receiptId;
    }

    public String getSendUnit() {
        return sendUnit;
    }

    public void setSendUnit(String sendUnit) {
        this.sendUnit = sendUnit == null ? null : sendUnit.trim();
    }

    public String getGetUnit() {
        return getUnit;
    }

    public void setGetUnit(String getUnit) {
        this.getUnit = getUnit == null ? null : getUnit.trim();
    }

    public Date getInto_time() {
        return into_time;
    }

    public void setInto_time(Date into_time) {
        this.into_time = into_time;
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

    public Integer getInto_status() {
        return into_status;
    }

    public void setInto_status(Integer into_status) {
        this.into_status = into_status;
    }
}