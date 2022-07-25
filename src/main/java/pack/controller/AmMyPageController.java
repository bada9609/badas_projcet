package pack.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.doctor.DoctorDto;
import pack.model.AdminDaoInter;
import pack.model.DoctorDaoInter;
import pack.model.PatientDaoInter;
import pack.model.PatientDto;

@Controller
public class AmMyPageController { // 관리자 환자 불러오기
	// 마이페이지 정보수정 pedit

	@Autowired
	private PatientDaoInter pinter;

	@Autowired
	private AdminDaoInter ainter;
	
	@Autowired
	private DoctorDaoInter dinter;
	
	//관리페이지
	@RequestMapping("alist")
	   public String alist() {
	      return "alist";
	   }
	
	//회원정보 출력 --------------------------------------------------
	@RequestMapping("aedit")
	public ModelAndView pedit() {
		return new ModelAndView("aedit", "aedit", pinter.getDataAll());
	}

	// 수정
	@RequestMapping(value = "aupdate", method = RequestMethod.GET)
	public ModelAndView up(@RequestParam("p_number") String p_number) {
		PatientDto pdto = ainter.selectPart(p_number);

		return new ModelAndView("a_pupform", "pdto", pdto);
	}

	@RequestMapping(value = "aupdate", method = RequestMethod.POST)
	public String submit(PatientBean p_bean) {
		boolean b = ainter.updatePatient(p_bean);

		if (b) {
			return "redirect:/aedit";
		} else {
			return "error";
		}
	}

	// 삭제요청
	@RequestMapping("adform")
	public String adelform() {
		return "adform";
	}

	// 삭제
	@RequestMapping("adelete")
	public String del(@RequestParam("p_number") String p_number) {
		if (ainter.ap_delData(p_number)) {
			return "redirect:/aedit";
		} else {
			return "error";
		}
	}
	
	// 의사정보 출력 -------------------------------------------------
	@RequestMapping("adedit")
	public Model adedit(Model model) {
		
		List<DoctorDto> list = dinter.doctorList();
		
		model.addAttribute("ddata", list);
		
		return model;
		
	}
	
	// 수정
		@RequestMapping(value = "adupdate", method = RequestMethod.GET)
		public ModelAndView dup(@RequestParam("d_number") String d_number) {
			DoctorDto ddto = dinter.selectDoctor(d_number);

			return new ModelAndView("dupform", "ddto", ddto);
		}

		@RequestMapping(value = "adupdate", method = RequestMethod.POST)
		public String update(DoctorBean dbean) {
			boolean b = dinter.updateDoctor(dbean);

			if (b) {
				return "redirect:/adedit";
			} else {
				return "error";
			}
		}


		// 삭제요청
		@RequestMapping("d_adform")
		public String addelform() {
			return "d_adform";
		}

		// 삭제
		@RequestMapping("addelete")
		public String d_del(@RequestParam("d_number") String d_number) {
			if (ainter.ap_ddelData(d_number)) {
				return "redirect:/adedit";
			} else {
				return "error";
			}
		}
	
	
}