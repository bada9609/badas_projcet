package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.appoint.AppointBean;
import pack.appoint.AppointDto;
import pack.appoint.AppointInter;


@Controller // 조바다가 수정했습니다.
public class DmAppointSubmitController {
	@Autowired
	private AppointInter appointInter;

	@RequestMapping(value = "dappoint_up", method = RequestMethod.GET)
	public ModelAndView up(@RequestParam("ap_num") String ap_num) {
		AppointDto apdto = appointInter.selectPnum(ap_num);
		
		return new ModelAndView("dappoint_up", "apdto", apdto);
	}
	@RequestMapping(value = "appoint_update", method = RequestMethod.POST)
	public String upsumit(AppointBean apbean) {
		if(appointInter.upData(apbean)) {
			return "redirect:/dappoint_list";
		}else {
			return "error";
		}
	}
}
