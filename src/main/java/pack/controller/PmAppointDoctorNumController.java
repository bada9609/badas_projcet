package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.doctor.DoctorDao;
import pack.doctor.DoctorDto;

@Controller
public class PmAppointDoctorNumController {
	@Autowired
	private DoctorDao doctorDao;
	
	// 의사불러오기번호..
	@RequestMapping(value = "doctor_no", method = RequestMethod.GET)
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
