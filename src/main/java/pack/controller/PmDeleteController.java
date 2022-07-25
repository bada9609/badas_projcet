package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.TpBoardDaoInter;

@Service
@Controller
public class PmDeleteController {
	@Autowired
	private TpBoardDaoInter inter;
	
	@RequestMapping("tpdelete")
	public String del(
			@RequestParam(value = "tp_num", required = false) String tp_num,
			@RequestParam(value = "page", required = false) String page){
		if(inter.delete(tp_num))
			return "redirect:/tpboard?page=1";
		else
			return "error";
	}
	
	// 삭제요청
	@RequestMapping("tpdform")
	public String adelform() {
		return "tpdform";
	}
}
