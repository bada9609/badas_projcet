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
import org.springframework.web.servlet.ModelAndView;

import pack.category.CategoryDao;
import pack.category.CategoryDto;
import pack.model.Criteria;
import pack.model.PageMaker;
import pack.order.OrderPageDto;
import pack.product.ProductDto;
import pack.product.ProductImageDao;
import pack.product.ProductImageInter;
import pack.product.ProductInter;
import pack.productType.ProductTypeInter;

@RequestMapping("/product")
@Controller
public class ShopmemberProductController {
	
	@Autowired
	private ProductInter painter;
	
	@Autowired
	private ProductImageInter iainter;
	
	@Autowired
	private ProductTypeInter ptinter;

	@Autowired
	private ProductImageDao iadao;
	
	@Autowired
	private CategoryDao cadao;
	
	//상품 리스트 페이지 (전체 호출)
	@RequestMapping("shopproductlist") 
	public ModelAndView productlist(@RequestParam("product_type") int product_type, 
									Criteria cri) {
		
		ModelAndView mv = new ModelAndView("/product/shopproductlist");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(painter.productCheck(product_type));
		
		List<Map<String, Object>> list = painter.productGetList(cri);
		mv.addObject("list", list);
		mv.addObject("pageMaker", pageMaker);
		
		return mv;
	}
	
	// 중분류 불러오기
	@RequestMapping("/category")
	@ResponseBody
	public Map<String, Object> selectCategory(@RequestParam("mp_code") String mp_code) {
		List<Map<String, String>> cList = new ArrayList<Map<String, String>>();
		
		System.out.println("호출은된다?");
		
		Map<String, String> data = null;
		List<CategoryDto> clist = cadao.productSelectList(mp_code);

		for (CategoryDto cd : clist) {
			data = new HashMap<String, String>();
			data.put("category_name", cd.getCategory_name());
			cList.add(data);
		}

		Map<String, Object> typelist = new HashMap<String, Object>();
		typelist.put("datas", cList);
		
		return typelist;
	}
	
	//상품 리스트 페이지 (중분류 기준 노출)
	@RequestMapping("shopproduct") 
	public ModelAndView product(@RequestParam("product_type") int product_type,
								@RequestParam("product_category") String product_category,
									Criteria cri) {
		
		ModelAndView mv = new ModelAndView("/product/shopproduct");
		PageMaker pageMaker = new PageMaker();
		cri.setProduct_category(product_category);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(painter.productChecktype2(product_category));
		
		List<Map<String, Object>> list = painter.productList(cri);
		mv.addObject("list", list);
		mv.addObject("pageMaker", pageMaker);
		System.out.println("pagemaker 확인 : " + pageMaker.getTotalCount());
		System.out.println("category : " + list);
		
		return mv;
	}
	
	//상품 상세보기 노출페이지
	@RequestMapping("productdetail")
	public Map<String, Object> productdetail(@RequestParam("product_id") String product_id, 
			ProductDto padto) {
		List<Map<String, Object>> productshowup = new ArrayList<Map<String, Object>>();
		Map<String, Object> datalist = null;
		
		List<ProductDto> product = painter.productdetail(product_id);
		
		for (ProductDto pd : product) {
			datalist = new HashMap<String, Object>();
			datalist.put("product_id", pd.getProduct_id());
			datalist.put("product_type", pd.getProduct_type());
			datalist.put("product_category", pd.getProduct_category());
			datalist.put("product_name", pd.getProduct_name());
			datalist.put("product_price", pd.getProduct_price());
			datalist.put("product_useYN", pd.getProduct_useYN());
			datalist.put("product_mainfilename", pd.getMain_image_filename());
			datalist.put("product_mainfilepath", pd.getMain_image_filepath());
			datalist.put("product_mainfileuuid", pd.getMain_image_uuid());
			datalist.put("product_subfilename", pd.getSub_image_filename());
			datalist.put("product_subfilepath", pd.getSub_image_filepath());
			datalist.put("product_subfileuuid", pd.getSub_image_uuid());
			datalist.put("product_regdate", pd.getProduct_regdate());
			datalist.put("product_maintext", pd.getProduct_maintext());
			datalist.put("product_subtext", pd.getProduct_subtext());
			datalist.put("product_size", pd.getProduct_size());
			datalist.put("product_color", pd.getProduct_color());

			productshowup.add(datalist);
		}
		
		Map<String, Object> productdetail = new HashMap<String, Object>();
		productdetail.put("datas", productshowup);
		
		return productdetail;
	}

}
