package pack.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pack.model.TpBoardDaoInter;
import pack.model.TpDto;

@Controller
public class DmSearchController {
	@Autowired
	private TpBoardDaoInter inter;
	
	@RequestMapping("searchs")
	public ModelAndView searchs(TpBean bean){
		ArrayList<TpDto> list = inter.getSearch(bean);
		
		ModelAndView view = new ModelAndView("tdboard","data",list);
		view.addObject("page", "1");
		return view;
	}
}
