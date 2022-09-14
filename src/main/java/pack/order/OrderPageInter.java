package pack.order;

import java.util.List;
import java.util.Map;

import pack.category.CategoryDto;
import pack.model.Criteria;
import pack.product.ProductDto;
import pack.shopmember.ShopmemberDto;

public interface OrderPageInter {
	
	//제품 구매 페이지 제품 정보 불러오기
	List<ProductDto> ProductselectList(String product_id);
	
	//제품 구매 페이지 고객 정보 불러오기
	List<ShopmemberDto> shopmemberList(String member_id);
	
	//제품 구매 form 날리기
	boolean insOrder(OrderPageDto opdto);
	
	//마이페이지 고객 주문횟수 불러오기
	List<OrderPageDto> PaymentList(String order_customer_id);
	
	//마이페이지 고객 주문 내용 불러오기
	List<OrderPageDto>OrderList(Criteria cri);
	
	//고객 주문  갯수 불러오기
	public int orderCheck(String order_customer_id);
	
	//고객 주문 결정 진행
	boolean confrimOrder(String order_id);
	
	//어드민 고객 주문 내용 불러오기
	List<OrderPageDto>adminOrderList(Criteria cri);
	
	//어드민 주문 횟수 불러오기
	public int adminOrderCheck();
	
	//어드민 주문 수정 불러오기
	OrderPageDto selectOrder(String order_id);
	
	//어드민 수정 진행
	boolean updateOrder(OrderPageDto opdto);
	
	
}
