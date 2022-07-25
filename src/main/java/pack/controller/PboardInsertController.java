package pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pack.board.BoardBean;
import pack.board.BoardDto;
import pack.board.BoardInter;
import pack.model.PatientDaoInter;
import pack.model.PatientDto;

@Controller
public class PboardInsertController {
	
	@Autowired
	private BoardInter boardInter;
	
	@Autowired
	private PatientDaoInter tpinter;
	
	//입력창 불러오기
	@RequestMapping(value = "pboardInsert", method = RequestMethod.GET)
	public ModelAndView insertForm(HttpSession session, ModelAndView mv) {
		
		String p_id = (String) session.getAttribute("p_id");
		PatientDto pd = tpinter.mydata(p_id);
		mv.addObject("pdata", pd);
		return mv;
	}
	
	@RequestMapping(value = "insertPboard", method = RequestMethod.POST)
	public String insertAction(ModelAndView mv, BoardBean bbean, MultipartFile[] file) {
		if(boardInter.insBoard(bbean)) {
			return "redirect:/pboardList?page=1";
		} else {
			return "error";
		}
	}
	
}
