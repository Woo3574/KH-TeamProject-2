package com.kh.paikbooker.dao;

import com.kh.paikbooker.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
@Slf4j
public class UserDAO {

    private final JdbcTemplate jdbcTemplate;

    // SQL Queries
    private static final String CHECK_EMAIL = "SELECT COUNT(*) FROM USER_TB WHERE USER_MAIL = ?";
    private static final String LOGIN_QUERY = "SELECT COUNT(*) FROM USER_TB WHERE USER_ID = ? AND USER_PW = ?";
    private static final String SIGNUP_QUERY = "INSERT INTO USER_TB (USER_NO,USER_NAME, USER_ID, USER_PW, USER_MAIL, USER_BIRTH, USER_PHONE, USER_IMG) VALUES (USER_NO_SEQ.NEXTVAL,?, ?, ?, ?, ?, ?, ?)";
    private static final String CHECK_ID = "SELECT COUNT(*) FROM USER_TB WHERE USER_ID = ?'";
    private static final String SELECT_INFO = "SELECT * FROM USER_TB WHERE USER_ID = ?";
    private static final String DELETE_MEMBER = "DELETE FROM USER_TB WHERE USER_MAIL = ?";
    private static final String UPDATE_MEMBER = "UPDATE USER_TB SET USER_NAME = ?, USER_PW = ?, USER_PHONE = ? WHERE USER_MAIL = ?";
    private static final String SELECT_ALL_MEMBERS = "SELECT * FROM USER_TB";

    // 로그인
    public boolean login(String userId, String userPw) {
        try {
            int count = jdbcTemplate.queryForObject(LOGIN_QUERY, new Object[]{userId, userPw}, Integer.class);
            return count > 0;
        } catch (DataAccessException e) {
            log.error("로그인 조회 실패", e);
            return false;
        }
    }



    // 회원 가입
    public boolean signup(UserVO vo) {
        try {
            int result = jdbcTemplate.update(SIGNUP_QUERY, vo.getUserName(), vo.getUserId(), vo.getUserPw(), vo.getUserMail(), vo.getUserBirth(), vo.getUserPhone(), vo.getUserImg());
            return result > 0;
        } catch (DataAccessException e) {
            log.error("회원 가입 중 예외 발생", e);
            return false;
        }
    }



    // 회원 아이디 중복 검사
    public boolean idCheck(String userId) {
        try {
            int count = jdbcTemplate.queryForObject(CHECK_ID, new Object[]{userId}, Integer.class);
            return count > 0;
        } catch (DataAccessException e) {
            log.error("아이디 중복 확인 중 에러 발생", e);
            return false;
        }
    }

//    public MemberVo getMemberInfo(String user_id) {
//        try {
//            List<MemberVo> members = jdbcTemplate.query(SELECT_INFO, new Object[]{user_id}, new MemberRowMapper());
//            return members.isEmpty() ? null : members.get(0);
//        } catch (DataAccessException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }

    public UserVO getMemberInfo(String userId) {
        try {
            List<UserVO> members = jdbcTemplate.query(SELECT_INFO, new Object[]{userId}, new MemberRowMapper());
            return members.isEmpty() ? null : members.get(0);
        } catch (DataAccessException e) {
            log.error("회원 정보 조회 중 에러 발생", e);
            return null;
        }
    }


    // 회원 정보 수정



    public boolean updateMember(String userId, Map<String, Object> updatedFields) {
        StringBuilder queryBuilder = new StringBuilder("UPDATE USER_TB SET ");
        List<Object> params = new ArrayList<>();

        updatedFields.forEach((key, value) -> {
            queryBuilder.append(key).append(" = ?, ");
            params.add(value);
        });

        queryBuilder.setLength(queryBuilder.length() - 2); // 마지막 쉼표 제거
        queryBuilder.append(" WHERE USER_ID = ?");
        params.add(userId);

        try {
            int rowsAffected = jdbcTemplate.update(queryBuilder.toString(), params.toArray());
            return rowsAffected > 0;
        } catch (DataAccessException e) {
            log.error("회원 정보 수정 중 에러 발생DAO", e);
            return false;
        }
    }





    // 회원 삭제
    public boolean deleteMember(String userMail) {
        try {
            int rowsAffected = jdbcTemplate.update(DELETE_MEMBER, userMail);
            return rowsAffected > 0;
        } catch (DataAccessException e) {
            log.error("회원 삭제 중 에러 발생", e);
            return false;
        }
    }

    public boolean isEmailExist(String Email) {
        try {
            int count = jdbcTemplate.queryForObject(CHECK_EMAIL, new Object[]{Email}, Integer.class);
            return count > 0;
        } catch (DataAccessException e) {
            log.error("이메일 존재 여부 확인 중 에러 ", e);
            return false;
        }
    }

    // RowMapper (MemberVo 객체 생성)



//    private static class MemberRowMapper implements RowMapper<MemberVo> {
//        @Override
////        public MemberVo mapRow(ResultSet rs, int rowNum) throws SQLException {
////            return new MemberVo(
////                    rs.getString("user_name"),
////                    null, // user_id
////                    null, // user_pw
////                    null, // user_mail
////                    null, // user_birth
////                    null, // user_phone
////                    rs.getString("user_img")
////            );
////        }

    private static class MemberRowMapper implements RowMapper<UserVO> {
        @Override
        public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
            return new UserVO(
                    rs.getInt("user_no"),
                    rs.getString("user_id"),
                    rs.getString("user_pw"),
                    rs.getString("user_name"),
                    rs.getString("user_mail"),
                    rs.getDate("user_birth"),
                    rs.getString("user_phone"),
                    rs.getString("user_img")
            );
        }
    }


}