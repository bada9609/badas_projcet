package pack.model;

import java.util.List;

import javax.servlet.http.HttpSession;

import pack.controller.PatientBean;

public interface AdminDaoInter {

	// 로그인
	List<AdminDto> adminList();

	AdminDto getAdminData(String a_id);

	// 로그아웃
	void alogout(HttpSession session);

	// 환자 정보 가져오기
	PatientDto selectPart(String p_number);
	
	//환자 수정
	boolean updatePatient(PatientBean p_bean);
	
	// 환자 삭제
	boolean ap_delData(String p_number);
	
	//의사 삭제
	boolean ap_ddelData(String d_number);
	

}
