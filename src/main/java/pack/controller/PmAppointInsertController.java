package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.appoint.AppointBean;
import pack.appoint.AppointInter;

@Controller
public class PmAppointInsertController {
	@Autowired
	private AppointInter appointInter;
	
	//입력값 예약테이블 전송~
	@RequestMapping(value = "appinsert",method = RequestMethod.POST)
	public String submit(Model model, AppointBean apbean) {
		if(appointInter.insData(apbean)) {
			return "redirect:/appoint_list?page=1";
		} else {
			return "error";
		}

	}
}
