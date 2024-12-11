package com.kh.paikbooker.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor // 매개변수가 전부 다 있는 생성자
@NoArgsConstructor // 매개변수가 없는 생성자 (기본 생성자)
@ToString

public class MenuVO {

    private int menuNo;
    private String brandName;
    private String menuName;
    private String menuImg;

}
