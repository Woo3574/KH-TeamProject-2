package com.kh.paikbooker.dao;

import com.kh.paikbooker.vo.ReviewVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.List;
@Repository
@RequiredArgsConstructor
@Slf4j
public class ReviewDAO {
    private final JdbcTemplate jdbcTemplate;
    // 리뷰 전체 불러오기
    private static final String REVIEW_QUERY = "SELECT * FROM REVIEW_TB";
    // 리뷰 추가
    private static final String REVIEW_INSERT =
            "INSERT INTO REVIEW_TB (rv_no, user_id, rv_date, store_name, r_time, r_submit_time, r_no, rv_price, rv_taste, rv_vibe, rv_kind, rv_content) "
                    + "VALUES (RV_NO_SEQ.NEXTVAL, ?, SYSDATE, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    // 리뷰 수정
    private static final String REVIEW_UPDATE = "UPDATE REVIEW_TB SET rv_price = ?, rv_taste = ?, rv_vibe = ?, rv_kind = ?, rv_content = ? WHERE rv_no = ?";
    // 리뷰 삭제
    private static final String REVIEW_DELETE = "DELETE FROM REVIEW_TB WHERE rv_no = ?";
    // RESERVATION_TB에서 r_submit_time 찾기
    private static final String R_SUBMIT_TIME_FIND_QUERY = "SELECT r_submit_time FROM RESERVATION_TB WHERE user_id = ? AND store_name = ? AND r_time = ?";
    // RESERVATION_TB에서 r_no 찾기
    private static final String R_NO_FIND_QUERY = "SELECT r_no FROM RESERVATION_TB WHERE user_id = ? AND store_name = ? AND r_time = ?";
    // REVIEW_TB에서 rv_no 찾기
    private static final String RV_NO_FIND_QUERY = "SELECT rv_no FROM REVIEW_TB WHERE user_id = ? AND store_name = ? AND r_time = ?";
    // REVIEW_TB에서 r_no 찾기
    private static final String REVIEW_COUNT_QUERY = "SELECT COUNT(*) FROM REVIEW_TB WHERE r_no = ?";


    // 리뷰 목록 조회
    public List<ReviewVO> reviewList() {
        try {
            return jdbcTemplate.query(REVIEW_QUERY, new ReviewRowMapper());
        } catch (DataAccessException e) {
            log.error("리뷰 목록 조회 중 예외 발생", e);
            throw e;
        }
    }
    // 리뷰 추가
    public boolean insertReview(ReviewVO vo) {
        try {
            // r_no 찾기
            Integer rNo = getReservationRNo(vo.getUserId(), vo.getStoreName(), vo.getRTime());
            if (rNo == null) {
                log.error("예약 번호를 찾을 수 없습니다. 리뷰 추가를 실패합니다.");
                return false; // 예약 번호가 없으면 리뷰를 추가할 수 없습니다.
            }
            // r_submit_time 찾기
            Date rSubmitTime = getReservationRSubmitTime(vo.getUserId(), vo.getStoreName(), vo.getRTime());
            if (rSubmitTime == null) {
                log.error("예약일 찾을 수 없습니다. 리뷰 추가를 실패합니다.");
                return false; // 예약일이 없으면 리뷰를 추가할 수 없습니다.
            }

            int rowsAffected = jdbcTemplate.update(
                    REVIEW_INSERT,
                    vo.getUserId(),
                    vo.getStoreName(),
                    vo.getRTime(),
                    rSubmitTime,
                    rNo,
                    vo.getRvPrice(),
                    vo.getRvTaste(),
                    vo.getRvVibe(),
                    vo.getRvKind(),
                    vo.getRvContent()
            );
            return rowsAffected > 0;
        } catch (DataAccessException e) {
            log.error("리뷰 추가 중 예외 발생", e);
            throw e;
        }
    }
    // 리뷰 수정
    public boolean updateReview(ReviewVO vo) {
        try {
            Integer rvNo = getReviewRvNo(vo.getUserId(), vo.getStoreName(), vo.getRTime());
            if (rvNo == null) {
                log.error("리뷰 번호를 찾을 수 없습니다. 리뷰 수정을 실패합니다.");
                return false; // 리뷰 번호가 없으면 리뷰를 수정할 수 없습니다.
            }
            int rowsAffected = jdbcTemplate.update(
                    REVIEW_UPDATE,
                    vo.getRvPrice(),
                    vo.getRvTaste(),
                    vo.getRvVibe(),
                    vo.getRvKind(),
                    vo.getRvContent(),
                    rvNo
            );
            return rowsAffected > 0;
        } catch (DataAccessException e) {
            log.error("리뷰 수정 중 예외 발생", e);
            throw e;
        }
    }
    // 리뷰 삭제
    public boolean deleteReview(int rvNo) {
        try {
            int rowsAffected = jdbcTemplate.update(REVIEW_DELETE, rvNo);
            return rowsAffected > 0;
        } catch (DataAccessException e) {
            log.error("리뷰 삭제 중 예외 발생", e);
            throw e;
        }
    }
    // 예약일 조회
    public Date getReservationRSubmitTime(String userId, String storeName, String rTime) {
        try {
            return jdbcTemplate.queryForObject(R_SUBMIT_TIME_FIND_QUERY, Date.class, userId, storeName, rTime);
        } catch (DataAccessException e) {
            log.error("예약일 조회 중 예외 발생", e);
            return null;
        }
    }
    // 예약 번호 조회
    public Integer getReservationRNo(String userId, String storeName, String rTime) {
        try {
            return jdbcTemplate.queryForObject(R_NO_FIND_QUERY, Integer.class, userId, storeName, rTime);
        } catch (EmptyResultDataAccessException e) {
            log.error("예약 번호를 찾을 수 없습니다. userId: {}, storeName: {}, rTime: {}", userId, storeName, rTime);
            return null; // 데이터가 없을 경우 null 반환
        } catch (DataAccessException e) {
            log.error("예약 번호 조회 중 예외 발생", e);
            throw e;
        }
    }

    // 리뷰 번호 조회
    public Integer getReviewRvNo(String userId, String storeName, String rTime) {
        try {
            return jdbcTemplate.queryForObject(RV_NO_FIND_QUERY, Integer.class, userId, storeName, rTime);
        } catch (EmptyResultDataAccessException e) {
//            log.error("리뷰 번호 조회 중 예외 발생", e);
            log.error("리뷰 번호를 찾을 수 없습니다. userId: {}, storeName: {}, rTime: {}", userId, storeName, rTime);
            return null; // 데이터가 없을 경우 null 반환
        } catch (DataAccessException e) {
            log.error("리뷰 번호 조회 중 예외 발생", e);
            throw e;
        }
    }

    private static class ReviewRowMapper implements RowMapper<ReviewVO> {
        @Override
        public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new ReviewVO(
                    rs.getInt("rv_no"),
                    rs.getDate("rv_date"),
                    rs.getInt("r_no"),
                    rs.getString("r_time"),
                    rs.getDate("r_submit_time"),
                    rs.getString("user_id"),
                    rs.getString("store_name"),
                    rs.getBigDecimal("rv_price"),
                    rs.getBigDecimal("rv_taste"),
                    rs.getBigDecimal("rv_vibe"),
                    rs.getBigDecimal("rv_kind"),
                    rs.getString("rv_content")
            );
        }
    }
}