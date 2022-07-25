package pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.model.PatientDaoImpl;
import pack.model.PatientDaoInter;
import pack.model.PatientDto;


@Controller
public class PinsertController {
	@Autowired
	private PatientDaoInter pinter;
	

	
	

	@RequestMapping(value = "pinsert", method = RequestMethod.GET) 
	public String pinsert() {
		return "pinsert";
	}
	

	//중복체크
	@RequestMapping(value="idcheck", method=RequestMethod.POST)
	@ResponseBody
	public String AjaxView (  @RequestParam("p_id") String p_id){
	      String str = "";
	      PatientDto pdto;

	      if(pinter.mydata(p_id) == null) {
	          str = "y";
	       }else {
	          pdto = pinter.mydata(p_id);
	          
	          if(pdto.getP_id().equals(p_id)){ //이미 존재하는 계정
	          str = "n";   
	          }else{   //사용 가능한 계정
	          str = "y";   
	          }
	       }
	      System.out.println(str);
	       return str;

	   }

	
	@RequestMapping(value="patientinsert", method = RequestMethod.POST)
	public String process(Model model, PatientDto pdto) {
		if(pinter.insert(pdto))
			return "redirect:/loginform";
		else
			return "error";
	}
	
	

}
