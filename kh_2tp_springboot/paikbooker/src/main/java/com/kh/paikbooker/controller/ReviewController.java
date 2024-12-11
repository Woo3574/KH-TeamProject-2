package com.kh.paikbooker.controller;

import com.kh.paikbooker.dao.ReviewDAO;
import com.kh.paikbooker.vo.ReviewVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Slf4j
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/auth")
@RequiredArgsConstructor
public class ReviewController {
    private final ReviewDAO reviewDao;
    // 리뷰 목록 보기
    @GetMapping
    public ResponseEntity<List<ReviewVO>> reviewList() {
        List<ReviewVO> reviewlist = reviewDao.reviewList();
        if (reviewlist.isEmpty()) {
            log.error("리뷰 목록이 없습니다.");
            return ResponseEntity.noContent().build();
        } else {
            log.info("리뷰 목록 조회 성공");
            return ResponseEntity.ok(reviewlist);
        }
    }
    // 리뷰 추가
    @PostMapping("/add")
    public ResponseEntity<Boolean> insertReview(@RequestBody ReviewVO vo) {
//        log.info("리뷰 : {}", vo);
        System.out.println("받은 리뷰 데이터: " + vo);
        boolean isSuccess = reviewDao.insertReview(vo);
        return ResponseEntity.ok(isSuccess);
    }
    // 리뷰 수정
    @PostMapping("/edit")
    public ResponseEntity<Boolean> updateReview(@RequestBody ReviewVO vo) {
//        log.info("작성자 ID : {}", vo);
        System.out.println("받은 리뷰 수정 데이터: " + vo);
        boolean isSuccess = reviewDao.updateReview(vo);
        return ResponseEntity.ok(isSuccess);
    }
    // 리뷰 삭제
    @DeleteMapping("/delete/{rvNo}")
    public ResponseEntity<Boolean> deleteReview(@PathVariable int rvNo) {
        log.error("리뷰 삭제 : {}", rvNo);
        boolean isSuccess = reviewDao.deleteReview(rvNo);
        return ResponseEntity.ok(isSuccess);
    }
}
