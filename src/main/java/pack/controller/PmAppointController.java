package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.appoint.AppointBean;
import pack.appoint.AppointDao;
import pack.appoint.AppointDto;
import pack.appoint.AppointInter;
import pack.doctor.BuserDto;
import pack.doctor.DoctorDao;
import pack.doctor.DoctorDto;
import pack.model.PatientDaoImpl;
import pack.model.PatientDaoInter;
import pack.model.PatientDto;
import pack.model.TpDto;

@Controller
public class PmAppointController {
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private AppointDao appointDao;
	
	@Autowired
	private AppointInter apinter;
	
	@Autowired
	private PatientDaoInter tpinter;
	
	// 방문예약
	@RequestMapping(value = "appoint", method = RequestMethod.GET)
	public Model buserlist(HttpSession session ,Model model) {
		//환자 정보 가져오기
		String p_id = (String) session.getAttribute("p_id");
		System.out.println(p_id);
		PatientDto mp = tpinter.mydata(p_id);
		model.addAttribute("pdata", mp);
		//
		
		model.addAttribute("classdatas", doctorDao.ClassList());
		return model;
	}

	// 의사불러오기
	@RequestMapping("doctor")
	@ResponseBody
	public Map<String, Object> selectDoctor(@RequestParam("c_class") String c_class) {
		List<Map<String, String>> dList = new ArrayList<Map<String, String>>();
		
		
		Map<String, String> data = null;
		List<DoctorDto> dlist = doctorDao.DoctorList(c_class);

		for (DoctorDto d : dlist) {
			data = new HashMap<String, String>();
			data.put("d_name", d.getD_name());
			dList.add(data);
		}

		Map<String, Object> doctors = new HashMap<String, Object>();
		doctors.put("datas", dList);
		return doctors;
	}

	// 진료예약 리스트(환자확인) appoint_list
	@RequestMapping("appoint_list")
	public Model appoint_list(Model model, HttpSession session) {
		
		//tot = apinter.totalCnt();	//전체 레코드수
		String p_id = (String) session.getAttribute("p_id");
		System.out.println(p_id);
		ArrayList<AppointDto> list = apinter.appointMyList(p_id);
		
		model.addAttribute("apdata", list);
		//model.addAttribute("pageSu", getPageSu());
		//model.addAttribute("page", page);
		return model;
	}
	
}
