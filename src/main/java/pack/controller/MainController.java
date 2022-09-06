package pack.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.productType.ProductTypeDto;
import pack.productType.ProductTypeInter;

@Controller
public class MainController {
	
	@Autowired
	private ProductTypeInter ptinter;

	@RequestMapping("main")
	public String main() {
		return "main";
	}
   
   
	/* 이미지 출력 */
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		
		File file = new File("f:\\work\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	@RequestMapping("/maintype")
	@ResponseBody
	public Map<String, Object> maintype(ProductTypeDto ptdto) {
		List<Map<String, Object>> maindata = new ArrayList<Map<String, Object>>();
		Map<String, Object> data = null;
		
		List<ProductTypeDto> producttypelist = ptinter.ProductTypeList();
		
		for(ProductTypeDto pyd : producttypelist ) {
			data = new HashMap<String, Object>();
			data.put("mp_name", pyd.getMp_name());
			data.put("mp_code", pyd.getMp_code());
			
			maindata.add(data);
		}
		
		Map<String, Object> maintype = new HashMap<String, Object>();
		maintype.put("datas", maindata);
		
		return maintype;
	}
	
}