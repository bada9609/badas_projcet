package pack.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.coobird.thumbnailator.Thumbnails;
import pack.category.CategoryDao;
import pack.category.CategoryDto;
import pack.product.ProductDto;
import pack.product.ProductImageDao;
import pack.product.ProductImageDto;
import pack.product.ProductImageInter;
import pack.product.ProductInter;
import pack.productType.ProductTypeDto;
import pack.productType.ProductTypeInter;

@Controller
@RequestMapping("/admin/product")
public class ShopAdminProductController {
	
	@Autowired
	private ProductInter painter;
	
	@Autowired
	private ProductImageInter iainter;
	
	@Autowired
	private ProductTypeInter ptinter;
	
	@Autowired
	private CategoryDao cadao;
	
	@Autowired
	private ProductImageDao iadao;
	
	//리스트 페이지 호출
	@RequestMapping("productlist")
	public String listmain() {
	      return "/admin/product/productlist";
	   }

	@RequestMapping("productmainlist")
	@ResponseBody
	public Map<String, Object> productlist(ProductDto padto) {
		List<Map<String, Object>> productdata = new ArrayList<Map<String, Object>>();
		Map<String, Object> data = null;
		
		List<ProductDto> product = painter.productList() ;
		
		for (ProductDto pd : product) {
			data = new HashMap<String, Object>();
			data.put("product_id", pd.getProduct_id());
			data.put("product_type", pd.getProduct_type());
			data.put("product_category", pd.getProduct_category());
			data.put("product_name", pd.getProduct_name());
			data.put("product_price", pd.getProduct_price());
			data.put("product_useYN", pd.getProduct_useYN());
			data.put("product_filename", pd.getMain_image_filename());
			data.put("product_filepath", pd.getMain_image_filepath());
			data.put("product_fileuuid", pd.getMain_image_uuid());
			data.put("product_regdate", pd.getProduct_regdate());

			productdata.add(data);
		}
		
		Map<String, Object> productlist = new HashMap<String, Object>();
		productlist.put("datas", productdata);
		
		return productlist;
	}

	// 인서트 불러오기	
	@RequestMapping("productinsert")
	@ResponseBody
	public Model productinsert(Model model) {
		List<ProductTypeDto> producttypelist = ptinter.ProductTypeList();
		model.addAttribute("product_type", producttypelist);
		return model;
	}
	
	// 중분류 불러오기
	@RequestMapping("product_category")
	@ResponseBody
	public Map<String, Object> selectCategory(@RequestParam("mp_code") String mp_code) {
		List<Map<String, String>> cList = new ArrayList<Map<String, String>>();
	
		Map<String, String> data = null;
		List<CategoryDto> clist = cadao.productSelectList(mp_code);

		for (CategoryDto cd : clist) {
			data = new HashMap<String, String>();
			data.put("category_name", cd.getCategory_name());
			cList.add(data);
		}

		Map<String, Object> producttypelist = new HashMap<String, Object>();
		producttypelist.put("datas", cList);
		
		return producttypelist;
	}
	
	
	// 메인 이미지 업로드 //
	@ResponseBody
	@RequestMapping("uploadAjaxAction")
	public Map<String, Object> uploadAjaxActionPOST(MultipartFile[] product_main_image) {

		String uploadFolder = "G:\\work\\upload";
		
		//폴터 날짜 설정 //
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		// 폴더 생성 //
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 이미저 정보 담는 객체 */
		List<ProductImageDto> List = new ArrayList();
		
		for(MultipartFile multipartFile : product_main_image) {
			System.out.println("-----------------------------------------------");
			System.out.println("파일 이름 : " + multipartFile.getOriginalFilename());
			System.out.println("파일 타입 : " + multipartFile.getContentType());
			System.out.println("파일 크기 : " + multipartFile.getSize());
			
			
			ProductImageDto pidto = new ProductImageDto();
			
			
			// 파일 이름 //
			String uploadFileName = multipartFile.getOriginalFilename();	
			pidto.setMain_image_filename(uploadFileName);
			pidto.setMain_image_filepath(datePath);
			
			// uuid 적용 파일 이름 (파일명 변환기) //
			String uuid = UUID.randomUUID().toString();
			pidto.setMain_image_uuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			
			// 파일 위치, 파일 이름을 합친 File 객체 //
			File saveFile = new File(uploadPath, uploadFileName);
			
			// 파일 저장 //
			try {
				multipartFile.transferTo(saveFile);
				
				// 이미지 썸네일 생성
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			List.add(pidto);
		}
		Map<String, Object> imagedata = new HashMap<String, Object>();
		imagedata.put("data", List);
		
		
		return imagedata;
	}
	
	// 서브 이미지 업로드 //
	@ResponseBody
	@RequestMapping("uploadAjaxActionsub")
	public Map<String, Object> uploadAjaxActionsubPOST(MultipartFile[] product_sub_image) {

		String uploadFolder = "G:\\work\\upload";
		
		//폴터 날짜 설정 //
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		// 폴더 생성 //
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 이미저 정보 담는 객체 */
		List<ProductImageDto> List = new ArrayList();
		
		for(MultipartFile multipartFile : product_sub_image) {
			System.out.println("-----------------------------------------------");
			System.out.println("파일 이름 : " + multipartFile.getOriginalFilename());
			System.out.println("파일 타입 : " + multipartFile.getContentType());
			System.out.println("파일 크기 : " + multipartFile.getSize());
			
			
			ProductImageDto pidto = new ProductImageDto();
			
			
			// 파일 이름 //
			String uploadFileName = multipartFile.getOriginalFilename();	
			pidto.setSub_image_filename(uploadFileName);
			pidto.setSub_image_filepath(datePath);
			
			// uuid 적용 파일 이름 (파일명 변환기) //
			String uuid = UUID.randomUUID().toString();
			pidto.setSub_image_uuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			
			// 파일 위치, 파일 이름을 합친 File 객체 //
			File saveFile = new File(uploadPath, uploadFileName);
			
			// 파일 저장 //
			try {
				multipartFile.transferTo(saveFile);
				
				// 이미지 썸네일 생성
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			List.add(pidto);
		}
		Map<String, Object> imagedata = new HashMap<String, Object>();
		imagedata.put("data", List);
		
		
		return imagedata;
	}
	
	// 신규 제품 등록 form 날리기
	@RequestMapping(value = "insertproduct", method = RequestMethod.POST)
	public String writeProduct(Model model, ProductDto padto, ProductImageDto iadto) {
        
		if(painter.insProduct(padto)){
			String dataresult = padto.getProduct_imageYN();
			System.out.println("체크용 : " + dataresult);
			if(dataresult.equals("N")) {
				return "redirect:productlist";
				
			}else{
				iadto.setProduct_id(padto.getProduct_id());
				if(iainter.insMainProduct(iadto)) {
					return "redirect:productlist";
				}else {
					return "error";
				}
			}
			
		
		}else {
			return "error";
		}
	}
	
	//상세보기 페이지 호출
	@RequestMapping("productselect")
	public ModelAndView selectmain(@RequestParam("product_id") String product_id) {
		ProductDto padto = painter.searchProduct(product_id);
	      return new ModelAndView("/admin/product/productselect", "product_data", padto);
	}	
	
	// 상세보기 및 수정페이지 내부 데이터 호출 용
	@ResponseBody
	@RequestMapping("productdatashow") 
	public Map<String, Object> productdata(@RequestParam("product_id") String product_id, 
			ProductDto padto) {
		List<Map<String, Object>> productShow = new ArrayList<Map<String, Object>>();
		Map<String, Object> datalist = null;
		
		List<ProductDto> product = painter.ProductselectList(product_id);
		
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

			productShow.add(datalist);
		}
		
		Map<String, Object> productshowlist = new HashMap<String, Object>();
		productshowlist.put("datas", productShow);
		
		return productshowlist;
	}
	
	//수정 페이지 호출
	@RequestMapping("productupdate")
	public ModelAndView updateproduct(@RequestParam("product_id") String product_id) {
		ProductDto padto = painter.searchProduct(product_id);
	      return new ModelAndView("/admin/product/productupdate", "product_data", padto);
	}
	
	// 수정 페이지 이미지 삭제 
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
	
		File file = null;
		
		try {
			/* 썸네일 파일 삭제 */
			file = new File("g:\\work\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			file = new File(originFileName);
			
			file.delete();
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
	}
		
	return new ResponseEntity<String>("success", HttpStatus.OK);
}	
	//업데이트 콜
	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String upadteProduct(@RequestParam(value = "product_id", required = false) String product_id, 
			Model model, ProductDto padto, ProductImageDto iadto, HttpSession session) {
        
		if(painter.updateProduct(padto)){
			String dataresult = padto.getProduct_imageYN();
			System.out.println("체크용 : " + dataresult);
			if(dataresult.equals("N")) {
				String mainDel = padto.getMainDel();
				String subDel = padto.getSubDel();
				if(mainDel.equals("Y") || subDel.equals("Y")) {
					if(iainter.delete(product_id)){
						return "redirect:productlist";
					}else {
						return "error";
					}
				}
				return "redirect:productlist";
				
			}else{
				iadto.setProduct_id(padto.getProduct_id());
				if(iainter.updateProduct(iadto)) {
					return "redirect:productlist";
				}else {
					return "error";
				}
			}
		}else {
			return "error";
		}
	}
}
