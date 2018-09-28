package com.forest.wu.pojo;

public class Cargo {
    private Long id;

    private String cargoId;

    private Integer cargoType;

    private Integer cargoVolume;

    private Integer cargoWeight;

    private String gid;

    private String packageId;

    private Integer into_status;

    private Integer out_status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCargoId() {
        return cargoId;
    }

    public void setCargoId(String cargoId) {
        this.cargoId = cargoId == null ? null : cargoId.trim();
    }

    public Integer getCargoType() {
        return cargoType;
    }

    public void setCargoType(Integer cargoType) {
        this.cargoType = cargoType;
    }

    public Integer getCargoVolume() {
        return cargoVolume;
    }

    public void setCargoVolume(Integer cargoVolume) {
        this.cargoVolume = cargoVolume;
    }

    public Integer getCargoWeight() {
        return cargoWeight;
    }

    public void setCargoWeight(Integer cargoWeight) {
        this.cargoWeight = cargoWeight;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid == null ? null : gid.trim();
    }

    public String getPackageId() {
        return packageId;
    }

    public void setPackageId(String packageId) {
        this.packageId = packageId == null ? null : packageId.trim();
    }

    public Integer getInto_status() {
        return into_status;
    }

    public void setInto_status(Integer into_status) {
        this.into_status = into_status;
    }

    public Integer getOut_status() {
        return out_status;
    }

    public void setOut_status(Integer out_status) {
        this.out_status = out_status;
    }
}