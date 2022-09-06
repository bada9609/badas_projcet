package pack.order;

import java.util.List;

import pack.product.ProductDto;
import pack.shopmember.ShopmemberDto;

public interface OrderPageInter {

	//제품 구매 페이지 제품 정보 불러오기
	List<ProductDto> ProductselectList(String product_id);
	
	//제품 구매 페이지 고객 정보 불러오기
	List<ShopmemberDto> shopmemberList(String member_id);
}
