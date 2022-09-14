package pack.controller;

import java.util.ArrayList;
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

import pack.category.CategoryDto;
import pack.model.Criteria;
import pack.model.PageMaker;
import pack.order.OrderPageDto;
import pack.order.OrderPageInter;

@Controller
@RequestMapping("/admin/orders")
public class ShopAdminOrderController {
	
	@Autowired
	private OrderPageInter orinter;
	
	@RequestMapping("orderlist")
	public ModelAndView orderpage(ModelAndView mv, HttpSession session, OrderPageDto opd, Criteria cri) {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orinter.adminOrderCheck());
		
		List<OrderPageDto> list = orinter.adminOrderList(cri);
		List<Map<String, Object>> orderlist = new ArrayList<Map<String, Object>>();
		Map<String, Object> datalist = null;
		
		for(OrderPageDto ol : list) {
			datalist = new HashMap<String, Object>();
			datalist.put("order_id", ol.getOrder_id());
			datalist.put("order_regdate", ol.getOrder_regdate());
			datalist.put("order_total_pay", ol.getOrder_total_pay());
			datalist.put("payment_type", ol.getPayment_type());
			datalist.put("order_state", ol.getOrder_state());
			datalist.put("product_name", ol.getProduct_name());
			datalist.put("product_quantity", ol.getProduct_quantity());
			datalist.put("product_size", ol.getProduct_size());
			datalist.put("product_color", ol.getProduct_color());
			datalist.put("order_customer_id", ol.getOrder_customer_id());
			datalist.put("order_customer_name", ol.getOrder_customer_name());
			datalist.put("order_customer_addr", ol.getOrder_customer_addr());
			datalist.put("order_customer_addr2", ol.getOrder_customer_addr2());
			datalist.put("order_customer_addr_detail", ol.getOrder_customer_addr_detail());
			orderlist.add(datalist);
		}
		
		if(!orderlist.isEmpty()) {
			mv.addObject("list", orderlist);
		}else {
			mv.addObject("listcheck", "empty");
		}
		
		mv.addObject("pageMaker", pageMaker);
		mv.setViewName("/admin/orders/orderlist");
		
		return mv;
	
	}
	
	// 주문 수정 페이지 데이터 업데이트 페이지 호출
	@RequestMapping(value = "orderedit", method = RequestMethod.GET)
	public ModelAndView up(@RequestParam("order_id") String order_id) {
		OrderPageDto opdto = orinter.selectOrder(order_id);

		return new ModelAndView("/admin/orders/orderedit", "list", opdto);
	}
	
	// 주문 수정 페이지 데이터 업데이트 페이지 서밋
	@RequestMapping(value = "orderUpdate", method = RequestMethod.POST)
	public String orderupdatesubmit(OrderPageDto opdto) {
		boolean updatedata = orinter.updateOrder(opdto);

		if (updatedata) {
			return "redirect:/admin/orders/orderlist";
		} else {
			return "error";
		}
	}	

}
