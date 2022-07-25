package pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.PatientDaoInter;
import pack.model.PatientDto;

@Controller
public class PmMyPageController { // 관리자 환자 불러오기
	// 마이페이지 정보수정 pedit

	@Autowired
	private PatientDaoInter pinter;

	@RequestMapping("pedit")
	public Model pedit(Model model, HttpSession session) {
		String p_id = (String) session.getAttribute("p_id");
		PatientDto pedit = pinter.mydata(p_id);
		model.addAttribute("pedit", pedit);

		return model;

	}

	// 수정
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public ModelAndView up(@RequestParam("p_number") String p_number) {
		PatientDto p_dto = pinter.selectPart(p_number);

		return new ModelAndView("pupform", "p_dto", p_dto);
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String submit(PatientBean p_bean) {
		boolean b = pinter.p_upData(p_bean);

		if (b) {
			return "redirect:/pedit";
		} else {
			return "error";
		}
	}

	// 삭제요청
	@RequestMapping("pdform")
	public String delform() {
		return "pdform";
	}

	// 삭제
	@RequestMapping("delete")
	public String del(HttpSession session) {
		String p_id = (String) session.getAttribute("p_id");
		if (pinter.p_delData(p_id)) {
			session.invalidate();
			return "redirect:/main";
		} else {
			return "error";
		}
	}

}