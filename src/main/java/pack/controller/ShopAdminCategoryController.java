package pack.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pack.admin.AdminBean;
import pack.admin.AdminDto;
import pack.appoint.AppointDto;
import pack.category.CategoryDto;
import pack.category.CategoryInter;
import pack.model.PatientDto;
import pack.productType.ProductTypeDto;
import pack.productType.ProductTypeInter;

@Controller
@RequestMapping("/admin")
public class ShopAdminCategoryController {
	
	//@Autowired
	//private ProductTypeDto ptdto;
	
	//@Autowired
	//private CategoryDto cadto;
	
	@Autowired
	private CategoryInter cainter;
	
	@Autowired
	private ProductTypeInter ptinter;
	
	// 리스트 페이지 노출 용
	@RequestMapping(value = "categorylist", method = RequestMethod.GET)//categorylist 호출 시 밑칸에 보여줄 내용
	public Model selectapplist(Model model) {
		List<CategoryDto> categorydata = cainter.categoryList();
		model.addAttribute("categorydata", categorydata);
		return model;
	}
	
	// 신규 등록 페이지 요청 form 불러오기&&신규 등록 페이지 대분류 노출
	@RequestMapping(value ="categoryinsert", method = RequestMethod.GET)
	@ResponseBody
	public Model goCategoryInsert(Model model) {
		List<ProductTypeDto> producttypelist = ptinter.ProductTypeList();
		model.addAttribute("producttypelist", producttypelist);
		return model;
	}
	
	// 카테고리 신규 등록 페이지 중복 검사
	@RequestMapping(value="categoryCheck", method=RequestMethod.POST)
	@ResponseBody
	public int goCategoryCheck(Model model, @RequestParam("category_name") String category_name,
						@RequestParam("category_type") String category_type){
		  List<CategoryDto> list = cainter.categoryCheck(category_type);
		  String checktext = "";
		  String rawText = "";
		  
		  int c = 0;
		  
		  if(list != null) {
			  for (int i = 0; i<list.size(); i++ ) {
				  checktext = category_name;
				  rawText = list.get(i).getCategory_name();
				  System.out.println("rawText : " + rawText);
				  System.out.println("checktext : " + checktext);
				  if(rawText.equals(checktext)){
					  c = 1;
					  break;
				  }else {
					  c = 0;
				  }
			  }  
		  } else {
			  c = 0;
		  }
	      return c;
	   }
	
	// 신규 페이지 등록 form 날리기
	@RequestMapping(value = "insertcategory", method = RequestMethod.POST)
	public String writeAdmin(Model model, CategoryDto cadto, HttpSession session) {
        
		if(cainter.insCategory(cadto)){
			return "redirect:categorylist";
		}else {
			return "error";
		}
	}

	// 수정 페이지 데이터 업데이트 페이지 호출
	@RequestMapping(value = "categoryedit", method = RequestMethod.GET)
	public ModelAndView up(@RequestParam("category_id") String category_id) {
		CategoryDto cadto = cainter.searchCategory(category_id);

		return new ModelAndView("/admin/categoryedit", "category_data", cadto);
	}
	
	// 수정 페이지 데이터 업데이트 페이지 서밋
	@RequestMapping(value = "categoryupdate", method = RequestMethod.POST)
	public String categorysubmit(CategoryDto cadto) {
		boolean updatedata = cainter.updateCategory(cadto);

		if (updatedata) {
			return "redirect:categorylist";
		} else {
			return "error";
		}
	}	

}
