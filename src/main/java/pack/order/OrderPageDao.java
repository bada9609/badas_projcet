package pack.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pack.model.Criteria;
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
	
	//고객 주문 form 날리기
	@Override
	public boolean insOrder(OrderPageDto opdto) {
		int insOrder = getSqlSession().insert("insertOrder", opdto);
		if(insOrder > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	//마이페이지  주문 횟수 불러오기
	@Override
	public List<OrderPageDto> PaymentList(String order_customer_id) {
		List<OrderPageDto> list = getSqlSession().selectList("countPaymentType", order_customer_id);
		return list;
	}
	
	// 마이페이지 주문 내용 불러오기
	@Override
	public List<OrderPageDto> OrderList(Criteria cri) {
		List<OrderPageDto> list = getSqlSession().selectList("selectOrderProduct", cri);
		return list;
	}
	
	// 마이페이지 주문 갯수 불러오기
	@Override
	public int orderCheck(String order_customer_id) {
		return getSqlSession().selectOne("countorder_customer", order_customer_id);
	}
	
	// 마이페이지 주문 구매 결정
	@Override
	public boolean confrimOrder(String order_id) {
		try {
			getSqlSession().update("orderconfirms", order_id);
			return true;
		} catch (Exception e) {
			System.out.println("updateCategorySetD : " + e);
			return false;
		}
	}
	
	//어드민 주문 목록 불러오기
	@Override
	public List<OrderPageDto> adminOrderList(Criteria cri) {
		List<OrderPageDto> list = getSqlSession().selectList("adminSelectOrder", cri);
		return list;
	}
	
	//어드민 주문 갯수 불러오기
	@Override
	public int adminOrderCheck() {
		return getSqlSession().selectOne("countorder");
	}
	
	//어드민 주문 상세보기
	@Override
	public OrderPageDto selectOrder(String order_id) {
		return getSqlSession().selectOne("orderSelect", order_id);
	}
	
	//어드민 주문 상태 수정
	@Override
	public boolean updateOrder(OrderPageDto opdto) {
		try {
			getSqlSession().update("updateOrder", opdto);
			return true;
		} catch (Exception e) {
			System.out.println("updateCategorySetD : " + e);
			return false;
		}
	}

}
