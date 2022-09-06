package pack.product;

import java.util.List;
import java.util.Map;

import pack.model.Criteria;

public interface ProductInter {
	
	// 제품 내용 입력
	boolean insProduct(ProductDto padto);
	
	// 제품 전체 리스트 출력
	List<ProductDto> productList();
	
	// 제품 상세보기
	ProductDto searchProduct(String product_id);
	
	// 제품 상세보기 아작스
	List<ProductDto> ProductselectList(String product_id);
	
	// 제품 업데이트 
	boolean updateProduct(ProductDto padto);
	
	//고객용 전체 리스트  출력
	List<Map<String, Object>> productGetList(Criteria cri);
	
	// 상품 갯수 불러오기
	public int productCheck(int product_type);
	
	//고객용 전체 리스트  출력2
	List<Map<String, Object>> productList(Criteria cri);
	
	// 상품 갯수 불러오기2
	public int productChecktype2(String product_category);
	
	//상품 상세보기
	List<ProductDto> productdetail(String product_id);
}
