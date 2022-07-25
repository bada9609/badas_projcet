package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.doctor.BuserDao;
import pack.doctor.DoctorDao;
import pack.doctor.DoctorDto;
import pack.model.DoctorDaoInter;
import pack.model.PatientDto;

@Controller
public class DmCreateDoctorController {
	@Autowired
	private BuserDao buserDao;
	@Autowired
	private DoctorDaoInter dinter;
	
	@RequestMapping("doctorcreate")
	public Model buserlist(Model model) {
		model.addAttribute("buserdatas", buserDao.buserList());
		return model;
	}
	
	@RequestMapping(value = "doctorinsert", method = RequestMethod.POST)
	public String writeDoctor(Model model, DoctorBean dbean) {
		if(dinter.insDoctor(dbean)){
			return "redirect:/adedit";
		}else {
			return "error";
		}
	}
	//중복체크
		@RequestMapping(value="didcheck", method=RequestMethod.POST)
		@ResponseBody
		public String Adid(@RequestParam("d_id") String d_id){
		      String str = "";
		      DoctorDto ddto;

		      if(dinter.checkdid(d_id) == null) {
		          str = "y";
		       }else {
		    	   ddto = dinter.checkdid(d_id);
		          
		          if(ddto.getD_id().equals(d_id)){ //이미 존재하는 계정
		          str = "n";   
		          }else{   //사용 가능한 계정
		          str = "y";   
		          }
		       }
		      System.out.println(str);
		       return str;

		   }
}
