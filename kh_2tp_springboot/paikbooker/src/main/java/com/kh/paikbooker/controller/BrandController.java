package com.kh.paikbooker.controller;


import com.kh.paikbooker.service.PCSearchService;
import com.kh.paikbooker.vo.StoreVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController // HTTP 요청(예: GET, POST, PUT, DELETE)을 처리하는 메서드를 작성할 수 있다.
// 메서드의 반환값이 기본적으로 JSON 형태로 직렬화됩니다.
@Slf4j //  Lombok 라이브러리에서 제공하는 어노테이션으로,
// 로깅(logging)을 쉽게 사용할 수 있도록 자동으로 로거(Logger) 객체를 생성해주는 기능을 제공.
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/brand")
@RequiredArgsConstructor // final 또는 @NonNull 필드만 초기화하는 생성자를 자동 생성.
public class BrandController {
    private final PCSearchService PCSearchService;

    // 매장 검색 API
    @GetMapping("/{brandNo}") // brandNo를 URL 경로에서 받아옴
    public ResponseEntity<List<StoreVO>> searchStores(@PathVariable int brandNo) {
        // 브랜드 번호에 해당하는 매장 리스트를 조회
        List<StoreVO> brandStores = PCSearchService.getStoresByBrandNo(brandNo);  // brandNo를 사용하여 매장 정보 필터링
        log.info("검색된 매장 목록: {}", brandStores);  // 매장 목록 로그 출력
        return ResponseEntity.ok(brandStores); // 매장 리스트 반환
    }
}

