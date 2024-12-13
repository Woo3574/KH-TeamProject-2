package com.kh.paikbooker.service;

import com.kh.paikbooker.dao.SearchDAO;
import com.kh.paikbooker.vo.StoreVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MobileSearchService {

    private final SearchDAO searchDAO;

    // 키워드로 매장 검색
    public List<StoreVO> mobileSearch(String keyword) {
        // 키워드 처리 로직 (필요하면 트림이나 대소문자 정규화 등 추가 가능)
        String processedKeyword = keyword.trim().toLowerCase();

        // DAO 호출하여 검색 결과 반환
        List<StoreVO> stores = searchDAO.mobileSearchByKeyword(processedKeyword);

        // 각 매장의 주소를 "서초구, 강남구, ~~구" 형태로 가공
        stores.forEach(store -> {
            String address = store.getStoreAddr();
            if (address != null) {
                String formattedAddress = formatAddress(address); // 주소 포맷
                store.setStoreAddr(formattedAddress); // 변환된 주소 설정
            }
        });

        return stores;
    }

    // 주소 데이터를 "구" 단위로 가공하는 메서드
    private String formatAddress(String address) {
        String formattedAddress = "";

        // 주소를 공백 기준으로 분리
        String[] addressParts = address.split(" ");
        for (String part : addressParts) {
            if (part.contains("구")) {
                formattedAddress += part + ", "; // "구"가 포함된 부분을 추가
            }
        }

        // 마지막 쉼표와 공백 제거
        if (formattedAddress.endsWith(", ")) {
            formattedAddress = formattedAddress.substring(0, formattedAddress.length() - 2);
        }

        return formattedAddress;
    }
}
