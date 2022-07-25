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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.doctor.DoctorDao;
import pack.doctor.DoctorDto;
import pack.model.PatientDaoInter;
import pack.model.PatientDto;
import pack.model.TpBoardDaoInter;


@Controller
public class TpInsertController {
	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private TpBoardDaoInter tpinter;

	@Autowired
	private PatientDaoInter tpainter;

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String def(Model model, TpBean bean) {

		int newNum = tpinter.currentNum() + 1;

		// bean.setNum(newNum);
		bean.setGnum(newNum);

		if (tpinter.insert(bean))
			return "redirect:/tpboard?page=1";
		else
			return "error";
	}

	//////////////////////

	// 홈닥터 신청 메인
	@RequestMapping(value = "tpboard_insert", method = RequestMethod.GET)
	public Model buserlist(HttpSession session, Model model) {
		// 환자 정보 가져오기
		String p_id = (String) session.getAttribute("p_id");
		System.out.println(p_id);
		PatientDto mp = tpainter.mydata(p_id);
		model.addAttribute("pdata", mp);
		//

		model.addAttribute("classdatas", doctorDao.ClassList ());
		return model;
	}

	// 의사불러오기
	@RequestMapping("doctors")
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

	// 의사번호 넘기기
	@RequestMapping(value = "doctor_nos", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> selectDoctor_no(@RequestParam("d_name") String d_name) {
		List<Map<String, String>> dnList = new ArrayList<Map<String, String>>();

		Map<String, String> ddata = null;
		List<DoctorDto> dnlist = doctorDao.DoctorNumber(d_name);

		for (DoctorDto d : dnlist) {
			ddata = new HashMap<String, String>();
			ddata.put("d_number", d.getD_number());
			dnList.add(ddata);
		}

		Map<String, Object> doctorsnum = new HashMap<String, Object>();
		doctorsnum.put("ddatas", dnList);
		return doctorsnum;
	}

}
