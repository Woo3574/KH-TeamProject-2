package com.kh.paikbooker.controller;

import com.kh.paikbooker.dao.StoreDAO;
//import com.kh.paikbooker.service.StoreService;
import com.kh.paikbooker.vo.MenuVO;
import com.kh.paikbooker.vo.ReservationVO;
import com.kh.paikbooker.vo.ReviewVO;
import com.kh.paikbooker.vo.StoreVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/stores")
@CrossOrigin(origins = "http://localhost:3000")
@RequiredArgsConstructor
public class StoreController {

//    private final StoreService storeService;

    @Autowired
    private StoreDAO storeDAO;

    // 조회) 전체 매장 조회
    @GetMapping
    public List<StoreVO> getAllStores() {
        return storeDAO.getAllStores();
    }

    // 조회) 특정 매장 조회
    @GetMapping("/{storeNo}")
    public StoreVO getStoreByStoreNo(@PathVariable int storeNo) {
        return storeDAO.getStoreByStoreNo(storeNo);
    }

    // 조회) 메뉴 이미지 받아오기
    @GetMapping("/{storeNo}/menus")
    public List<Map<String, Object>> getMenuImg(@PathVariable int storeNo) {
        return storeDAO.getMenuImg(storeNo);
    }
    // 예약) 예약 가능 및 예약 불가능 시간 조회
    @GetMapping("/{storeNo}/times")
    public Map<String, List<String>> getAllTimes(@PathVariable int storeNo) {
        System.out.println("storeNo: " + storeNo); // storeNo 출력 (디버깅용)
        // StoreVO 객체 가져오기
        StoreVO storeVO = storeDAO.getStoreByStoreNo(storeNo);
        if (storeVO != null) {
            System.out.println("Store found: " + storeVO.getStoreName()); // StoreVO가 존재하는 경우, Store 이름 출력
        } else {
            System.out.println("Store not found for storeNo: " + storeNo); // StoreVO가 null인 경우
        }
        // 전체 영업 시간 생성
        List<String> allTimes = storeDAO.generateAvailableTimes(storeVO.getBrandOpen(), storeVO.getBrandClose());
        System.out.println("All times: " + allTimes); // 생성된 전체 시간 출력
        // 예약된 시간 조회
        List<String> reservedTimes = storeDAO.getReservedTimes(storeNo);
        System.out.println("Reserved times: " + reservedTimes); // 예약된 시간 출력
        // 예약 가능 시간 계산
        List<String> availableTimes = new ArrayList<>(allTimes);
        availableTimes.removeAll(reservedTimes);
        System.out.println("Available times: " + availableTimes); // 예약 가능 시간 출력
        // 결과를 Map으로 반환
        Map<String, List<String>> response = new HashMap<>();
        response.put("availableTimes", availableTimes);
        response.put("reservedTimes", reservedTimes);
        return response;
    }


    // 예약) 새로운 예약 생성
    @PostMapping("/{storeNo}/reservations")
    public ResponseEntity<?> addReservation(
            @RequestBody Map<String, Object> submitData) {
            ReservationVO reservationVO = new ReservationVO();
        try {
            reservationVO.setRTime((String) submitData.get("rTime"));
            reservationVO.setRPersonCnt((Integer) submitData.get("rPersonCnt"));
            String userId = "testid01"; // 임시
            reservationVO.setUserId(userId);
            reservationVO.setStoreNo((Integer) submitData.get("storeNo"));

            // DAO addReservation 메소드 호출
            storeDAO.addReservation(reservationVO, reservationVO.getStoreNo());

            System.out.println("try 예약 정보: " + reservationVO.toString());
            return ResponseEntity.ok("예약 성공");
        } catch (Exception e) {
            e.printStackTrace(); // 예외 로그 출력
            System.out.println("catch 예약 정보: " + reservationVO.toString());
            return ResponseEntity.badRequest().body("예약 실패 : " + e.getMessage());
        }

    }

    // 지도) 매장 주소로 지도 위치 설정
    @GetMapping("/{storeNo}/map")
    public StoreVO getAddrAndBrandByStoreNo(@PathVariable int storeNo) {
        return storeDAO.getAddrAndBrandByStoreNo(storeNo);
    }

    // 별점) STORE_NO로 REVIEW_TB에서 각 별점 가져오기
    @GetMapping("/{storeNo}/rating")
    public List<ReviewVO> getRatingResults(@PathVariable int storeNo) {
        return storeDAO.getRatingResults(storeNo);
    }


}
