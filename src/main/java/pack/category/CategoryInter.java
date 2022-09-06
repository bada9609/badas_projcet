package pack.category;

import java.util.List;

public interface CategoryInter {
	
	//카테고리 전체 리스트 출력
	List<CategoryDto> categoryList();
	
	// 카테고리 대분류 리스트 출력
	List<CategoryDto> categorySelectList(String mp_code);
	
	// 카테고리 중복 입력 확인 (mp_code로 1차 확인용)
	List<CategoryDto> categoryCheck(String category_type);
	
	// 카테고리 내용 입력
	boolean insCategory(CategoryDto cadto);
	
	//카테고리 수정 내용 불러오기 (기존 등록된 데이터 불러오는 것)
	CategoryDto searchCategory(String category_id);
	
	//카테고리 업데이트 데이터 폼 전송
	boolean updateCategory(CategoryDto cadto);
	
	//상품 입력용 카테고리 중분류 출력
	List<CategoryDto> productSelectList(String mp_code);
	
}
