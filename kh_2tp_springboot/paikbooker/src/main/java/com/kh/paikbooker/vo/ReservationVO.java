package com.kh.paikbooker.vo;

import lombok.*;

import java.util.Date;

/*@Getter
@Setter*/
@AllArgsConstructor // 매개변수가 전부 다 있는 생성자
@NoArgsConstructor // 매개변수가 없는 생성자 (기본 생성자)
@ToString

public class ReservationVO {

    private int rNo;
    private String rTime;
    private int rPersonCnt;
    private Date rSubmitTime;
    private String userId;
    private String userName;
    private int storeNo;
    private String storeName;
    private String storePhone;
    private String brandName;
    private boolean hasReview; // 리뷰 존재 여부 추가

    public int getRNo() {
        return rNo;
    }

    public void setRNo(int rNo) {
        this.rNo = rNo;
    }

    public String getRTime() {
        return rTime;
    }

    public void setRTime(String rTime) {
        this.rTime = rTime;
    }

    public int getRPersonCnt() {
        return rPersonCnt;
    }

    public void setRPersonCnt(int rPersonCnt) {
        this.rPersonCnt = rPersonCnt;
    }

    public Date getRSubmitTime() {
        return rSubmitTime;
    }

    public void setRSubmitTime(Date rSubmitTime) {
        this.rSubmitTime = rSubmitTime;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getStoreNo() {
        return storeNo;
    }

    public void setStoreNo(int storeNo) {
        this.storeNo = storeNo;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getStorePhone() {
        return storePhone;
    }

    public void setStorePhone(String storePhone) {
        this.storePhone = storePhone;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public boolean isHasReview() {
        return hasReview;
    }

    public void setHasReview(boolean hasReview) {
        this.hasReview = hasReview;
    }
}
