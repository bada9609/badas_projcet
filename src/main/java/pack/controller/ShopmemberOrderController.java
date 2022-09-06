package pack.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.order.OrderPageDto;
import pack.order.OrderPageInter;
import pack.product.ProductDto;
import pack.shopmember.ShopmemberDto;
import pack.shopmember.ShopmemberInter;

@RequestMapping("/order")
@Controller
public class ShopmemberOrderController {
	
	@Autowired
	private OrderPageInter orinter;

	
	//주문 페이지 이동
	@RequestMapping(value = "productorder", method = RequestMethod.POST)
	public ModelAndView orderpage(ModelAndView mv, HttpSession session, OrderPageDto opd,
								 @RequestParam("product_id") String product_id,
								 @RequestParam("size_value") String size_value,
								 @RequestParam("color_value") String color_value,
								 @RequestParam("product_quantity") int product_quantity){
		// 고객 정보 내용
		String member_id = (String)session.getAttribute("member_id");
		List<ShopmemberDto> mlist = orinter.shopmemberList(member_id);
		
		String member_name = mlist.get(0).getMember_name();
		String member_addr = mlist.get(0).getMember_addr();
		String member_addr2 = mlist.get(0).getMember_addr2();
		String member_email = mlist.get(0).getMember_email();
		String member_number = mlist.get(0).getMember_number();
		
		//제품 정보 내용
		List<ProductDto> plist = orinter.ProductselectList(product_id);
		int product_price = plist.get(0).getProduct_price(); 
		int total_price =  product_price * product_quantity;
		String product_name = plist.get(0).getProduct_name();
		
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("product_id", product_id);
		datas.put("size_value", size_value);
		datas.put("color_value", color_value);
		datas.put("product_quantity", product_quantity);
		datas.put("total_price", total_price);
		datas.put("product_name", product_name);
		datas.put("member_id", member_id);
		datas.put("member_name", member_name);
		datas.put("member_addr", member_addr);
		datas.put("member_addr2", member_addr2);
		datas.put("member_email", member_email);
		datas.put("member_number", member_number);
		
		mv.addObject("datas", datas);
		mv.setViewName("/order/order");
		
		System.out.println("데이터 체크 : " + datas);
		return mv;
	}
	
}
