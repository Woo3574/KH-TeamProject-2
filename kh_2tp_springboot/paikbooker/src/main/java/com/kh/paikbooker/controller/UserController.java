package com.kh.paikbooker.controller;

import com.kh.paikbooker.dao.UserDAO;
import com.kh.paikbooker.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@Slf4j
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/member")
@RequiredArgsConstructor
public class UserController {

    private final UserDAO userDao;


//    @GetMapping("/getMemberInfo/{user_id}")
//    public ResponseEntity<UserVo> getMemberInfo(@PathVariable String user_id) {
//        UserVo user = userDao.getMemberInfo(user_id);
//        if (member == null) {
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
//        }
//        return ResponseEntity.ok(member);
//    }

    // 회원 정보 조회
    @GetMapping("/getMemberInfo/{userId}")
    public ResponseEntity<UserVO> getMemberInfo(@PathVariable("userId") String userId) {
        try {
            UserVO member = userDao.getMemberInfo(userId);
            if (member != null) {
                return ResponseEntity.ok(member);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            }
        } catch (Exception e) {
            log.error("회원 정보 조회 중 에러 발생", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }


    // 회원 정보 수정
    @PatchMapping("/{userId}")
    public ResponseEntity<String> updateMember(@PathVariable("userId") String userId,
                                               @RequestBody Map<String, Object> updatedFields) {
        try {
            boolean isUpdated = userDao.updateMember(userId, updatedFields);
            if (isUpdated) {
                return ResponseEntity.ok("회원 정보가 성공적으로 수정되었습니다.");
            } else {
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                        .body("회원 정보 수정에 실패했습니다.");
            }
        } catch (Exception e) {
            log.error("회원 정보 수정 중 에러 발생Controller", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("서버 에러: 회원 정보를 수정할 수 없습니다.");
        }
    }


    // 회원 삭제
    @DeleteMapping("/{userId}")
    public ResponseEntity<Boolean> deleteMember(@PathVariable String user_id) {
        boolean isSuccess = userDao.deleteMember(user_id);
        return ResponseEntity.ok(isSuccess);
    }



//    // 로그인한 회원 정보 조회
//    @GetMapping("/logged-in")
//    public ResponseEntity<MemberVo> getLoggedInMember(@RequestParam String user_id) {
//        MemberVo member = memberDao.findLoggedInMember(user_id);
//        if (member != null) {
//            return ResponseEntity.ok(member);
//        } else {
//            return ResponseEntity.status(404).build();
//        }
//    }

//


}
