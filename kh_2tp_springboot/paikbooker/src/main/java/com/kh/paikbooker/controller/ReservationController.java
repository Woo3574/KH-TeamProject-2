package com.kh.paikbooker.controller;

import com.kh.paikbooker.dao.ReservationDAO;
import com.kh.paikbooker.vo.ReservationVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Slf4j
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/reservation")
@RequiredArgsConstructor
public class ReservationController {
    private final ReservationDAO reservationDao;
    // 예약 목록 보기
    @GetMapping
    public ResponseEntity<List<ReservationVO>> reservationList() {
        List<ReservationVO> reservationlist = reservationDao.reservationList();
        if (reservationlist.isEmpty()) {
            log.error("예약 목록이 없습니다.");
            return ResponseEntity.noContent().build();
        } else {
            log.info("예약 목록 조회 성공");
            return ResponseEntity.ok(reservationlist);
        }
    }
}