package pack.product;

import java.util.List;

public interface ProductImageInter {
	
	// 제품 이미지 입력
	boolean insMainProduct(ProductImageDto iadto);
	
	// 제품 이미지업데이트 
	boolean updateProduct(ProductImageDto iadto);
	
	// 이미지 전체 삭제
	boolean delete(String product_id);
}
