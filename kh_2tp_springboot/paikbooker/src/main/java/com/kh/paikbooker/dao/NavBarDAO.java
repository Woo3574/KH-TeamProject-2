package com.kh.paikbooker.dao;

import com.kh.paikbooker.vo.BrandVO;
import com.kh.paikbooker.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class NavBarDAO {


    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final String SELECT_BRAND_LOGO1 = "SELECT BRAND_NAME, BRAND_NO, BRAND_LOGO1 FROM BRAND_TB";

    // 조회) 전체 브랜드 로고 조회
    public List<BrandVO> getBrandLogos() {
        return jdbcTemplate.query(SELECT_BRAND_LOGO1, new BeanPropertyRowMapper<>(BrandVO.class));
    }

}
