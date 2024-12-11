package com.kh.paikbooker.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class AvgRatingVO {
    private String storeName;       // 음식점 이름
    private Double averageRating;   // 평균 평점
}