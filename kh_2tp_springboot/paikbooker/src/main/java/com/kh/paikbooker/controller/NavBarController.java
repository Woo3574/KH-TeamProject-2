package com.kh.paikbooker.controller;

import com.kh.paikbooker.dao.NavBarDAO;
import com.kh.paikbooker.vo.BrandVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/navbar")
@CrossOrigin(origins = "http://localhost:3000")
@RequiredArgsConstructor
public class NavBarController {

    @Autowired
    private NavBarDAO navBarDAO;

    // 조회) 전체 브랜드 로고 조회
    @GetMapping
    public List<BrandVO> getBrandLogos() {
        return navBarDAO.getBrandLogos();
    }


}
