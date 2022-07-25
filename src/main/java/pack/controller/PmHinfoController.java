package pack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PmHinfoController {
	//병원안내
	//병원소개 hinfo
	@RequestMapping("hinfo")
	public String hinfo() {
		return "hinfo";
	}
	
	//연혁 hyear
	@RequestMapping("hyear")
	public String hyear(){
		return "hyear";
	}
	
	//조직도 hmap
	@RequestMapping("hmap")
	public String hmap(){
		return "hmap";
	}
	
	//오시는길 hroad
	@RequestMapping("hroad")
	public String hroad(){
		return "hroad";
	}
}
