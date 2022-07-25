package pack.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.TpBoardDaoInter;
import pack.model.TpDto;


@Controller
public class PmHomeDoctorController {
	
	@Autowired
	private TpBoardDaoInter tpinter;
	
	//페이징
	private int tot;
	private int plist = 10;
	private int pageSu;
	

	
	public ArrayList<TpDto> getList(ArrayList<TpDto> list, int page){
		ArrayList<TpDto> result = new ArrayList<TpDto>();
		int start = (page - 1) * plist;
		int size = plist <= list.size() - start?plist:list.size() - start;
		
		for (int i = 0; i < size; i++) {
			result.add(i, list.get(start + i));
		}
		return result;
	}
	
	public int getPageSu() {  //총 페이지 수
		pageSu = tot / plist;
		if(tot % plist > 0) pageSu += 1;
		return pageSu;
	}
	
	
	//tpboard.jsp
	@RequestMapping("tpboard")
	public Model process(Model model, HttpSession session, @RequestParam("page")int page
			) {
		tot = tpinter.totalCnt();	//전체 레코드수
		
		String p_id = (String) session.getAttribute("p_id");
		System.out.println(p_id);
		ArrayList<TpDto> list = tpinter.getMyList(p_id);
		ArrayList<TpDto> result = new ArrayList<TpDto>();
		result = getList(list, page);
		
		
		model.addAttribute("data", result);
		model.addAttribute("pageSu", getPageSu());
		model.addAttribute("page", page);
		
		
		
		return model;
	}


}
