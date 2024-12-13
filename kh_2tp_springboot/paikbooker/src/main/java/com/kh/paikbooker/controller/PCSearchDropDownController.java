package com.kh.paikbooker.controller;

import com.kh.paikbooker.service.PCSearchService;
import com.kh.paikbooker.vo.StoreVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController // HTTP 요청(예: GET, POST, PUT, DELETE)을 처리하는 메서드를 작성할 수 있다.
// 메서드의 반환값이 기본적으로 JSON 형태로 직렬화됩니다.
@Slf4j //  Lombok 라이브러리에서 제공하는 어노테이션으로,
// 로깅(logging)을 쉽게 사용할 수 있도록 자동으로 로거(Logger) 객체를 생성해주는 기능을 제공.
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/stores") //  RESTful API 설계에서 클라이언트 요청의 URL과 컨트롤러의 처리 메서드를 연결하는 역할
@RequiredArgsConstructor // fial 또는 @NonNull 필드만 초기화하는 생성자를 자동 생성.
public class PCSearchDropDownController {
    private final PCSearchService PCSearchService;

    // 매장 검색 API
    @GetMapping("/search") // HTTP GET 메서드는 일반적으로 데이터를 조회하는 데 사용
    public ResponseEntity<List<StoreVO>> searchStores(
            // @RequestParam //HTTP 요청의 쿼리 파라미터를 메서드 매개변수로 매핑합니다.
            // 예: /search?=Seouregionl&brandName=Starbucks 요청 시 region은 "Seoul", brandName은 "Starbucks"가 됩니다.
            @RequestParam(required = false) String region,
            // **required = false**를 지정하면 파라미터가 선택적이 되며,
            // 요청에 해당 파라미터가 포함되지 않더라도 에러가 발생하지 않도록 처리됩니다.
            @RequestParam(required = false) String brandName,
            @RequestParam(required = false) String reservationTime) {

        // 디버깅용
        log.error("검색 조건 - 지역: {}, 브랜드명: {}, 예약시간: {}", region, brandName, reservationTime);

        // StoreDao를 사용하여 조건에 맞는 매장 리스트를 조회
        List<StoreVO> storeList = PCSearchService.searchData(region, brandName, reservationTime);
        log.info("검색된 매장 목록: {}", storeList);
        return ResponseEntity.ok(storeList); // 매장 리스트 반환
    }

    // 카테고리 목록을 반환하는 API
    @GetMapping("/categories")
    public ResponseEntity<Map<String, List<String>>> getCategories() {
        Map<String, List<String>> categories = PCSearchService.getCategories();
        return ResponseEntity.ok(categories);
    }
}
