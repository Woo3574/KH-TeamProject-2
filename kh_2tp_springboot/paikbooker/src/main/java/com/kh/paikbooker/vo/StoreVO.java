package com.kh.paikbooker.vo;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor // 매개변수가 전부 다 있는 생성자
@NoArgsConstructor // 매개변수가 없는 생성자 (기본 생성자)
@ToString

public class StoreVO {

    private int storeNo;
    private String storeName;
    private String storePhone;
    private String storeAddr;
    private String storeMap;
    private String brandName;
    private String brandOpen;
    private String brandClose;
    private String brandLogo1;
    private String brandLogo2;
    private String brandMarker;
    private String brandImg1;
    private String brandImg2;

    private BrandVO brandVO;   // BrandVO 객체를 추가
    private ReviewVO reviewVO; // ReviewVO 객체를 추가
    private ReservationVO reservationTimeVO; // ReservationTimeVO 객체를 추가
    private AvgRatingVO avgRatingVO; // AvgRatingVO 객체를 추가

}
