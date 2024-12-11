package com.kh.paikbooker.dao;

import com.kh.paikbooker.vo.ReservationVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
@Repository
@RequiredArgsConstructor
@Slf4j
public class ReservationDAO {
    private final JdbcTemplate jdbcTemplate;
    // 예약 전체 불러오기
//    private static final String RESERVATION_QUERY = "SELECT * FROM RESERVATION_TB";
    private static final String RESERVATION_QUERY =
            "SELECT r.*, " +
                    "       CASE WHEN EXISTS (SELECT 1 FROM REVIEW_TB rv WHERE rv.r_no = r.r_no) THEN 1 ELSE 0 END AS has_review " +
                    "FROM RESERVATION_TB r";

    // 예약 목록 조회
    public List<ReservationVO> reservationList() {
        try {
            return jdbcTemplate.query(RESERVATION_QUERY, new ReservationRowMapper());
        } catch (DataAccessException e) {
            log.error("리뷰 목록 조회 중 예외 발생", e);
            throw e;
        }
    }

    private static class ReservationRowMapper implements RowMapper<ReservationVO> {
        @Override
        public ReservationVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new ReservationVO(
                    rs.getInt("r_no"),
                    rs.getString("r_time"),
                    rs.getInt("r_person_cnt"),
                    rs.getDate("r_submit_time"),
                    rs.getString("user_id"),
                    rs.getString("user_name"),
                    rs.getInt("store_no"),
                    rs.getString("store_name"),
                    rs.getString("store_phone"),
                    rs.getString("brand_name"),
                    rs.getInt("has_review") == 1 // hasReview 매핑
            );
        }
    }
}