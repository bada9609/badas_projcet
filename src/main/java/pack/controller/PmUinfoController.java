package pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PmUinfoController {
	
	//이용안내
	//진료안내 tinfo
	@RequestMapping("tinfo")
	public String tinfo() {
		return "tinfo";
	}
	
	//층별안내 tfloor
	@RequestMapping("tfloor")
	   public String tfloor() {
	      return "tfloor";
	   }
	
	//결제안내 tpay
	@RequestMapping("tpay")
	   public String tpay() {
	      return "tpay";
	   }
	
	 @RequestMapping("tpay_tel")
	   public String tpay_tel() {
	      return "tpay_tel";
	   }
	
	
}
