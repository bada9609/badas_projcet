package pack.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.TdBoardDaoInter;
import pack.model.TdDto;
import pack.model.TpDto;

@Controller
public class DmHomeDoctorController {

	@Autowired
	private TdBoardDaoInter tdinter;
	
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
		
		// tdboard.jsp
				@RequestMapping("tdboard")
				public Model process1(Model model, HttpSession session, @RequestParam("page") int page) {
					tot = tdinter.totalCnt(); // 전체 레코드수
					
					String d_id = (String) session.getAttribute("d_id");

					ArrayList<TpDto> list = tdinter.getMyList(d_id);
					ArrayList<TpDto> result = new ArrayList<TpDto>();
					result = getList(list, page);

					model.addAttribute("data", result);
					model.addAttribute("pageSu", getPageSu());
					model.addAttribute("page", page);

					return model;
				}
}
