package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.TpBoardDaoInter;

@Controller
public class TdDetailController {
	@Autowired
	private TpBoardDaoInter inter;
	
	@RequestMapping("tdboard_detail")
	public Model detail(
			Model model, 
			@RequestParam(value = "tp_num", required = false) String tp_num,
			@RequestParam(value = "page", required = false) String page){
		inter.updateReadcnt(tp_num);
		model.addAttribute("data", inter.getDetail(tp_num));
		model.addAttribute("page", page);
		
		return model;
	}
}
