package pack.order;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.product.ProductDto;
import pack.shopmember.ShopmemberDto;

@Repository
public class OrderPageDao extends SqlSessionDaoSupport implements OrderPageInter {
	
	@Autowired
	public OrderPageDao(SqlSessionFactory factory) {
		setSqlSessionFactory(factory);
	}
	
	// 주문 페이지 제품 정보 출력
	@Override
	public List<ProductDto> ProductselectList(String product_id) {
		List<ProductDto> list = getSqlSession().selectList("orderprselect", product_id);
		return list;
	}
	
	// 주문 페이지 고객 정보 출력
	@Override
	public List<ShopmemberDto> shopmemberList(String member_id) {
		List<ShopmemberDto> list = getSqlSession().selectList("orderIdselect", member_id);
		return list;
	}

}
