package pack.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.model.Criteria;

@Repository
public class ProductDao extends SqlSessionDaoSupport implements ProductInter {
	
	@Autowired
	public ProductDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	// 상품 삽입 (관리자) 
	@Override
	public boolean insProduct(ProductDto padto) {
		int insProduct = getSqlSession().insert("insertProduct", padto);
		if(insProduct > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	//상품 리스트 불러오기
	@Override
	public List<ProductDto> productList() {
		List<ProductDto> list = getSqlSession().selectList("selectProduct");
		return list;
	}
	
	// 상품 상세보기
	@Override
	public ProductDto searchProduct(String product_id) {
		return getSqlSession().selectOne("productSelect", product_id);
	}
	
	// 상품 수정 카테고리 불러오기 (대분류)
	@Override
	public List<ProductDto> ProductselectList(String product_id){
		List<ProductDto> list = getSqlSession().selectList("productSelect", product_id);
		return list;
	}
	
	// 상품 수정 시 사용
	@Override
	public boolean updateProduct(ProductDto padto) {
		try {
			getSqlSession().update("updateProduct", padto);
			return true;
		} catch (Exception e) {
			System.out.println("updateProductSetD : " + e);
			return false;
		}
	}
	
	//사용자용 상품 불러오기 (대분류)
	@Override
	public List<Map<String, Object>> productGetList(Criteria cri) {
		List<Map<String, Object>> list = getSqlSession().selectList("showproduct", cri);
		return list;
	}
	
	//상품 총갯수 (대분류)
	@Override
	public int productCheck(int product_type) {
		return getSqlSession().selectOne("countproduct", product_type);
	}
	
	//사용자용 상품 불러오기 (중분류)
	@Override
	public int productChecktype2(String product_category) {
		return getSqlSession().selectOne("countproduct2", product_category);
	}
	
	//상품 총갯수 (중분류)
	@Override
	public List<Map<String, Object>> productList(Criteria cri) {
		List<Map<String, Object>> list = getSqlSession().selectList("showproduct2", cri);
		return list;
	}
	
	//상품 상세보기
	@Override
	public List<ProductDto> productdetail(String product_id) {
		List<ProductDto> list = getSqlSession().selectList("productdetail", product_id);
		return list;
	}
}
