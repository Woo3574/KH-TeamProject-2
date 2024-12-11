package com.kh.paikbooker.dao;

import com.kh.paikbooker.vo.MenuVO;
import com.kh.paikbooker.vo.ReservationVO;
import com.kh.paikbooker.vo.ReviewVO;
import com.kh.paikbooker.vo.StoreVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public class StoreDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 예약) query
    private static final String SELECT_ALL_STORES = "SELECT * FROM STORE_TB ORDER BY STORE_NAME ASC";
    private static final String SELECT_STORE_BY_STORE_NO = "SELECT * FROM STORE_TB WHERE STORE_NO = ?";
    private static final String SELECT_RESERVED_TIMES = "SELECT R_TIME FROM RESERVATION_TB WHERE STORE_NO = ?";
    private static final String REFER_STOREINFO = "SELECT STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME, BRAND_LOGO1, BRAND_LOGO2, BRAND_MARKER FROM STORE_TB WHERE STORE_NO = ?";
    private static final String INSERT_RESERVATIONS = """
            INSERT INTO RESERVATION_TB 
            (R_NO, R_TIME, R_PERSON_CNT, R_SUBMIT_TIME, USER_ID, USER_NAME, STORE_NO, STORE_NAME, STORE_PHONE, BRAND_NAME)
            SELECT R_NO_SEQ.NEXTVAL, ?, ?, SYSDATE, ?, U.USER_NAME, ?, S.STORE_NAME, S.STORE_PHONE, S.BRAND_NAME
            FROM USER_TB U, STORE_TB S WHERE U.USER_ID = ? AND S.STORE_NO = ?
        """;

    private static final String SELECT_ADDR_AND_BRAND_BY_STORE_NO = "SELECT STORE_ADDR, BRAND_NAME, BRAND_MARKER FROM STORE_TB WHERE STORE_NO = ?";
    private static final String SELECT_STORE_HOURS = "SELECT BRAND_OPEN, BRAND_CLOSE FROM STORE_TB WHERE STORE_NO = ?";
    private static final String SELECT_MENU_IMG = "SELECT M.MENU_IMG, M.MENU_NAME FROM STORE_TB S JOIN MENU_TB M ON S.BRAND_NAME = M.BRAND_NAME WHERE S.STORE_NO = ?";
    private static final String SELECT_RATING_RESULT = "SELECT RV_PRICE, RV_TASTE, RV_VIBE, RV_KIND FROM REVIEW_TB R JOIN STORE_TB S ON R.STORE_NAME = S.STORE_NAME WHERE S.STORE_NO = ?";

    // 조회) 전체 매장 조회
    public List<StoreVO> getAllStores() {
        return jdbcTemplate.query(SELECT_ALL_STORES, new BeanPropertyRowMapper<>(StoreVO.class));
    }

    // 조회) 특정 매장 조회
    public StoreVO getStoreByStoreNo(int storeNo) {
        return jdbcTemplate.queryForObject(SELECT_STORE_BY_STORE_NO, new Object[]{storeNo}, new BeanPropertyRowMapper<>(StoreVO.class));
    }

    // 조회) 메뉴 이미지 받아오기
    public List<Map<String, Object>> getMenuImg(int storeNo) {
        return jdbcTemplate.query(SELECT_MENU_IMG, new Object[]{storeNo}, (rs, rowNum) -> {
            Map<String, Object> result = new HashMap<>();

            MenuVO menuVO = new MenuVO();
            menuVO.setMenuName(rs.getString("MENU_NAME"));
            menuVO.setMenuImg(rs.getString("MENU_IMG"));
            result.put("menu", menuVO);
            return result;
        });
    }


    // 예약) 예약된 시간 리스트 반환
    public List<String> getReservedTimes(int storeNo) {
        return jdbcTemplate.queryForList(SELECT_RESERVED_TIMES, new Object[]{storeNo}, String.class);
    }

    // 예약) 영업시간 반환
    public Map<String, String> getStoreHours(int storeNo) {
        return jdbcTemplate.queryForObject(
                SELECT_STORE_HOURS,
                new Object[]{storeNo},
                (rs, rowNum) -> {
                    Map<String, String> storeHours = new HashMap<>();
                    storeHours.put("brandOpen", rs.getString("BRAND_OPEN"));
                    storeHours.put("brandClose", rs.getString("BRAND_CLOSE"));
                    return storeHours;
                }
        );
    }

    // 예약) 영업시간을 기준으로 1시간 단위의 시간 리스트 생성
    public List<String> generateAvailableTimes(String brandOpen, String brandClose) {
        List<String> availableTimes = new ArrayList<>();
        int openTime = Integer.parseInt(brandOpen); // 영업 시작 시간 (24시간 형식)
        int closeTime = Integer.parseInt(brandClose); // 영업 종료 시간 (24시간 형식)

        for (int hour = openTime; hour < closeTime; hour++) {
            String time = String.format("%02d", hour); // 두 자리 문자열 형식
            availableTimes.add(time);
        }
        return availableTimes;
    }

    // 예약) 새로운 예약 생성
    public void addReservation(ReservationVO reservationVO, int storeNo) {
        jdbcTemplate.update(INSERT_RESERVATIONS,
                reservationVO.getRTime(), // R_TIME
                reservationVO.getRPersonCnt(), // R_PERSON_CNT
                reservationVO.getUserId(), // USER_ID
                reservationVO.getStoreNo(), // STORE_NO
                reservationVO.getUserId(), // USER_ID (WHERE)
                reservationVO.getStoreNo()); // STORE_NO (WHERE)
    };

    // 지도) 매장 주소로 지도 위치 설정
    public StoreVO getAddrAndBrandByStoreNo(int storeNo) {
        return jdbcTemplate.queryForObject(SELECT_ADDR_AND_BRAND_BY_STORE_NO, new Object[]{storeNo}, new BeanPropertyRowMapper<>(StoreVO.class));
    }

    // 별점) STORE_NO로 REVIEW_TB에서 각 별점 가져오기
    public List<ReviewVO> getRatingResults(int storeNo) {
        try {
            return jdbcTemplate.query(SELECT_RATING_RESULT, new Object[]{storeNo}, new BeanPropertyRowMapper<>(ReviewVO.class));
        } catch (EmptyResultDataAccessException e) {
            return null;  // 리뷰가 없을 경우 null 반환
        }
    }



}

