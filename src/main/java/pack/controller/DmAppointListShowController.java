package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.appoint.AppointDao;
import pack.appoint.AppointDto;
import pack.appoint.AppointInter;
import pack.doctor.DoctorDao;
import pack.doctor.DoctorDto;

@Controller
public class DmAppointListShowController {
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private AppointInter apinter;
	
	@RequestMapping("dappoint_list") //appointlist 호출 후 밑칸에 보여줄 내용 (의사용)
	public Model selectapplist(Model model, HttpSession session) {
		String d_id = (String) session.getAttribute("d_id");
		ArrayList<AppointDto> list = apinter.appointDMyList(d_id);
		
		model.addAttribute("apdata", list);
		return model;
		
	}

}
