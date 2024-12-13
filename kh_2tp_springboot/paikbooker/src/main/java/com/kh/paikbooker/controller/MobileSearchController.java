package com.kh.paikbooker.controller;


import com.kh.paikbooker.service.SearchService;
import com.kh.paikbooker.vo.StoreVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController // HTTP 요청(예: GET, POST, PUT, DELETE)을 처리하는 메서드를 작성할 수 있다.
// 메서드의 반환값이 기본적으로 JSON 형태로 직렬화됩니다.
@Slf4j //  Lombok 라이브러리에서 제공하는 어노테이션으로,
// 로깅(logging)을 쉽게 사용할 수 있도록 자동으로 로거(Logger) 객체를 생성해주는 기능을 제공.
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/mobile") //  RESTful API 설계에서 클라이언트 요청의 URL과 컨트롤러의 처리 메서드를 연결하는 역할
@RequiredArgsConstructor // fial 또는 @NonNull 필드만 초기화하는 생성자를 자동 생성.

public class MobileSearchController {
    private final SearchService searchService;

    // 입력받은 검색 값의 결과를 반환하는 API
    @GetMapping("/search")
    public ResponseEntity<List<StoreVO>> mobileSearch(
            @RequestParam("keyword") String keyword) { // 클라이언트에서 "keyword" 파라미터 전달
        try {
            // 서비스 계층에 키워드 전달, 검색 결과 반환
            List<StoreVO> searchResults = searchService.mobileSearch(keyword);

            if (searchResults.isEmpty()) {
                // 검색 결과가 없을 때 No Content 상태 코드 반환
                return ResponseEntity.noContent().build();
            }

            // 검색 결과를 성공 응답으로 반환
            return ResponseEntity.ok(searchResults);
        } catch (Exception e) {
            // 에러 발생 시 Internal Server Error 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
