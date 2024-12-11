package com.kh.paikbooker.controller;

import com.kh.paikbooker.dao.UserDAO;
import com.kh.paikbooker.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final UserDAO userDao;

    // 로그인
    @PostMapping("/login")
    public ResponseEntity<Boolean> login(@RequestBody UserVO vo) {
        log.error("아이디 : {} ", vo.getUserId());
        log.error("패스워드 : {}", vo.getUserPw());
        boolean inSuccess = userDao.login(vo.getUserId(), vo.getUserPw());
        return ResponseEntity.ok(inSuccess);
    }
    // 회원 가입

    // 아이디 중복 체크
    @GetMapping("/idCheck/{userId}")
    public ResponseEntity<Boolean> idCheck(@PathVariable String userId) {
        log.info("아이디 중복 확인 요청: {}", userId);
        boolean idCheck = userDao.idCheck(userId);
        return ResponseEntity.ok(!idCheck); // 중복일 경우 false 반환
    }


    // 회원 가입
    @PostMapping("/signup")
    public ResponseEntity<Boolean> signup(@RequestBody UserVO vo) {
        log.error("member : {}", vo);
        boolean isSuccess = userDao.signup(vo);
        return ResponseEntity.ok(isSuccess);
    }


    // 가입 여부 확인
    @GetMapping("/exists/{email}")
    public ResponseEntity<Boolean> exists(@PathVariable String email) {
        log.error("email : {}", email);
        boolean isExist = userDao.isEmailExist(email);
        return ResponseEntity.ok(!isExist);
    }


//    // 회원 정보 조회
//    @GetMapping("/{id}")
//    public ResponseEntity<MemberVo> getMemberInfo(@PathVariable String id) {
//        log.info("회원 정보 조회 요청: {}", id);
//        MemberVo member = memberDao.findMemberById(id);
//        return ResponseEntity.ok(member);
//    }

    // 회원 정보 수정
//    @PutMapping("/{email}")
//    public ResponseEntity<Boolean> updateMember(@PathVariable String email, @RequestBody MemberVo vo) {
//        log.info("회원 정보 수정 요청: email={}, 변경 데이터={}", email, vo);
//        boolean updateSuccess = memberDao.updateMember(email, vo);
//        return ResponseEntity.ok(updateSuccess);
//    }

    // 회원 삭제
//    @DeleteMapping("/{email}")
//    public ResponseEntity<Boolean> deleteMember(@PathVariable String email) {
//        log.info("회원 삭제 요청: email={}", email);
//        boolean deleteSuccess = memberDao.deleteMember(email);
//        return ResponseEntity.ok(deleteSuccess);
//    }
}
