package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.Criteria;
import pack.model.PageMaker;
import pack.order.OrderPageDto;
import pack.order.OrderPageInter;
import pack.product.ProductDto;
import pack.product.ProductInter;
import pack.shopmember.ShopmemberDto;

@Controller
@RequestMapping("/mypage")
public class ShopmemberMypageController {
	
	@Autowired
	private OrderPageInter orinter;
	
	@Autowired
	private ProductInter painter;
	
	@RequestMapping("mypage")
	public ModelAndView main(ModelAndView mv, HttpSession session, OrderPageDto opd) {
		
		String order_customer_id = (String)session.getAttribute("member_id");
				
		List<OrderPageDto> payList = orinter.PaymentList(order_customer_id);
		System.out.println(payList);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		Map<String, Object> datas = null;
		Map<String, Object> datas2 = null;
		
		
		List<ShopmemberDto> memberList = orinter.shopmemberList(order_customer_id);
		
		for(ShopmemberDto ml : memberList) {
			datas2 = new HashMap<String, Object>();
			datas2.put("member_point", ml.getMember_point());
			
			list2.add(datas2);
		}
		
		
		for(int i=0; i<payList.size(); i++) {
			int paytype1 = payList.get(i).getPayment_type1(); 
			int paytype2 = payList.get(i).getPayment_type2();
			int paytype3 = payList.get(i).getPayment_type3();
			
			datas = new HashMap<String, Object>();
			datas.put("payment_type1", paytype1);
			datas.put("payment_type2", paytype2);
			datas.put("payment_type3", paytype3);
			
			list.add(datas);
		}
				
		
		mv.addObject("datas", list);
		mv.addObject("datas2", list2);
		mv.setViewName("/mypage/mypage");
		
		return mv;
	}
	
	//마이 오더 부분 입력
	@RequestMapping("myorder")
	public ModelAndView myorderlist(ModelAndView mv, HttpSession session, OrderPageDto opd, Criteria cri) {
		
		String order_customer_id = (String)session.getAttribute("member_id");
	
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orinter.orderCheck(order_customer_id));
		
		List<OrderPageDto> list = orinter.OrderList(cri);
		List<Map<String, Object>> orderlist = new ArrayList<Map<String, Object>>();
		Map<String, Object> datalist = null;
		
		for(int i = 0; i<list.size(); i++) {
			if(list.get(i).getOrder_customer_id().equals(order_customer_id)) {
				datalist = new HashMap<String, Object>();
				datalist.put("order_id", list.get(i).getOrder_id());
				datalist.put("order_regdate", list.get(i).getOrder_regdate());
				datalist.put("order_total_pay", list.get(i).getOrder_total_pay());
				datalist.put("payment_type", list.get(i).getPayment_type());
				datalist.put("order_state", list.get(i).getOrder_state());
				datalist.put("product_name", list.get(i).getProduct_name());
				datalist.put("product_quantity", list.get(i).getProduct_quantity());
				orderlist.add(datalist);
			}
		}
		System.out.println("orderlist:"+orderlist);
		
		if(!orderlist.isEmpty()) {
			mv.addObject("list", orderlist);
		}else {
			mv.addObject("listcheck", "empty");
		}
		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("/mypage/myorder");
		
		return mv ;
	}
	
	//구매 결정
	@RequestMapping("orderconfirm")
	public String orderform() {
		return "/mypage/orderconfirm";
	}
	
	// 삭제
	@RequestMapping("orderconfirms")
	public String del(@RequestParam("order_id") String order_id) {
		if (orinter.confrimOrder(order_id)) {
			return "redirect:/mypage/myorder";
		} else {
			return "error";
		}
	}
	
}
